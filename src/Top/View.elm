module Top.View exposing (root)

import Top.Types exposing (..)
import Top.Styling exposing (..)
import Common.Styling exposing (..)
import Common.ViewComponents exposing (..)
import Common.Styling exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)


root : Model -> Html Msg
root model =
    section
        [ class "hero is-fullheight"
        , radialCosineGradient waveform "top left"
        ]
        [ div [ class "hero-body", class "columns is-centered is-mobile" ]
            [ div [ class "column is-narrow" ]
                [ div
                    [ class "columns is-centered is-mobile"
                    ]
                    [ div [ class "column is-narrow" ] [ nameLogo ] ]
                , div
                    [ class "columns is-centered is-8"
                    ]
                    [ div [ class "column is-narrow" ] [ works ]
                    , div [ class "column is-narrow" ] [ blog ]
                    , div [ class "column is-narrow" ] [ about ]
                    ]
                ]
            ]
        ]
