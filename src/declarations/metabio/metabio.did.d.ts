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
export interface _SERVICE {
  'contributePlantMeta' : ActorMethod<
    [string, bigint, bigint, string, string, string, string],
    bigint,
  >,
  'getPlantmeta' : ActorMethod<[bigint], PlantMeta>,
}
