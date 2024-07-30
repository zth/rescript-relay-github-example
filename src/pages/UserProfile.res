module Query = %relay(`
  query UserProfileQuery($id: ID!) {
    node(id: $id) {
      ... on User {
        id
        ...UserAvatar_user
        ...UserTitle_user
        ...UserBio_user
        ...UserBadges_user
        ...UserFollowersWidget_user
      }
    }
  }
`)

@react.component
let make = (~queryRef) => {
  let data = Query.usePreloaded(~queryRef)

  switch data.node {
  | Some(User({fragmentRefs, id})) =>
    <div
      className="w-full h-full flex flex-col items-center justify-center rounded-lg bg-white"
      key=id>
      <div className="text-center flex flex-col space-y-4 max-w-md">
        <div>
          <UserAvatar className="size-24" user=fragmentRefs />
        </div>
        <div>
          <UserTitle user=fragmentRefs />
          <UserBadges user=fragmentRefs />
        </div>
        <UserBio user=fragmentRefs />
        <UserFollowersWidget user=fragmentRefs />
      </div>
    </div>
  | _ => React.string("Not found.")
  }
}
