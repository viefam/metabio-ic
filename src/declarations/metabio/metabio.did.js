export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'contributePlantMeta' : IDL.Func(
        [IDL.Nat, IDL.Nat, IDL.Vec(IDL.Text)],
        [IDL.Text],
        [],
      ),
  });
};
export const init = ({ IDL }) => { return []; };
