module Query = %relay(`
  query DashboardQuery {
    viewer {
      name
      login
      bio
      createdAt
    }
  }
`)

@react.component
let make = (~queryRef) => {
  let data = Query.usePreloaded(~queryRef)

  let createdAt = data.viewer.createdAt

  <div className="w-full h-full flex flex-col items-center justify-center rounded-lg bg-white">
    <div className="text-center flex flex-col space-y-4 max-w-md">
      <div>
        <Avatar className="size-24 bg-orange-200" initials="GN" />
      </div>
      <div>
        <h1 className="text-xl font-semibold">
          {React.string(data.viewer.name->Option.getOr("-"))}
        </h1>
        <div className="text-gray-600"> {React.string(data.viewer.login)} </div>
        <div>
          <Badge color={Orange}>
            {React.string(`since ${createdAt->Date.getFullYear->Int.toString}`)}
          </Badge>
        </div>
      </div>
      {switch data.viewer.bio {
      | None => React.null
      | Some(bio) =>
        <div>
          <div> {React.string(bio)} </div>
        </div>
      }}
    </div>
  </div>
}
