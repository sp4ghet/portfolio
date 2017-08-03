module About.View exposing (root)

import About.Types exposing (..)
import About.Styling exposing (..)
import Common.Styling exposing (..)
import Common.ViewComponents exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Markdown

waveform : List (List Float)
waveform = [[0.748,0.718,0.500],[0.500,0.798,0.368],[0.828,1.038,-0.452],[1.468,-0.132,-0.882]]

root : Model -> Html Msg
root model = div [
  id "about-container"
  ,aboutContainerStyle
  ,radialCosineGradient waveform "top left"
  ]
  [
  navBar
  ,(contents model)
  ]

contents : Model -> Html Msg
contents model = div [
  id "about-me-contents"
  ,aboutContentsStyle
  ] [
  Markdown.toHtml [] model.description
  ]

navBar : Html msg
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

-- NAME

name : Html msg
name = nameBase [id "name", class "tab"]

-- WORKS

works : Html msg
works = tab
  [id "works"]
  "assets/img/icons/works.png"
  "#works"
  "Works"
  "作品"

-- Blog

blog : Html msg
blog = tab
  [id "blog"]
  "assets/img/icons/blog.png"
  "https://goonytoons.com/blog"
  "Blog"
  "ブログ"

-- About me

about : Html msg
about = tab
  [id "about", class "selected"]
  "assets/img/icons/about.png"
  "#about"
  "About Me"
  "自己紹介"
