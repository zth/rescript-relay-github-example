module UserFragment = %relay(`
  fragment UserFollowersWidget_user on User {
    followers(first: 4) {
      nodes {
        ...UserAvatar_user
        id
      }
    }
  }
`)

@react.component
let make = (~user) => {
  let user = UserFragment.use(user)

  let followers =
    user.followers.nodes
    ->Option.getOr([])
    ->Array.keepSome

  switch followers {
  | [] => React.null
  | followers =>
    <div className="flex flex-row -space-x-4 self-center">
      {followers
      ->Array.map(f =>
        <RelayRouter.Link
          key=f.id
          to_={Routes.Root.UserProfile.Route.makeLink(~userId=f.id)}
          preloadData={NoPreloading}>
          <UserAvatar className="size-12 border-2 border-white bg-orange-200" user=f.fragmentRefs />
        </RelayRouter.Link>
      )
      ->React.array}
    </div>
  }
}
