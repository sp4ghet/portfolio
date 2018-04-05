module GLSL.View exposing (root)

import WebGL
import Math.Vector2 as Vec2 exposing (vec2, Vec2)
import Math.Vector3 as Vec3 exposing (vec3, Vec3)
import Html exposing (..)
import Html.Attributes exposing (..)
import Mouse exposing (Position)
import GLSL.Shader exposing (shader)
import GLSL.Types exposing (Model, Vertex, Uniforms)


root : Model -> Html msg
root model =
    WebGL.toHtml
        [ style
            [ ( "position", "fixed" )
            , ( "top", "0" )
            , ( "left", "0" )
            , ( "width", "100vw" )
            , ( "height", "100vh" )
            ]
        ]
        [ WebGL.entity
            vertexShader
            fragmentShader
            mesh
          <|
            Uniforms (mouse2vec model.mousePos) (vec2 300 150)
        ]


mouse2vec : Position -> Vec2
mouse2vec pos =
    vec2 (toFloat pos.x) (toFloat pos.y)


mesh : WebGL.Mesh Vertex
mesh =
    WebGL.triangles
        [ ( Vertex (vec2 -1 -1)
          , Vertex (vec2 1 1)
          , Vertex (vec2 1 -1)
          )
        , ( Vertex (vec2 -1 -1)
          , Vertex (vec2 -1 1)
          , Vertex (vec2 1 1)
          )
        ]



-- Shaders


vertexShader : WebGL.Shader Vertex Uniforms { vcolor : Vec3 }
vertexShader =
    [glsl|
        attribute vec2 position;
        varying vec3 vcolor;
        void main () {
            gl_Position = vec4(position, 0., 1.0);
            vcolor = vec3(0.);
        }
    |]


fragmentShader : WebGL.Shader {} Uniforms { vcolor : Vec3 }
fragmentShader =
    shader
