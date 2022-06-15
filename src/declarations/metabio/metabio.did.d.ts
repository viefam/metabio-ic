import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';

export interface _SERVICE {
  'contributePlantMeta' : ActorMethod<[bigint, bigint, Array<string>], string>,
}
