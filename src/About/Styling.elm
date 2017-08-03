module About.Styling exposing (..)

import Html exposing (Attribute)
import Html.Attributes exposing (style)

aboutContainerStyle : Attribute msg
aboutContainerStyle = style [
  ("position", "relative"),
  ("min-height", "100%"),
  ("width", "100%"),

  ("display", "flex"),
  ("flex-direction", "column")
  ]

aboutContentsStyle : Attribute msg
aboutContentsStyle = style [
  ("min-height", "calc(100vh - 200px)")
  ,("width", "80%")
  ,("margin-left", "10%")
  ,("margin-right", "10%")
  ]

navBarStyle : Attribute msg
navBarStyle = style [
  ("width", "100%"),
  ("height", "200px"),
  ("display", "flex"),
  ("margin", "auto"),
  ("justify-content", "space-between"),
  ("flex-direction", "row")
  ]

nameContainerStyle : Attribute msg
nameContainerStyle = style [
  ("display", "flex"),
  ("justify-content", "flex-start"),
  ("flex-wrap", "no-wrap")
  ]

tabsContainerStyle : Attribute msg
tabsContainerStyle = style [
  ("display", "flex"),
  ("justify-content", "flex-end"),
  ("flex-wrap", "no-wrap")
  ]
