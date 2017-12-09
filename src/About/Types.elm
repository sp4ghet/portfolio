module About.Types exposing (..)

import Common.Types exposing (NavModel, NavMsg)


type Msg
    = Nav NavMsg
    | None


type alias Model =
    { description : String
    , navModel : NavModel
    }
