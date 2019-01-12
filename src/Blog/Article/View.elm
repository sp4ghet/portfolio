module Blog.Article.View exposing (root)

import Blog.Article.Types exposing (..)
import Common.ViewComponents exposing (navBar)
import Html exposing (..)
import Html.Attributes exposing (..)
import Json.Encode as Encode
import MarkdownMath
import Date


markdownOptions : MarkdownMath.Options
markdownOptions =
    { githubFlavored = Just { tables = True, breaks = True }
    , defaultHighlighting = Nothing
    , sanitize = False
    , smartypants = False
    }


root : Model -> Html Msg
root model =
    let
        dateString =
            case model.article.postDate of
                Ok date ->
                    toString (Date.month date) ++ "/" ++ toString (Date.day date) ++ "/" ++ toString (Date.year date)

                Err err ->
                    "no date"
    in
        div []
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
                            [ text model.article.title ]
                        , span [] [ text dateString ]
                        ]
                    ]
                <|
                    List.map render model.article.body
            ]


render : Content -> Html msg
render content =
    let
        rendered =
            case content of
                Words markdown ->
                    MarkdownMath.toHtmlWith markdownOptions [ class "is-size-5-desktop" ] markdown

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
