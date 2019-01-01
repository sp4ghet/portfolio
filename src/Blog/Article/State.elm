module Blog.Article.State exposing (..)

import Blog.Article.Types exposing (..)
import Common.Ports exposing (reloadInsta)
import Common.State as Navbar


init : Article -> ( Model, Cmd Msg )
init article =
    ( Model article Navbar.initNav, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Nav navMsg ->
            let
                ( navModel, navCmd ) =
                    Navbar.updateNav navMsg model.navModel
            in
                ( { model | navModel = navModel }, navCmd )

        _ ->
            ( model, Cmd.none )
