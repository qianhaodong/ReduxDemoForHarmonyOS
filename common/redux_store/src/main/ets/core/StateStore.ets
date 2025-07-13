import { Action } from '../types/Action';
import { Reducer } from '../types/Reducer';
import { Store } from '../types/Store';
import { createStore } from './CreateStore';
import stores from './Stores';

class InnerStateStore {
  createStore<T>(
    storeId: string,
    state: T,
    actions: Reducer<T>
  ): Store<T> {
    if (stores.hasKey(storeId)) {
      console.log('A store with the given store ID already exists')
      throw Error('createStore failed，storeId must be unique.');
    }
    const store = createStore(state, actions)
    stores.set(storeId, store)
    return store
  }

  createAction(type: string) {
    return new Action(type)
  }
}

export let StateStore = new InnerStateStore()