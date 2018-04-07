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

        -- , radialCosineGradient waveform "top left"
        ]
        [ Html.map Nav (navBar model.navModel)
        , contents model
        , copyrightFooter
        ]


contents : Model -> Html Msg
contents model =
    section
        [ class "section"
        , style [ ( "padding", "0 10rem" ) ]
        ]
        [ div [ class "article-container" ]
            [ div
                [ id "about-me-contents"
                , class "container content"
                , style
                    [ ( "width", "80%" )
                    , ( "padding", "3rem 0" )
                    ]
                ]
                [ h1 [ class "is-title" ] [ text "Rikuo Hasegawa // 長谷川陸央 // ﾊｾｶﾞﾜ ﾘｸｵ" ]
                , div []
                    [ a [ href "https://twitter.com/sp4ghet", class "icon has-text-link" ] [ i [ class "ion-social-twitter-outline" ] [] ]
                    , a [ href "https://facebook.com/rikuo.hasegawa", class "icon has-text-link" ] [ i [ class "ion-social-facebook-outline" ] [] ]
                    , a [ href "https://github.com/sp4ghet", class "icon has-text-link" ] [ i [ class "ion-social-github-outline" ] [] ]
                    , a [ href "https://bookmeter.com/users/811608", class "icon has-text-link" ] [ i [ class "ion-ios-bookmarks-outline" ] [] ]
                    ]
                , Markdown.toHtml [] model.description
                ]
            ]
        ]
