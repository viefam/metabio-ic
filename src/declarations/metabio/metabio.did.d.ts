import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';

export interface PlantMeta {
  'id' : PlantMetaId,
  'created_at' : bigint,
  'plant_length' : bigint,
  'plant' : string,
  'images' : Array<string>,
}
export type PlantMetaId = bigint;
export type TxReceipt = { 'Ok' : bigint } |
  {
    'Err' : { 'InsufficientAllowance' : null } |
      { 'InsufficientBalance' : null } |
      { 'ErrorOperationStyle' : null } |
      { 'Unauthorized' : null } |
      { 'LedgerTrap' : null } |
      { 'ErrorTo' : null } |
      { 'Other' : null } |
      { 'BlockUsed' : null } |
      { 'AmountTooSmall' : null }
  };
export type UserId = Principal;
export interface UserReward {
  'id' : bigint,
  'status' : UserRewardStatus,
  'plantMeta' : PlantMetaId,
  'user' : UserId,
  'rewards' : bigint,
}
export type UserRewardStatus = { 'pending' : null } |
  { 'paid' : null } |
  { 'failed' : null };
export interface _SERVICE {
  'auditPlantmeta' : ActorMethod<[bigint], boolean>,
  'contributePlantMeta' : ActorMethod<
    [string, bigint, bigint, string, string, string, string],
    bigint,
  >,
  'displayReward' : ActorMethod<[bigint], UserReward>,
  'distributeReward' : ActorMethod<[bigint], TxReceipt>,
  'getPlantmeta' : ActorMethod<[bigint], PlantMeta>,
}
