import { CounterContainer } from '../components/CounterContainer'
import { CounterModel } from '../model/CounterModel'
import { CounterActions } from '../store/CounterActions'
import { counterStore } from '../store/CounterStore'

@Entry
@ComponentV2
struct Index {
  title: string = '首页'
  @Provider() pathStack: NavPathStack = new NavPathStack()
  @Local counterModel: CounterModel = counterStore.getState()

  build() {
    Navigation(this.pathStack) {
      Column({ space: 10 }) {
        Text(this.title)
          .fontSize($r('app.float.page_text_font_size'))

        CounterContainer({
          count: this.counterModel.count,
          incrementHandler: () => {
            counterStore.dispatch(CounterActions.INCREMENT)
          },
          decrementHandler: () => {
            counterStore.dispatch(CounterActions.DECREMENT)
          }
        })

        Button($r('app.string.Index_btn_name'))
          .onClick(() => {
            this.pathStack.pushPath({
              name: 'Details'
            })
          })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
  }
}