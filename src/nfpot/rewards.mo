import Hash "mo:base/Hash";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";
import Option "mo:base/Option";
import Principal "mo:base/Principal";
import Reward "./reward";
import Types "./types"

module {

	type Reward = Reward.Reward;

	public class Rewards() {
		// Use local hashmap to store plant metadata
		let hashMap = HashMap.HashMap<Nat, Reward>(1, Reward.isEq, Hash.hash);

		public func add(reward: Reward) {
			hashMap.put(reward.get_id(), reward);
		};

		public func get(reward_id: Nat): ?Reward {
			hashMap.get(reward_id)
		};

		public func paid(reward_id: Nat) {
			let reward = Option.unwrap(hashMap.get(reward_id));
			reward.paid();
			hashMap.put(reward.get_id(), reward);
		};
	};

	func isEq(x: Nat, y: Nat): Bool { x == y };
};