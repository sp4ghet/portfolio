module Top.View exposing (root)

import Top.Types exposing (..)
import Top.Styling exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

waveform : List (List Float)
waveform = [[0.748,0.718,0.500],[0.500,0.798,0.368],[0.828,1.038,-0.452],[1.468,-0.132,-0.882]]

root : Model -> Html Msg
root model =
  div [
    id "top",
    radialCosineGradient waveform "top left"
    ] [
    name
    ,works
    ,blog
    ,about
    ]

-- Container base
container : String -> String -> String -> String -> String -> Html Msg
container id_ imgUrl href_ englishText japaneseText = div
  [
  id id_
  ,class "container"
  ,radialCosineGradient waveform "bottom right"
  ] [
  img [
    src imgUrl
    ,alt id_
    ,class "tab-logo"
  ] []
  ,a [
      href href_
      ,class "tab-en"
      ,class "tab-text"
      ] [text englishText]
  ,a [
      href href_
      ,class "tab-jp"
      ,class "tab-text"
      ] [text japaneseText]
  ]
-- NAME

name : Html Msg
name = div [
  id "name",
  class "container"
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
works = container
  "works"
  "assets/img/works.png"
  "#works"
  "Works"
  "作品"

-- Blog

blog : Html Msg
blog = container
  "blog"
  "assets/img/blog.png"
  "https://goonytoons.com/blog"
  "Blog"
  "ブログ"

-- About me

about : Html Msg
about = container
  "about"
  "assets/img/about.png"
  "#about"
  "About Me"
  "自己紹介"
