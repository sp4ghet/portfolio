module Blog.View exposing (root)

import Blog.Types exposing (..)
import Html exposing (..)
import Common.ViewComponents exposing (navBar)


root : Model -> Html Msg
root model =
    div []
        [ Html.map Nav (navBar model.navModel)
        ]
