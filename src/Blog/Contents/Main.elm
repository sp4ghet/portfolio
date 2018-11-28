module Blog.Contents.Main exposing (articles)

import Blog.Article.Types exposing (Article)
import Blog.Contents.Aesthetics as Aesthetics
import Blog.Contents.Hoge as Hoge


articles : List Article
articles =
    [ Aesthetics.article
    , Hoge.article
    ]
