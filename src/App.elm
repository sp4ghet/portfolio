module App exposing (main)

import Html
import State
import View
import Types exposing (..)

main : Program Never Model Msg
main =
    Html.program
        { init = (State.init, Cmd.none)
        , update = State.update
        , view = View.root
        , subscriptions = (always Sub.none)
        }
