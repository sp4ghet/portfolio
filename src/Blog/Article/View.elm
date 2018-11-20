module Blog.Article.View exposing (root)

import Html exposing (..)
import Blog.Article.Types exposing (..)
import Common.ViewComponents exposing (navBar)


root : Model -> Html Msg
root model =
    div []
        [ Html.map Nav (navBar model.navModel)
        ]
