module Works.Project.Styling exposing (..)

import Html.Attributes exposing (style)
import Html exposing (..)


contentWidth : String
contentWidth = "80"

contentWrapperStyle : Attribute msg
contentWrapperStyle = style [
  ("width", contentWidth++"%")
  ,("margin-left", "10%")
  ,("margin-right", "10%")
  ]

contentsContainerStyle : Attribute msg
contentsContainerStyle = style [
  ("position", "relative")
  ,("background-color", "rgba(255,255,255,0.3)")
  ,("display", "flex")
  ,("flex-direction", "column")
  ]

imageContentStyle : Attribute msg
imageContentStyle = style [
  ("width", "100%")
  ]

videoContentStyle : Attribute msg
videoContentStyle = style [
  ("width", "100%")
  ]
