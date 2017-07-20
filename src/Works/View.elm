module Works.View exposing (root)

import Works.Types exposing (..)
import Works.Styling exposing (..)
import Common.Styling exposing (..)
import Common.ViewComponents exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

waveform : List (List Float)
waveform = [[0.748,0.718,0.500],[0.500,0.798,0.368],[0.828,1.038,-0.452],[1.468,-0.132,-0.882]]

root : Model -> Html Msg
root model = div [
  id "works-container"
  ,worksContainerStyle
  ,radialCosineGradient waveform "top left"
  ]
  [
  navBar
  ,contents
  ]

navBar : Html Msg
navBar = nav
  [
  navBarStyle
  ]
  [
  div
    [nameContainerStyle]
    [name],
  div
    [tabsContainerStyle]
    [
    works
    ,blog
    ,about
    ]
  ]

-- Contents
contents : Html Msg
contents =
  div [
    id "works-list"
    ,worksListStyle
    ] [
    work ""
    ,work ""
    ,work ""
    ,work ""
    ,work ""
    ,work ""
    ,work ""
    ,work ""
    ,work ""
    ]

-- Works
work : String -> Html Msg
work name = div
  [
  class "work"
  ]
  [
  img [
    src ""
  ] []
  ]

-- NAME

name : Html Msg
name = nameBase [id "name", class "tab"]

-- WORKS

works : Html Msg
works = tab
  [id "works", class "selected", worksStyle]
  "assets/img/works.png"
  "#works"
  "Works"
  "作品"

-- Blog

blog : Html Msg
blog = tab
  [id "blog", blogStyle]
  "assets/img/blog.png"
  "https://goonytoons.com/blog"
  "Blog"
  "ブログ"

-- About me

about : Html Msg
about = tab
  [id "about", aboutStyle]
  "assets/img/about.png"
  "#about"
  "About Me"
  "自己紹介"
