module UserFragment = %relay(`
  fragment UserTitle_user on User {
    name
    login
  }
`)

@react.component
let make = (~user) => {
  let user = UserFragment.use(user)

  <>
    <h1 className="text-xl font-semibold"> {React.string(user.name->Option.getOr("-"))} </h1>
    <div className="text-gray-600"> {React.string(user.login)} </div>
  </>
}
