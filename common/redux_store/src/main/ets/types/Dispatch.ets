import { Action } from "./Action";

export type Dispatch = (action: Action) => Promise<void>