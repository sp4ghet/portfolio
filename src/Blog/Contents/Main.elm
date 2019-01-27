module Blog.Contents.Main exposing (articles)

import Blog.Article.Types exposing (Article)
import Blog.Contents.Lookback2018 as Lookback
import Blog.Contents.September as September
import Blog.Contents.TravisDeploy as TravisDeploy
import Blog.Contents.Multiobjective as Multiobjective
import Blog.Contents.VJ as VJ
import Blog.Contents.UntypedArithmetic1 as Untyped1
import Blog.Contents.UntypedArithmetic2 as Untyped2


articles : List Article
articles =
    [ Untyped2.article
    , Untyped1.article
    , VJ.article
    , Lookback.article
    , September.article
    , TravisDeploy.article
    , Multiobjective.article
    ]
