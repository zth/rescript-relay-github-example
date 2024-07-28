let renderer = Route__Root_route.makeRenderer(
  ~prepare=_ => (),
  ~render=props => {
    <Layout> {props.childRoutes} </Layout>
  },
)
