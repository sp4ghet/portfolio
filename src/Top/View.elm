module Top.View exposing (root)

import Top.Types exposing (..)
import Top.Styling exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

root : Model -> Html Msg
root model =
  let
    styling = [[0.748,0.718,0.500],[0.500,0.798,0.368],[0.828,1.038,-0.452],[1.468,-0.132,-0.882]]
  in
    div [
      id "top",
      radialCosineGradient styling
      ] [
      name,
      works
      ]

-- NAME

name : Html Msg
name = div [
  id "name-container"
  ] [
  nameItem "first-en" "name-en" "Rikuo",
  nameItem "last-en" "name-en" "Hasegawa",
  nameItem "last-jp" "name-jp" "長谷川",
  nameItem "first-jp" "name-jp" "陸央"
  ]

nameItem : String -> String -> String -> Html msg
nameItem id_ class_ content = div [
  id id_,
  class class_,
  class "name"
  ] [
  p [] [text content]
  ]

-- WORKS

works : Html Msg
works = div
  [
  id "works",
  onClick Works
  ] [
  text "Works"
  ]
