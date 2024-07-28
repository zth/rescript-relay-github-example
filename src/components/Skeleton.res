@react.component
let make = (~className="") => {
  <div
    className={U.tw(["rounded-md flex-1 min-w-0 animate-pulse bg-gray-300 max-w-full", className])}
  />
}
