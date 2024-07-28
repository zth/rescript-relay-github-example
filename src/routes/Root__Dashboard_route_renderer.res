let renderer = Routes.Root.Dashboard.Route.makeRenderer(
  ~prepare=_ => {
    ()
  },
  ~render=_ => {
    <Dashboard />
  },
)
