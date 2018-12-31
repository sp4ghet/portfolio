module Blog.State exposing (update, init)

import Blog.Types exposing (..)
import Common.State as Navbar
import Blog.Article.State as Article
import Blog.Contents.Main exposing (articles)


init : Model
init =
    Model
        Navbar.initNav
        (articles |> List.map (\x -> Tuple.first <| Article.init x))


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    ( model, Cmd.none )
