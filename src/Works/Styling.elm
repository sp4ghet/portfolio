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

worksStyle : Attribute msg
worksStyle = style [
  ("grid-template-columns", "repeat(4, 100px)"),
  ("grid-template-rows", "repeat(2, 100px)")
  ]

blogStyle : Attribute msg
blogStyle = style [
  ("grid-template-columns", "repeat(4, 100px)"),
  ("grid-template-rows", "repeat(2, 100px)")
  ]

aboutStyle : Attribute msg
aboutStyle = style [
  ("grid-template-columns", "repeat(4, 100px)"),
  ("grid-template-rows", "repeat(2, 100px)")
  ]
