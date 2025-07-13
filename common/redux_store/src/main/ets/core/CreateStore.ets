import { Action } from "../types/Action";
import { Reducer } from "../types/Reducer";
import { Store } from "../types/Store";

export function createStore<T>(
  state: T,
  reducer: Reducer<T>
): Store<T> {
  let currentReducer = reducer

  const getState = (): T => {
    return state
  }

  const dispatch = async (action: Action): Promise<void> => {
    let currentAction = action
    const result = currentReducer(state, currentAction)
    if (typeof result === 'function') {
      result()
    }
  }

  return {
    getState,
    dispatch
  }
}