module UserFragment = %relay(`
  fragment UserBio_user on User {
    bio
  }
`)

@react.component
let make = (~user) => {
  let user = UserFragment.use(user)

  switch user.bio {
  | None => React.null
  | Some(bio) =>
    <div>
      <div> {React.string(bio)} </div>
    </div>
  }
}
