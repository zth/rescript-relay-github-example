module LoadingBar = {
  @react.component
  let make = (~visible) => {
    let (render, setRender) = React.useState(() => visible)
    let (progress, setProgress) = React.useState(() => 0.)

    let translate = Float.toFixed(100. -. progress *. 100.)

    React.useEffect3(() => {
      if render {
        let timeoutId = setTimeout(
          () => {
            setProgress(
              currentprogress =>
                switch currentprogress {
                | progress if progress < 0.7 => progress +. 0.7
                | progress if progress < 0.8 => progress +. 0.05
                | progress if progress < 0.95 => progress +. 0.025
                | _ => progress +. 0.005
                },
            )
          },
          switch progress {
          | v if v < 0.7 => 0
          | v if v < 0.8 => 800
          | v if v < 0.95 => 1000
          | _ => 1500
          },
        )

        Some(
          () => {
            clearTimeout(timeoutId)
          },
        )
      } else {
        None
      }
    }, (progress, setProgress, render))

    React.useEffect2(() => {
      if !visible {
        let renderTimeoutId = setTimeout(() => {
          setRender(_ => false)
        }, 200)
        let progressTimeoutId = setTimeout(() => {
          setProgress(_ => 0.)
        }, 500)

        setProgress(_ => 1.)
        Some(
          () => {
            clearTimeout(renderTimeoutId)
            clearTimeout(progressTimeoutId)
          },
        )
      } else {
        let timeoutId = setTimeout(() => {
          setProgress(_ => 0.)
          setRender(_ => true)
        }, 300)

        Some(
          () => {
            clearTimeout(timeoutId)
          },
        )
      }
    }, (setRender, visible))

    <div className="pointer-events-none w-full h-1 relative overflow-hidden">
      <div
        className={U.tw([
          "absolute top-0 left-0, bottom-0 w-full rounded-full bg-blue-500 transition-all duration-200",
          switch (render, progress) {
          | (false, _)
          | (true, 0.) => ""
          | _ => "opacity-100"
          },
          switch render {
          | false => "opacity-0"
          | true => "-translate-y-2"
          },
        ])}
        style={ReactDOM.Style.make(~transform=`translateX(-${translate}%)`, ())}
      />
    </div>
  }
}
@react.component
let make = (~pending) =>
  <div className="fixed left-0 top-0 w-full pointer-events-none z-20">
    <LoadingBar visible=pending />
  </div>
