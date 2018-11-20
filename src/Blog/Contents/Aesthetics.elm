module Blog.Contents.Aesthetics exposing (..)

import Blog.Article.Types exposing (..)
import Date exposing (Date)


article : Article
article =
    Article
        "The Pursuit of Aesthetics"
        "aesthetics"
        (Date.fromString "November 20th 2018")
        "Lorem ipsum dolor sit amet."
        [ Words "hoge" ]
