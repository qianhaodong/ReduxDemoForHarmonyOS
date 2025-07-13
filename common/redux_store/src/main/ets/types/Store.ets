import { Dispatch } from "./Dispatch";

export interface Store<T> {
  getState: () => T;
  dispatch: Dispatch
}