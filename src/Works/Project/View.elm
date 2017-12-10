module Works.Project.View exposing (root)

import Common.Styling exposing (..)
import Common.ViewComponents exposing (..)
import Works.Project.Types exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Json.Encode as Encode
import Markdown


root : Model -> Html Msg
root model =
    div
        [ radialCosineGradient waveform "top left"
        ]
        [ Html.map Nav (navBar model.navModel)
        , section
            [ class "section"
            , class "tint"
            ]
          <|
            List.append
                [ div [ class "content", class "container" ] [ h1 [] [ text model.project.title ] ]
                ]
            <|
                List.map render model.project.contents
        , copyrightFooter
        ]


render : Content -> Html msg
render content =
    let
        rendered =
            case content of
                Description markdown ->
                    Markdown.toHtml [] markdown

                Picture imgUrl ->
                    img
                        [ class "project-picture"
                        , src imgUrl
                        ]
                        []

                Video url ->
                    video
                        [ autoplay True
                        , loop True
                        , controls True
                        , property "muted" (Encode.bool True)
                        ]
                        [ source
                            [ src url
                            , type_ "video/mp4"
                            ]
                            []
                        , text "No video support"
                        ]

                Youtube videoId ->
                    div
                        [ class "video-container"
                        ]
                        [ iframe
                            [ attribute "allow" "encrypted-media"
                            , attribute "allowfullscreen" ""
                            , attribute "frameborder" "0"
                            , attribute "gesture" "media"
                            , src ("https://www.youtube-nocookie.com/embed/" ++ videoId ++ "?rel=0&showinfo=0")
                            ]
                            []
                        ]
    in
        div
            [ class "content"
            , class "container"
            ]
            [ rendered
            ]
