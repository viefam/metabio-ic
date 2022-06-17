import Hash "mo:base/Hash";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";
import Option "mo:base/Option";
import Principal "mo:base/Principal";
import Types "./types";

module {

	type Status = Types.UserRewardStatus;

	public class Reward (
		id: Nat,
		user: Types.UserId,
		plantMeta: Types.PlantMetaId,
		rewards: Nat,
		status: Status,
	) {
		var _status: Status = status;

		public func get_id() : Nat {
			id
		};

		public func get_plant_meta() : Nat {
			plantMeta
		};

		public func get_rewards() : Nat {
			rewards
		};

		public func get_status() : Status {
			_status
		};

		public func get_user() : Types.UserId {
			user
		};

		public func paid() {
			_status := #paid;
		};

	};
	
	public func isEq(x: Nat, y: Nat): Bool { x == y };

}