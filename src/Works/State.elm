module Works.State exposing (init, update)

import Works.Types exposing (..)
import Works.Contents.Main exposing (projects)

init : Model
init = Model projects

update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  case msg of
    _ ->
      (model, Cmd.none)
