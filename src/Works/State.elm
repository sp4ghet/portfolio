module Works.State exposing (init, update)

import Works.Types exposing (..)

init : Model
init = Model 0

update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  case msg of
    _ ->
      (model, Cmd.none)
