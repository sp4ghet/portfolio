module About.View exposing (root)

import About.Types exposing (..)
import Common.Styling exposing (..)
import Common.ViewComponents exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Markdown


root : Model -> Html Msg
root model =
    div
        [ id "about-container"
        , radialCosineGradient waveform "top left"
        ]
        [ Html.map Nav (navBar model.navModel)
        , contents model
        , copyrightFooter
        ]


contents : Model -> Html Msg
contents model =
    section
        [ class "section"
        , class "tint"
        ]
        [ div
            [ id "about-me-contents"
            , class "container content"
            ]
            [ Markdown.toHtml [] model.description
            ]
        ]
