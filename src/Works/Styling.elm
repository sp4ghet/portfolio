module Works.Styling exposing (..)

import Html exposing (Attribute)
import Html.Attributes exposing (style)


textCenteringStyle : Attribute msg
textCenteringStyle =
    style
        [ ( "position", "absolute" )
        , ( "top", "50%" )
        , ( "left", "50%" )
        , ( "transform", "translate(-50%, -50%)" )
        ]

textBottomStyle : Attribute msg
textBottomStyle =
  style
      [ ( "position", "absolute" )
      , ( "top", "100%" )
      , ( "left", "50%" )
      , ( "transform", "translate(-50%, -100%)" )
      ]
