module Common.ViewComponents exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Common.Styling exposing (..)


tab : List (Attribute msg) -> String -> String -> String -> String -> Html msg
tab attrs imgUrl href_ englishText japaneseText = a
  (List.append [href href_, class "tab"] attrs)
  [
  img [
    src imgUrl
    ,alt imgUrl
    ,class "tab-logo"
    ]
    []
  ,p [
    class "tab-en"
    ,class "tab-text"
    ]
    [text englishText]
  ,p [
    class "tab-jp"
    ,class "tab-text"
    ]
    [text japaneseText]
  ]

nameBase : List (Attribute msg) -> Html msg
nameBase attrs = a
  (List.append [href "#", class "name"] attrs)
  [
  nameItem [firstEnStyle, id "first-en", class "name-en"] "Rikuo",
  nameItem [lastEnStyle, id "last-en", class "name-en"] "Hasegawa",
  nameItem [lastJpStyle, id "last-jp", class "name-jp"] "長谷川",
  nameItem [firstJpStyle, id "first-jp", class "name-jp"] "陸央"
  ]

nameItem : List (Attribute msg) -> String -> Html msg
nameItem attrs  content = div
  (List.append [class "name"] attrs)
  [
  p
    [
    style
      [
      ("line-height", "100px"),
      ("font-size", "36pt"),
      ("margin", "auto")
      ]
    ]
    [text content] 
  ]
