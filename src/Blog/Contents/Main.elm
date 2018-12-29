module Blog.Contents.Main exposing (articles)

import Blog.Article.Types exposing (Article)
import Blog.Contents.Aesthetics as Aesthetics
import Blog.Contents.Hoge as Hoge
import Blog.Contents.September as September


articles : List Article
articles =
    [ September.article
    , Aesthetics.article
    , Hoge.article
    ]
