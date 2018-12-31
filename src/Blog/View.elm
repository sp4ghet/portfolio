module Blog.View exposing (root)

import Blog.Types exposing (..)
import Blog.Article.Types as Article
import Common.ViewComponents exposing (navBar)
import Html exposing (..)
import Html.Attributes exposing (..)
import Date
import Markdown


root : Model -> Html Msg
root model =
    div []
        [ Html.map Nav
            (navBar model.navModel)
        , div
            [ class "container"
            , class "article-container"
            ]
            [ div
                [ class "content"
                , class "container is-widescreen"
                ]
                (List.map summary model.articles)
            ]
        ]


summary : Article.Model -> Html msg
summary articleModel =
    let
        article =
            articleModel.article

        dateString =
            case article.postDate of
                Ok date ->
                    toString (Date.month date) ++ "/" ++ toString (Date.day date) ++ "/" ++ toString (Date.year date)

                Err err ->
                    "no date"
    in
        div
            [ style
                [ ( "margin", "0 auto" )
                , ( "width", "80%" )
                , ( "padding", "30px 0 0" )
                ]
            ]
            [ div
                [ class "card"
                ]
                [ header
                    [ class "columns is-gapless is-vcentered"
                    , style
                        [ ( "box-shadow", "0 1px 2px rgba(255, 255, 255, 0.1)" )

                        -- The margin-bottom of h2 is 0.5714em (em is font-size)
                        -- and font-size is 1.75rem so, we do that calculation to vertically center everything
                        , ( "padding", (toString <| 0.5714 * 1.75) ++ "em 5% 0" )
                        , ( "margin-bottom", "0" )
                        ]
                    ]
                    [ a [ class "column", href ("#blog/" ++ article.id) ]
                        [ h2 [] [ text article.title ]
                        ]
                    , span
                        [ class "column is-narrow" ]
                        [ text dateString ]
                    ]
                , div
                    [ class "card-contents"
                    , style
                        [ ( "padding", "1.5rem 5%" )
                        ]
                    ]
                    [ p []
                        [ Markdown.toHtml [] article.summary
                        , a
                            [ href ("#blog/" ++ article.id)
                            ]
                            [ text "...read more" ]
                        ]
                    ]
                ]
            ]
