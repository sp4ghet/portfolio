module Blog.State exposing (update, init)

import Blog.Types exposing (..)


init : Model
init =
    Model


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    ( model, Cmd.none )
