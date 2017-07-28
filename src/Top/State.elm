module Top.State exposing (init, update)

import Top.Types exposing (..)

init = Model

update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  case msg of
    _ ->
      (model, Cmd.none)
