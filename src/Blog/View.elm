module Blog.View exposing (root)

import Blog.Types exposing (..)
import Blog.Article.Types as Article
import Common.ViewComponents exposing (navBar)
import Html exposing (..)
import Html.Attributes exposing (..)
import Date


root : Model -> Html Msg
root model =
    let
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
                div []
                    [ h3 [] [ text article.title ]
                    , span [] [ text dateString ]
                    , div []
                        [ p [] [ text article.summary ]
                        , a [ href ("#blog/" ++ article.id) ] [ text "read more..." ]
                        ]
                    ]
    in
        div []
            [ Html.map Nav
                (navBar model.navModel)
            , div [] (List.map summary model.articles)
            ]
