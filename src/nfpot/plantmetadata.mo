import Hash "mo:base/Hash";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";
import Option "mo:base/Option";
import Principal "mo:base/Principal";
import PlantMeta "./plantmeta";
import Types "./types"

module {

	type PlantMetdataId = Types.PlantMetaId;
	type PlantMeta = PlantMeta.PlantMeta;

	public class PlantMetadata() {
		// Use local hashmap to store plant metadata
		let hashMap = HashMap.HashMap<PlantMetdataId, PlantMeta>(1, PlantMeta.isEq, Hash.hash);

		public func add(plantmeta: PlantMeta) {
			hashMap.put(plantmeta.get_id(), plantmeta);
		};

		public func get(plantmeta_id: PlantMetdataId): ?PlantMeta {
			hashMap.get(plantmeta_id)
		};
	};

	func isEq(x: PlantMetdataId, y: PlantMetdataId): Bool { x == y };
};