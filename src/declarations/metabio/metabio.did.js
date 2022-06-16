export const idlFactory = ({ IDL }) => {
  const UserRewardStatus = IDL.Variant({
    'pending' : IDL.Null,
    'paid' : IDL.Null,
    'failed' : IDL.Null,
  });
  const PlantMetaId = IDL.Nat;
  const UserId = IDL.Principal;
  const UserReward = IDL.Record({
    'id' : IDL.Nat,
    'status' : UserRewardStatus,
    'plantMeta' : PlantMetaId,
    'user' : UserId,
    'rewards' : IDL.Nat,
  });
  const TxReceipt = IDL.Variant({
    'Ok' : IDL.Nat,
    'Err' : IDL.Variant({
      'InsufficientAllowance' : IDL.Null,
      'InsufficientBalance' : IDL.Null,
      'ErrorOperationStyle' : IDL.Null,
      'Unauthorized' : IDL.Null,
      'LedgerTrap' : IDL.Null,
      'ErrorTo' : IDL.Null,
      'Other' : IDL.Null,
      'BlockUsed' : IDL.Null,
      'AmountTooSmall' : IDL.Null,
    }),
  });
  const PlantMeta = IDL.Record({
    'id' : PlantMetaId,
    'created_at' : IDL.Nat,
    'plant_length' : IDL.Nat,
    'plant' : IDL.Text,
    'images' : IDL.Vec(IDL.Text),
  });
  return IDL.Service({
    'auditPlantmeta' : IDL.Func([IDL.Nat], [IDL.Bool], []),
    'contributePlantMeta' : IDL.Func(
        [IDL.Text, IDL.Nat, IDL.Nat, IDL.Text, IDL.Text, IDL.Text, IDL.Text],
        [IDL.Nat],
        [],
      ),
    'displayReward' : IDL.Func([IDL.Nat], [UserReward], []),
    'distributeReward' : IDL.Func([IDL.Nat], [TxReceipt], []),
    'getPlantmeta' : IDL.Func([IDL.Nat], [PlantMeta], []),
  });
};
export const init = ({ IDL }) => { return []; };
