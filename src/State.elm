module State exposing (init, update)

import Top.State
import Types exposing (..)

init : Model
init = {
  hoge = 0,
  top = Top.State.init
  }

update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  case msg of
    TopMsg message ->
      let
        (topModel, topCmd) =
          Top.State.update message model.top
      in
        ({ model | top =  topModel}, Cmd.none)
