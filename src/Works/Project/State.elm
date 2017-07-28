module Works.Project.State exposing (update)

import Works.Project.Types exposing (..)

update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  (model, Cmd.none)
