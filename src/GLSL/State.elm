module GLSL.State exposing (update, init, subscriptions)

import Mouse exposing (Position)
import GLSL.Types exposing (..)


init : Model
init =
    Model (Position 0 0)


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        Moved pos ->
            ( { model | mousePos = pos }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Mouse.moves (\{ x, y } -> Moved (Position x y))
