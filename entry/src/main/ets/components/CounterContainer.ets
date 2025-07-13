@ComponentV2
export struct CounterContainer {
  @Param @Require count: number = 0
  @Event incrementHandler: () => void
  @Event decrementHandler: () => void

  build() {
    Column({ space: 10 }) {
      Text(`计数器: ${this.count}`)
      Row({ space: 10 }) {
        Button($r('app.string.Increment_btn_name'))
          .onClick(() => {
            this.incrementHandler()
          })
        Button($r('app.string.decrement_btn_name'))
          .onClick(() => {
            this.decrementHandler()
          })
      }
    }
  }
}