type t = Date.t

let parse: JSON.t => t = json =>
  switch json {
  | String(s) => Date.fromString(s)
  | _ => panic("Could not convert DateTime")
  }

let serialize: t => JSON.t = date => String(
  date
  ->Date.toJSON
  ->Option.getExn(~message="Could not serialize DateTime"),
)
