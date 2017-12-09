module Common.State exposing (..)

import Common.Types exposing (..)


initNav : NavModel
initNav =
    NavModel False


updateNav : NavMsg -> NavModel -> ( NavModel, Cmd msg )
updateNav msg model =
    case msg of
        ToggleMenuActive ->
            let
                isMenuActive =
                    if model.menuActive then
                        False
                    else
                        True
            in
                ( { model | menuActive = isMenuActive }, Cmd.none )
