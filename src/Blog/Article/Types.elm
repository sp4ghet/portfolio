module Blog.Article.Types exposing (Article)

import Date exposing (Date)


type alias Article =
    { title : String
    , body : String
    , postDate : Date
    }
