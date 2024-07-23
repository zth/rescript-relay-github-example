module Query = %relay(`
  query LayoutQuery {
    ...LayoutDisplay_query
  }
`)

@react.component
let make = (~queryRef, ~children) => {
  let data = Query.usePreloaded(~queryRef)

  <div className="p-6">
    <h1 className="text-4xl"> {React.string("GitHub")} </h1>
    <React.Suspense fallback={<div> {React.string("Loading...")} </div>}>
      <LayoutDisplay query={data.fragmentRefs}> {children} </LayoutDisplay>
    </React.Suspense>
  </div>
}
