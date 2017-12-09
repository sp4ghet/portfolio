module Works.Types exposing (..)

import Works.Project.Types as Project exposing (Model)
import Common.Types exposing (NavModel, NavMsg)


type alias Model =
    { projects : List Project.Model
    , navModel : NavModel
    }


type Msg
    = Nav NavMsg
    | None
