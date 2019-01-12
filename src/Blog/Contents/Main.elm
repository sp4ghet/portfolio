module Blog.Contents.Main exposing (articles)

import Blog.Article.Types exposing (Article)
import Blog.Contents.Lookback2018 as Lookback
import Blog.Contents.September as September
import Blog.Contents.TravisDeploy as TravisDeploy
import Blog.Contents.Multiobjective as Multiobjective


articles : List Article
articles =
    [ Lookback.article
    , September.article
    , TravisDeploy.article
    , Multiobjective.article
    ]
