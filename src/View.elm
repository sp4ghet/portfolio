module View exposing (root)

import Types exposing (..)
import Top.View as Top

import Html exposing (..)

root : Model -> Html Msg
root model =
    Html.map TopMsg (Top.root model.top)
