module About.View exposing (root)

import About.Types exposing (..)
import Common.ViewComponents exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Markdown


root : Model -> Html Msg
root model =
    div
        [ id "about-container"

        -- , radialCosineGradient waveform "top left"
        ]
        [ Html.map Nav (navBar model.navModel)
        , contents model
        , copyrightFooter
        ]


contents : Model -> Html Msg
contents model =
    div
        [ class "article-container"
        , class "container "
        ]
        [ div
            [ id "about-me-contents"
            , class "content"
            , class "container is-widescreen"
            , style
                [ ( "width", "80%" )
                , ( "padding", "3vh 0" )
                ]
            ]
            [ h1 [ class "is-title" ] [ text "Rikuo Hasegawa // 長谷川陸央 // sp4ghet" ]
            , div [] [ img [ src "/assets/img/icons/icon.png" ] [] ]
            , div []
                [ a [ href model.twitterUrl, class "icon has-text-link", target "_blank" ] [ i [ class "ion-social-twitter-outline" ] [] ]
                , a [ href model.facebookUrl, class "icon has-text-link", target "_blank" ] [ i [ class "ion-social-facebook-outline" ] [] ]
                , a [ href model.githubUrl, class "icon has-text-link", target "_blank" ] [ i [ class "ion-social-github-outline" ] [] ]
                , a [ href model.bookmeterUrl, class "icon has-text-link", target "_blank" ] [ i [ class "ion-ios-bookmarks-outline" ] [] ]
                ]
            , Markdown.toHtml [ class "is-size-5-desktop" ] model.description
            ]
        ]
