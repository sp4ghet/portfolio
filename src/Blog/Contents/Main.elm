module Blog.Contents.Main exposing (articles)

import Blog.Article.Types exposing (Article)
import Blog.Contents.Lookback2018 as Lookback
import Blog.Contents.September as September


articles : List Article
articles =
    [ Lookback.article
    , September.article
    ]
