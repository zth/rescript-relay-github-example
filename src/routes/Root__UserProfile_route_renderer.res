module UserProfile = %relay.deferredComponent(UserProfile.make)

let renderer = Routes.Root.UserProfile.Route.makeRenderer(
  ~prepareCode=_ => [UserProfile.preload()],
  ~prepare=({environment, userId}) => {
    UserProfileQuery_graphql.load(
      ~environment,
      ~fetchPolicy=StoreOrNetwork,
      ~variables={id: userId},
    )
  },
  ~render=props => {
    <UserProfile queryRef=props.prepared />
  },
)
