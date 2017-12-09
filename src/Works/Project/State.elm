module Works.Project.State exposing (update, init)

import Works.Project.Types exposing (..)
import Common.State exposing (updateNav, initNav)


init : Project -> Model
init project =
    Model project initNav


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        Nav navMsg ->
            let
                ( navModel, navCmd ) =
                    updateNav navMsg model.navModel
            in
                ( { model | navModel = navModel }, navCmd )

        None ->
            ( model, Cmd.none )
