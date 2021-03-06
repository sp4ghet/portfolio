module State exposing (init, subscriptions, update)

import About.State as About
import Blog.Article.State as Article
import Blog.State as BlogState
import Common.Ports exposing (reloadInsta)
import List.Extra exposing (find, replaceIf)
import Navigation exposing (Location)
import Routing exposing (parseLocation)
import Top.State as Top
import Types exposing (..)
import Works.Project.State as Project
import Works.State as Works


init : Location -> ( Model, Cmd msg )
init location =
    let
        route =
            parseLocation location
    in
    let
        model =
            Model
                Top.init
                Works.init
                About.init
                BlogState.init
                route
    in
    case route of
        Blog articleId ->
            ( model, reloadInsta "init" )

        _ ->
            ( model, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
            case newRoute of
                Blog _ ->
                    ( { model | route = newRoute }, reloadInsta "blog" )

                Work _ ->
                    ( { model | route = newRoute }, reloadInsta "works" )

                _ ->
                    ( { model | route = newRoute }, Cmd.none )

        TopMsg message ->
            let
                ( topModel, topCmd ) =
                    Top.update message model.top
            in
            ( { model | top = topModel }, Cmd.map TopMsg topCmd )

        WorksMsg message ->
            let
                ( worksModel, worksCmd ) =
                    Works.update message model.works
            in
            ( { model | works = worksModel }, Cmd.map WorksMsg worksCmd )

        ProjectMsg message ->
            case model.route of
                Work projectId ->
                    let
                        predicate =
                            \x -> x.project.id == projectId

                        projectMaybe =
                            find predicate model.works.projects
                    in
                    case projectMaybe of
                        Just project ->
                            let
                                ( projectModel, projectCmd ) =
                                    Project.update message project

                                -- TODO: This makes the ordering of work in the "Works" page different when you return after viewing a project page
                                newProjects =
                                    replaceIf predicate projectModel model.works.projects

                                oldWorks =
                                    model.works

                                newWorks =
                                    { oldWorks | projects = newProjects }
                            in
                            ( { model | works = newWorks }, Cmd.map ProjectMsg projectCmd )

                        Nothing ->
                            ( model, Cmd.none )

                _ ->
                    ( model, Cmd.none )

        AboutMsg message ->
            let
                ( aboutModel, aboutCmd ) =
                    About.update message model.about
            in
            ( { model | about = aboutModel }, Cmd.map AboutMsg aboutCmd )

        BlogMsg message ->
            let
                ( blogModel, blogCmd ) =
                    BlogState.update message model.blog
            in
            ( { model | blog = blogModel }, Cmd.map BlogMsg blogCmd )

        ArticleMsg message ->
            case model.route of
                Blog blogId ->
                    let
                        predicate =
                            \x -> x.article.id == blogId

                        blogMaybe =
                            find predicate model.blog.articles
                    in
                    case blogMaybe of
                        Just article ->
                            let
                                ( articleModel, articleCmd ) =
                                    Article.update message article

                                newArticles =
                                    replaceIf predicate articleModel model.blog.articles

                                oldBlog =
                                    model.blog

                                newBlog =
                                    { oldBlog | articles = newArticles }
                            in
                            ( { model | blog = newBlog }, Cmd.map ArticleMsg articleCmd )

                        Nothing ->
                            ( model, Cmd.none )

                _ ->
                    ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch [ Sub.map TopMsg (Top.subscriptions model.top) ]
