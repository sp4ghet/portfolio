module State exposing (init, update, subscriptions)

import Top.State as Top
import Works.State as Works
import Works.Project.State as Project
import About.State as About
import Common.Helpers exposing (find, remove)
import Types exposing (..)
import Routing exposing (parseLocation)
import Navigation exposing (Location)


init : Location -> ( Model, Cmd msg )
init location =
    let
        route =
            parseLocation location
    in
        ( Model
            Top.init
            Works.init
            About.init
            route
        , Cmd.none
        )


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )

        TopMsg message ->
            let
                ( topModel, topCmd ) =
                    Top.update message model.top
            in
                ( { model | top = topModel }, topCmd )

        WorksMsg message ->
            let
                ( worksModel, worksCmd ) =
                    Works.update message model.works
            in
                ( { model | works = worksModel }, worksCmd )

        ProjectMsg message ->
            case model.route of
                Work projectId ->
                    let
                        projectMaybe =
                            find (\x -> x.project.id == projectId) model.works.projects
                    in
                        case projectMaybe of
                            Just project ->
                                let
                                    ( projectModel, projectCmd ) =
                                        Project.update message project

                                    -- TODO: This makes the ordering of work in the "Works" page different when you return after viewing a project page
                                    newProjects =
                                        List.append [ projectModel ] (remove project <| model.works.projects)

                                    oldWorks =
                                        model.works

                                    newWorks =
                                        { oldWorks | projects = newProjects }
                                in
                                    ( { model | works = newWorks }, projectCmd )

                            Nothing ->
                                ( model, Cmd.none )

                _ ->
                    ( model, Cmd.none )

        AboutMsg message ->
            let
                ( aboutModel, aboutCmd ) =
                    About.update message model.about
            in
                ( { model | about = aboutModel }, aboutCmd )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch [ Sub.map TopMsg (Top.subscriptions model.top) ]
