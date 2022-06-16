import Error "mo:base/Error";
import Types "./types";
import PlantMeta "./plantmeta";
import PlantMetadata "./plantmetadata";
import Rewards "./rewards";

actor MetaBio {

	public type PlantMeta = Types.PlantMeta;

	stable var min_length_ = 50; // Mimimum plant growth to get reward.

	flexible var plantmetadata : PlantMetadata.PlantMetadata = PlantMetadata.PlantMetadata();
	public shared(msg) func contributePlantMeta(plant: Text, created_at: Nat, plant_length: Nat, front_img: Text, back_img: Text, left_img: Text, right_img: Text) : async Nat {
		let images = [front_img, back_img, left_img, right_img];
		let id = plantMetaCounter.generate_new_id();
		let plantmeta = PlantMeta.PlantMeta(id, plant, created_at, plant_length, images);
		plantmetadata.add(plantmeta);
		plantmeta.get_id();
	};

	public shared(msg) func getPlantmeta(id: Nat) : async PlantMeta {
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
}