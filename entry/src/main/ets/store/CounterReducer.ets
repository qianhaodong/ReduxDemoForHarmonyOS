import { Action, Reducer } from "redux_store";
import { CounterModel } from "../model/CounterModel";
import { CounterActions } from "./CounterActions";

export const counterReducer: Reducer<CounterModel> = (state: CounterModel, action: Action) => {
  switch (action.type) {
    case CounterActions.INCREMENT.type:
      state.count++
      break
    case CounterActions.DECREMENT.type:
      if (state.count <= 0) {
        return null
      }
      state.count--
      break
  }
  return null
}