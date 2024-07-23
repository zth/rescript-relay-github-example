module QueryFragment = %relay(`
  fragment LayoutDisplay_query on Query {
    viewer {
      name
      login
    }
  }
`)

@react.component
let make = (~query, ~children) => {
  let query = QueryFragment.use(query)

  <>
    <div>
      {switch query.viewer {
      | {name: Some(name), login} =>
        <div className="flex flex-row space-x-1">
          {React.string("Logged in user: " ++ name ++ " (" ++ login ++ ")")}
        </div>
      | _ => React.null
      }}
    </div>
    <div> {children} </div>
  </>
}
