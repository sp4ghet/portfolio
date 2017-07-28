module Top.Styling exposing (..)

import Html exposing (Attribute)
import Html.Attributes exposing (style)

topContainerStyle : Attribute msg
topContainerStyle = style [
  ("position", "relative"),
  ("min-height", "100%"),
  ("width", "100%"),

  ("display", "flex"),
  ("flex-direction", "column")
  ]

nameContainerStyle : Attribute msg
nameContainerStyle = style [
  ("display", "flex"),
  ("justify-content", "center"),
  ("align-items", "center"),
  ("flex-wrap", "no-wrap"),
  ("height", "50vh")
  ]

tabsContainerStyle : Attribute msg
tabsContainerStyle = style [
  ("display", "flex"),
  ("justify-content", "space-around"),
  ("flex-wrap", "no-wrap"),
  ("height", "50vh")
  ]

nameStyle : Attribute msg
nameStyle = style [
  ("grid-template-columns", "repeat(10, 40px)"),
  ("grid-template-rows", "repeat(2, 100px)"),
  ("background-color", "rgba(255,255,255,0.0)")
  ]
