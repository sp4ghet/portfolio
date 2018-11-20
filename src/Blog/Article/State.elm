module Blog.Article.State exposing (..)

import Blog.Article.Types exposing (..)
import Common.State as Navbar


init : Article -> Model
init article =
    Model article Navbar.initNav


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )
