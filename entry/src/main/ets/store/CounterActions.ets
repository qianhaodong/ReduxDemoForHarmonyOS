import { Action, StateStore } from "redux_store";

export class CounterActions {
  static INCREMENT: Action = StateStore.createAction('INCREMENT')
  static DECREMENT: Action = StateStore.createAction('DECREMENT')
}