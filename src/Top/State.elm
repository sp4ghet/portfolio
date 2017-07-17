module Top.State exposing (init, update)

import Debug exposing (log)
import Top.Types exposing (..)

init = Model 0

update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  ((log (toString model) model), Cmd.none)
