module Top.State exposing (init, update, subscriptions)

import Top.Types exposing (..)


-- import GLSL.State as GLSL


init : Model
init =
    Model



-- GLSL.init


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        -- GLSLMsg glslMsg ->
        --     let
        --         ( glslModel, glslCmd ) =
        --             GLSL.update glslMsg model.glsl
        --     in
        --         ( { model | glsl = glslModel }, glslCmd )
        _ ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- Sub.batch [ Sub.map GLSLMsg (GLSL.subscriptions model.glsl) ]
