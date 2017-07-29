module Works.Project.View exposing (root)

import Common.Styling exposing (..)
import Works.Project.Types exposing (..)
import Works.Project.Styling exposing (..)
import Works.View exposing (navBar)
import Html exposing (..)
import Html.Attributes exposing (..)
import Markdown

waveform : List (List Float)
waveform = [[0.748,0.718,0.500],[0.500,0.798,0.368],[0.828,1.038,-0.452],[1.468,-0.132,-0.882]]


root : Model -> Html Msg
root model =
  div [
  radialCosineGradient waveform "top left"
  ]
  [
    navBar
    ,div [contentsContainerStyle]
      <| List.append [
       div [contentWrapperStyle] [h1 [] [text model.title]]
       ]
       <| List.map render model.contents
  ]


render : Content -> Html msg
render content =
  let
    rendered =
      case content of
        Description markdown ->
          Markdown.toHtml [class "project-description"] markdown
        Picture imgUrl ->
          img [
          class "project-picture"
          ,imageContentStyle
          ,src imgUrl
          ] []
        Video url ->
          video [
            autoplay True
            ,loop True
            ,controls True
            ,videoContentStyle
          ] [
            source [
              src url
              ,type_ "video/mp4"
              ] []
            ,text "No video support"
          ]
  in
    div [
      contentWrapperStyle
    ] [
      rendered
    ]
