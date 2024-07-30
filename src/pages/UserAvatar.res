module UserFragment = %relay(`
  fragment UserAvatar_user on User {
    avatarUrl
    name
    login
  }
`)

@react.component
let make = (~user, ~className="size-24 bg-orange-200") => {
  let user = UserFragment.use(user)

  <div
    title={switch user {
    | {name: Some(name), login} => `${name} (${login})`
    | {login} => login
    }}>
    <Avatar className src=user.avatarUrl />
  </div>
}
