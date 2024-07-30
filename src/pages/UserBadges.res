module UserFragment = %relay(`
  fragment UserBadges_user on User {
    createdAt
    isViewer
    isFollowingViewer
  }
`)

@react.component
let make = (~user) => {
  let user = UserFragment.use(user)

  <div className="flex flex-row justify-center space-x-2">
    <Badge color={Orange}>
      {React.string(`since ${user.createdAt->Date.getFullYear->Int.toString}`)}
    </Badge>
    {if user.isViewer {
      <Badge color={Amber}> {React.string(`is you`)} </Badge>
    } else {
      React.null
    }}
    {if user.isFollowingViewer {
      <Badge color={Emerald}> {React.string(`is following you`)} </Badge>
    } else {
      React.null
    }}
  </div>
}
