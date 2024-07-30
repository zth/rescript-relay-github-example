module Query = %relay(`
  query DashboardQuery {
    viewer {
      ...UserAvatar_user
      ...UserTitle_user
      ...UserBio_user
      ...UserBadges_user
      ...UserFollowersWidget_user
    }
  }
`)

@react.component
let make = (~queryRef) => {
  let data = Query.usePreloaded(~queryRef)

  <div className="w-full h-full flex flex-col items-center justify-center rounded-lg bg-white">
    <div className="text-center flex flex-col space-y-4 max-w-md">
      <div>
        <UserAvatar className="size-24" user=data.viewer.fragmentRefs />
      </div>
      <div>
        <UserTitle user=data.viewer.fragmentRefs />
        <UserBadges user=data.viewer.fragmentRefs />
      </div>
      <UserBio user=data.viewer.fragmentRefs />
      <UserFollowersWidget user=data.viewer.fragmentRefs />
    </div>
  </div>
}
