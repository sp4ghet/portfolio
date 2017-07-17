module View exposing (root)

import Types exposing (..)
import Top.View as Top
import Works.View as Works

import Html exposing (..)

root : Model -> Html Msg
root model =
  case model.route of
    Top ->
      Html.map TopMsg (Top.root model.top)
    Works ->
      Html.map WorksMsg (Works.root model.works)
    NotFoundRoute ->
      div [] [text "No such route"]
    _ ->
      div [] [text "not yet implemented"]
