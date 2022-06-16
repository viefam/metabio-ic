import Error "mo:base/Error";
import Types "./types";
import PlantMeta "./plantmeta";
import PlantMetadata "./plantmetadata";
import Reward "./reward";
import Rewards "./rewards";

actor MetaBio {

	public type PlantMeta = Types.PlantMeta;
	type RewardStatus = Types.UserRewardStatus;
	type UserReward = Types.UserReward;

	stable var min_length_ = 50; // Mimimum plant growth to get reward.
	stable var reward_for_valid_data = 100; 

	flexible var plantmetadata : PlantMetadata.PlantMetadata = PlantMetadata.PlantMetadata();
	flexible var rewards : Rewards.Rewards = Rewards.Rewards();

	public shared(msg) func contributePlantMeta(plant: Text, created_at: Nat, plant_length: Nat, front_img: Text, back_img: Text, left_img: Text, right_img: Text) : async Nat {
		let images = [front_img, back_img, left_img, right_img];
		let plantMetaId = plantMetaCounter.generate_new_id();
		let plantmeta = PlantMeta.PlantMeta(plantMetaId, plant, created_at, plant_length, images);
		plantmetadata.add(plantmeta);
		let isValidPlantMeta = auditPlantmeta(plantMetaId);
		if (isValidPlantMeta == true) {
			let rewardId = rewardCounter.generate_new_id();
			let reward = Reward.Reward(rewardId, msg.caller, plantMetaId, reward_for_valid_data, #pending);
			rewards.add(reward);
		};
		plantmeta.get_id();
	};

	public func getPlantmeta(id: Nat) : async PlantMeta {
		switch (plantmetadata.get(id)) {
			case (null) { 
				throw Error.reject("No metadata for plant")
			};
      			case (?plantmeta) {
				{
					id = plantmeta.get_id();
					created_at = plantmeta.get_created_at(); 
					plant = plantmeta.get_plant();
					plant_length = plantmeta.get_plant_length();
					images = plantmeta.get_images(); 	
				}
			}
    		}
	};

	public shared(msg) func displayReward(id: Nat) : async UserReward {
		switch (rewards.get(id)) {
			case (null) {
				throw Error.reject("Cannot find the reward")
			};
			case (?reward) {
				let user_ = reward.get_user();
				if (user_ != msg.caller) {
					throw Error.reject("No reward at all")
				};

				{
					id = reward.get_id();
					user = user_;
					rewards = reward.get_rewards();
					status = reward.get_status();
					plantMeta = reward.get_plant_meta();
				}
			}
		};
	};

	public shared(msg) func withdrawReward(id: Nat) : async Nat {
		
	}

	public func auditPlantmeta(id: Nat) : async Bool {
		switch (plantmetadata.get(id)) {
			case (null) { 
				throw Error.reject("No metadata for plant")
			};
      			case (?plantmeta) {
				let length = plantmeta.get_plant_length();
				if(length > min_length_) {
					return true;
				};

				false
			}
    		}
	};

	flexible object plantMetaCounter = {
		var count = 0;
		public func generate_new_id() : Nat { let id = count; count += 1; id };
		public func get_total() : Nat { count };
	};

	flexible object rewardCounter = {
		var count = 0;
		public func generate_new_id() : Nat { let id = count; count += 1; id };
		public func get_total() : Nat { count };
	};
}