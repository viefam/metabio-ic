import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';

export type TokenId = bigint;
export interface _SERVICE {
  'approve' : ActorMethod<[Principal, TokenId], undefined>,
  'balanceOf' : ActorMethod<[Principal], [] | [bigint]>,
  'doIOwn' : ActorMethod<[bigint], boolean>,
  'getApproved' : ActorMethod<[bigint], Principal>,
  'isApprovedForAll' : ActorMethod<[Principal, Principal], boolean>,
  'mint' : ActorMethod<[string], bigint>,
  'name' : ActorMethod<[], string>,
  'ownerOf' : ActorMethod<[TokenId], [] | [Principal]>,
  'setApprovalForAll' : ActorMethod<[Principal, boolean], undefined>,
  'symbol' : ActorMethod<[], string>,
  'tokenURI' : ActorMethod<[TokenId], [] | [string]>,
  'transferFrom' : ActorMethod<[Principal, Principal, bigint], undefined>,
}
