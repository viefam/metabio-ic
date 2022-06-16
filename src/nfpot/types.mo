import Principal "mo:base/Principal";

module {
	public type UserId = Principal;
	public type PlantMetaId = Nat;
	public type Images = [Text];

	public type MetadataStatus = {
		#verified; #verfifying; #failed; #rewarded;
	};

	public type PlantMeta = {
		id: PlantMetaId;
		plant: Text;
		created_at: Nat; // timestamp
		plant_length: Nat;
		images: [Text];
	};

	public type UserRewardStatus = {
		#paid; #pending; #failed;
	};

	public type UserReward = {
		id: Nat;
		user: UserId;
		plantMeta: PlantMetaId;
		rewards: Nat;
		status: UserRewardStatus;
	};
}