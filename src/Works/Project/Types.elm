module Works.Project.Types exposing (..)

import Common.Types exposing (NavModel, NavMsg)


type alias Model =
    { project : Project
    , navModel : NavModel
    }


type Msg
    = Nav NavMsg
    | None


type alias Project =
    { title : String
    , id : String
    , imgUrl : String
    , contents : List Content
    }


type Content
    = Description String
    | Picture String
    | Video String
    | Youtube String
