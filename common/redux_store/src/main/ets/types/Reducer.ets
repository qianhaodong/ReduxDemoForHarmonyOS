import { Action } from "./Action";

export type Reducer<T> = (state: T, action: Action) => (() => Promise<void>) | null