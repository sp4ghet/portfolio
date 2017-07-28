module Works.Styling exposing (..)

import Html exposing (Attribute)
import Html.Attributes exposing (style)

worksContainerStyle : Attribute msg
worksContainerStyle = style [
  ("position", "relative"),
  ("min-height", "100%"),
  ("width", "100%"),

  ("display", "flex"),
  ("flex-direction", "column")
  ]

worksListStyle : Attribute msg
worksListStyle = style [
  ("position", "relative"),
  ("background-color", "rgba(255, 255, 255, 0.3)"),
  ("width", "100%"),
  ("height", "auto"),

  ("display", "flex"),
  ("flex-wrap", "wrap"),
  ("justify-content", "center")
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

-- Work project

workStyle : Attribute msg
workStyle = style [
  ("background-color", "#FFF")
  ,("min-width", "600px")
  ,("min-height", "600px")
  ,("margin", "1px")
  ,("background-size", "cover")
  ,("background-repeat", "no-repeat")
  ,("background-position", "50% 50%")
  ]

workTextWrapperStyle : Attribute msg
workTextWrapperStyle =
  style [
    ("display", "flex")
    ,("flex-direction", "column")
    ,("justify-content", "center")
    ,("align-content", "center")
    ,("height", "100%")
    ,("width", "100%")
    ,("margin", "0")
    ]
