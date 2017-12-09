module Works.State exposing (init, update)

import Works.Types exposing (..)
import Works.Project.State as Project
import Works.Contents.Main exposing (projects)
import Common.State exposing (updateNav, initNav)


init : Model
init =
    Model (projects |> List.map Project.init) initNav


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        Nav navMsg ->
            let
                ( navModel, navCmd ) =
                    updateNav navMsg model.navModel
            in
                ( { model | navModel = navModel }, navCmd )

        _ ->
            ( model, Cmd.none )
