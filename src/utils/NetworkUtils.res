external githubToken: string = "import.meta.env.VITE_GITHUB_ACCESS_TOKEN"

let fetchQuery: RescriptRelay.Network.fetchFunctionPromise = async (
  operation,
  variables,
  _cacheConfig,
  _uploads,
) => {
  open Fetch

  let res = await fetch(
    "https://api.github.com/graphql",
    {
      method: #POST,
      headers: Headers.fromArray([
        ("content-type", "application/json"),
        ("authorization", `bearer ${githubToken}`),
      ]),
      body: Body.string(
        {"query": operation.text, "variables": variables}
        ->JSON.stringifyAny
        ->Option.getExn,
      ),
    },
  )

  if res->Response.ok {
    await res->Response.json
  } else {
    panic("Could not make GraphQL request.")
  }
}
