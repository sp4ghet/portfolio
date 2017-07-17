module Top.State exposing (init, update)

import Debug exposing (log)
import Top.Types exposing (..)

init = Model 0

update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  case msg of
    _ ->
      (model, Cmd.none)