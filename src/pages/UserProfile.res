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
          <React.Suspense fallback={React.null}>
            <UserAvatar className="size-24" user=fragmentRefs />
          </React.Suspense>
        </div>
        <div>
          <React.Suspense
            fallback={<div
              className="justify-center items-center text-center flex flex-col space-y-1">
              <div className="bg-orange-200 animate-pulse rounded-md h-5 w-24" />
              <div className="bg-orange-200 animate-pulse rounded-md h-4 w-12" />
            </div>}>
            <UserTitle user=fragmentRefs />
          </React.Suspense>
          <React.Suspense
            fallback={<div className="bg-orange-200 animate-pulse rounded-md h-4 w-24" />}>
            <UserBadges user=fragmentRefs />
          </React.Suspense>
        </div>
        <React.Suspense
          fallback={<div className="flex flex-col space-y-1">
            <div className="bg-orange-200 animate-pulse rounded-md h-5 w-24" />
            <div className="bg-orange-200 animate-pulse rounded-md h-4 w-12" />
          </div>}>
          <UserBio user=fragmentRefs />
        </React.Suspense>
        <React.Suspense
          fallback={<div
            className="bg-orange-200 animate-pulse rounded-md h-12 w-24 self-center"
          />}>
          <UserFollowersWidget user=fragmentRefs />
        </React.Suspense>
      </div>
    </div>
  | _ => React.string("Not found.")
  }
}
