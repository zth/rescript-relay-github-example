type color =
  | @as("red") Red
  | @as("orange") Orange
  | @as("amber") Amber
  | @as("yellow") Yellow
  | @as("lime") Lime
  | @as("green") Green
  | @as("emerald") Emerald
  | @as("teal") Teal
  | @as("cyan") Cyan
  | @as("sky") Sky
  | @as("blue") Blue
  | @as("indigo") Indigo
  | @as("violet") Violet
  | @as("purple") Purple
  | @as("fuchsia") Fuchsia
  | @as("pink") Pink
  | @as("rose") Rose
  | @as("zinc") Zinc

@module("./badge.jsx") @react.component
external make: (
  ~color: color=?,
  ~className: string=?,
  ~children: React.element=?,
) => React.element = "Badge"
