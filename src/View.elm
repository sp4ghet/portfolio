module View exposing (root)

import Types exposing (..)
import Top.View as Top
import Works.View as Works
import About.View as About
import Blog.View as Blog
import Works.Project.View as Project
import Common.Helpers exposing (find)
import Html exposing (..)


root : Model -> Html Msg
root model =
    case model.route of
        Top ->
            Html.map TopMsg (Top.root model.top)

        Works ->
            Html.map WorksMsg (Works.root model.works)

        Work s ->
            let
                project =
                    find (\x -> x.project.id == s) model.works.projects
            in
                case project of
                    Just projId ->
                        Html.map ProjectMsg (Project.root projId)

                    Nothing ->
                        div [] [ text "No such project." ]

        About ->
            Html.map AboutMsg (About.root model.about)

        Blog ->
            Html.map BlogMsg (Blog.root model.blog)

        NotFoundRoute ->
            div [] [ text "No such route" ]
