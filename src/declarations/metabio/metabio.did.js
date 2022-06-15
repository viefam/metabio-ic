export const idlFactory = ({ IDL }) => {
  const PlantMetaId = IDL.Nat;
  const PlantMeta = IDL.Record({
    'id' : PlantMetaId,
    'created_at' : IDL.Nat,
    'plant_length' : IDL.Nat,
    'plant' : IDL.Text,
    'images' : IDL.Vec(IDL.Text),
  });
  return IDL.Service({
    'contributePlantMeta' : IDL.Func(
        [IDL.Text, IDL.Nat, IDL.Nat, IDL.Text, IDL.Text, IDL.Text, IDL.Text],
        [IDL.Nat],
        [],
      ),
    'getPlantmeta' : IDL.Func([IDL.Nat], [PlantMeta], []),
  });
};
export const init = ({ IDL }) => { return []; };
