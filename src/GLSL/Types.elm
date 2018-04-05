module GLSL.Types exposing (..)

import Math.Vector2 as Vec2 exposing (Vec2)
import Mouse exposing (Position)
import WebGL exposing (Texture)


type alias Vertex =
    { position : Vec2.Vec2
    }


type alias Uniforms =
    { mouse : Vec2.Vec2
    , time : Float
    , backbuffer : Texture
    , resolution : Vec2.Vec2
    }


type alias Model =
    { mousePos : Position
    }


type Msg
    = Moved Position
