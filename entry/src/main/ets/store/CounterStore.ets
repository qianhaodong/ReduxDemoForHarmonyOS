import { StateStore, Store } from "redux_store";
import { CounterModel } from "../model/CounterModel";
import { counterReducer } from "./CounterReducer";

const COUNTER_STORE_ID = 'counterStore'

export const counterStore: Store<CounterModel> = StateStore.createStore<CounterModel>(COUNTER_STORE_ID, new CounterModel(), counterReducer)