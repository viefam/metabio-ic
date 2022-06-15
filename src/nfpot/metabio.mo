import Types "./types";
import PlantMeta "./plantmeta";
import PlantMetadata "./plantmetadata";

actor MetaBio {

	type PlantMeta = Types.PlantMeta;

	flexible var plantmetadata : PlantMetadata.PlantMetadata = PlantMetadata.PlantMetadata();
	public shared(msg) func contributePlantMeta(created_at: Nat, plant_length: Nat, front_img: Text, back_img: Text, left_img: Text, right_img: Text) : async Text {
		let images = [front_img, back_img, left_img, right_img];
		let plantmeta = PlantMeta.PlantMeta(plantMetaCounter.generate_new_id(), created_at, plant_length, images);
		plantmetadata.add(plantmeta);
		"Success to contribute new plant metadata"
	};

	flexible object plantMetaCounter = {
		var count = 0;
		public func generate_new_id() : Nat { let id = count; count += 1; id };
		public func get_total() : Nat { count };
	};
}