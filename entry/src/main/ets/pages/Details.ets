import { CounterContainer } from "../components/CounterContainer"
import { CounterModel } from "../model/CounterModel"
import { CounterActions } from "../store/CounterActions"
import { counterStore } from "../store/CounterStore"

@Builder
export function detailsBuilder() {
  Details()
}

@ComponentV2
struct Details {
  title: string = '详情页'
  @Local counterModel: CounterModel = counterStore.getState()
  @Consumer() pathStack: NavPathStack = new NavPathStack()

  build() {
    NavDestination() {
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

        Button($r('app.string.Details_btn_name'))
          .onClick(() => {
            this.pathStack.pop()
          })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .hideTitleBar(true)
  }
}