module Works.Project.View exposing (root)

import Common.Styling exposing (..)
import Common.ViewComponents exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Json.Encode as Encode
import MarkdownMath
import Works.Project.Types exposing (..)


root : Model -> Html Msg
root model =
    div
        [ radialCosineGradient waveform "top left"
        ]
        [ Html.map Nav (navBar model.navModel)
        , div
            [ class "article-container"
            , class "container is-widescreen"
            ]
          <|
            List.append
                [ div
                    [ class "content"
                    , class "container is-widescreen"
                    , style
                        [ ( "width", "80%" )
                        , ( "padding-top", "3vh" )
                        ]
                    ]
                    [ h1
                        [ class "is-size-1-desktop"
                        , style [ ( "color", "white" ) ]
                        ]
                        [ text model.project.title ]
                    ]
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
                    MarkdownMath.toHtml [ class "is-size-5-desktop" ] markdown

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

                Instagram postId ->
                    div [ class "insta-container" ]
                        [ div [ class "insta-wrapper" ]
                            [ blockquote
                                [ class "instagram-media"
                                , attribute "data-instgrm-permalink" <| "https://www.instagram.com/p/" ++ postId ++ "/"
                                , attribute "data-instgrm-version" "12"
                                ]
                                []
                            ]
                        ]
    in
    div
        [ class "content"
        , class "container"
        , style
            [ ( "width", "80%" )
            ]
        ]
        [ rendered
        ]
