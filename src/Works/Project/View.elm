module Works.Project.View exposing (root)

import Works.Project.Types exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Markdown

waveform : List (List Float)
waveform = [[0.748,0.718,0.500],[0.500,0.798,0.368],[0.828,1.038,-0.452],[1.468,-0.132,-0.882]]

root : Model -> Html Msg
root model =
  div [] [
    p [] [text model.title]
  ]

render : Content -> Html msg
render content =
  case content of
    Description markdown ->
      Markdown.toHtml [class "project-description"] markdown
    Picture imgUrl ->
      img [
      class "project-picture"
      ,src imgUrl
      ] []
    Video url ->
      video [autoplay True, loop True] [
        source [
          src url
          ,type_ "video/mp4"
          ] []
        ,text "No video support"
      ]
