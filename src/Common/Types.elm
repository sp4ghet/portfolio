module Common.Types exposing (..)


type alias NavModel =
    { menuActive : Bool
    }


type NavMsg
    = ToggleMenuActive
