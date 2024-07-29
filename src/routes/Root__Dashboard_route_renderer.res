module Dashboard = %relay.deferredComponent(Dashboard.make)

let renderer = Routes.Root.Dashboard.Route.makeRenderer(
  ~prepareCode=_ => [Dashboard.preload()],
  ~prepare=({environment}) => {
    DashboardQuery_graphql.load(~environment, ~variables=(), ~fetchPolicy=StoreOrNetwork)
  },
  ~render=({prepared}) => {
    <Dashboard queryRef=prepared />
  },
)
