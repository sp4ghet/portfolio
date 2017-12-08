module About.View exposing (root)

import About.Types exposing (..)
import About.Styling exposing (..)
import Common.Styling exposing (..)
import Common.ViewComponents exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Markdown


waveform : List (List Float)
waveform =
    [ [ 0.748, 0.718, 0.5 ], [ 0.5, 0.798, 0.368 ], [ 0.828, 1.038, -0.452 ], [ 1.468, -0.132, -0.882 ] ]


root : Model -> Html Msg
root model =
    div
        [ id "about-container"
        , aboutContainerStyle
        , radialCosineGradient waveform "top left"
        ]
        [ navBar
        , (contents model)
        ]


contents : Model -> Html Msg
contents model =
    div
        [ id "about-me-contents"
        , aboutContentsStyle
        ]
        [ Markdown.toHtml [] model.description
        ]


navBar : Html msg
navBar =
    nav
        [ navBarStyle
        ]
        [ div
            [ nameContainerStyle ]
            [ nameLogo ]
        , div
            [ tabsContainerStyle ]
            [ works
            , blog
            , about
            ]
        ]
