module About.Types exposing (..)

import Common.Types exposing (NavModel, NavMsg)


type Msg
    = Nav NavMsg
    | None


type alias Model =
    { description : String
    , twitterUrl : String
    , facebookUrl : String
    , githubUrl : String
    , bookmeterUrl : String
    , navModel : NavModel
    }
