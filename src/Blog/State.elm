module Blog.State exposing (update, init)

import Blog.Types exposing (..)
import Common.State as Navbar
import Blog.Article.Types exposing (Article)


init : Model
init =
    Model
        Navbar.initNav
        []


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    ( model, Cmd.none )
