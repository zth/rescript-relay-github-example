@react.component
let make = () => {
  <div className="w-full h-full flex flex-col items-center justify-center rounded-lg bg-white">
    <div className="text-center flex flex-col space-y-4 max-w-md">
      <div>
        <Avatar className="size-24 bg-orange-200" initials="GN" />
      </div>
      <div>
        <h1 className="text-xl font-semibold"> {React.string("Gabriel Nordeborn")} </h1>
        <div className="text-gray-600"> {React.string("zth")} </div>
        <div>
          <Badge color={Orange}> {React.string("since 2020")} </Badge>
        </div>
      </div>
      <div>
        <div>
          {React.string(
            "Frontend Developer interested in ReScript, GraphQL, Relay, React, and more. Partner @ArizonAB.",
          )}
        </div>
      </div>
    </div>
  </div>
}
