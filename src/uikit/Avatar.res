@module("./avatar.jsx") @react.component
external make: (
  ~src: string=?,
  ~square: bool=?,
  ~initials: string=?,
  ~alt: string=?,
  ~className: string=?,
) => React.element = "Avatar"
