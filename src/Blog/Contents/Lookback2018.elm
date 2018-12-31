module Blog.Contents.Lookback2018 exposing (..)

import Blog.Article.Types exposing (..)
import Date exposing (Date)


article : Article
article =
    Article
        "Article Title"
        "url-id"
        (Date.fromString "mm/dd/yyyy")
        "Some preview of the article"
        [ Words "random text" ]
