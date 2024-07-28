let renderer = Routes.FourOhFour.Route.makeRenderer(
  ~prepare=_ => {
    ()
  },
  ~render=_ => {
    React.string("Not found!")
  },
)
