module State exposing (init, update, subscriptions)

import Top.State as Top
import Works.State as Works
import Works.Project.State as Project
import About.State as About
import Blog.State as BlogState
import Blog.Article.State as Article
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
            BlogState.init
            route
        , Cmd.none
        )


update : Msg -> Model -> ( Model, Cmd Msg )
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
                        blogMaybe =
                            find (\x -> x.article.id == blogId) model.blog.articles
                    in
                        case blogMaybe of
                            Just article ->
                                let
                                    ( articleModel, articleCmd ) =
                                        Article.update message article

                                    newArticles =
                                        List.append [ articleModel ] (remove article <| model.blog.articles)

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
