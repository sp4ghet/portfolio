module Works.View exposing (root, navBar)

import Works.Types exposing (..)
import Works.Project.Types exposing (Project)
import Works.Styling exposing (..)
import Common.Styling exposing (..)
import Common.ViewComponents exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)

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
  ,contents model.projects
  ]

-- Contents
contents : List Project -> Html Msg
contents projects =
  let
    work : Project -> Html Msg
    work project = div
      [
      class "work"
      ,workStyle
      , style [("background-image", "url("++project.imgUrl++")")]
      ]
      [
      a [href ("#works/"++project.id), workTextWrapperStyle] [
        p [style [("text-align", "center")]] [text project.title]
        ]
      ]
  in
  div [
    id "works-list"
    ,worksListStyle
    ]
    (List.map work projects)

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
  [id "works", class "selected"]
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
  [id "about"]
  "assets/img/icons/about.png"
  "#about"
  "About Me"
  "自己紹介"
