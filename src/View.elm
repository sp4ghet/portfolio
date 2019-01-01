module View exposing (root)

import Types exposing (..)
import Top.View as Top
import Works.View as Works
import About.View as About
import Blog.View as Blog
import Blog.Article.View as Article
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
                    Just articleModel ->
                        Html.map ProjectMsg (Project.root articleModel)

                    Nothing ->
                        div [] [ text "No such project." ]

        About ->
            Html.map AboutMsg (About.root model.about)

        Blogs ->
            Html.map BlogMsg (Blog.root model.blog)

        Blog s ->
            let
                article =
                    find (\x -> x.article.id == s) model.blog.articles
            in
                case article of
                    Just articleModel ->
                        Html.map ArticleMsg (Article.root articleModel)

                    Nothing ->
                        div [] [ text ("No such article" ++ s) ]

        NotFoundRoute ->
            div [] [ text "No such route" ]
