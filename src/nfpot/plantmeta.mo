import Hash "mo:base/Hash";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";
import Option "mo:base/Option";
import Principal "mo:base/Principal";
import Types "./types";

module {
	public type PlantMetaId = Types.PlantMetaId;
	public type Images = Types.Images;

	public class PlantMeta (
		id: PlantMetaId,
		created_at: Nat, // timestamp
		plant_length: Nat,
		images: Images,
	) {

		public func get_id() : Nat {
			id
		};

		public func get_plant_length() : Nat {
			plant_length
		};

		public func get_images() : Images {
			images
		};
	};

	public func isEq(x: PlantMetaId, y: PlantMetaId): Bool { x == y };
}