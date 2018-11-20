module Types exposing (..)

import Navigation exposing (Location)
import Top.Types as Top
import Works.Types as Works
import Works.Project.Types as Project
import About.Types as About
import Blog.Types as Blog
import Blog.Article.Types as Article


type alias Model =
    { top : Top.Model
    , works : Works.Model
    , about : About.Model
    , blog : Blog.Model
    , route : Routes
    }


type Msg
    = TopMsg Top.Msg
    | WorksMsg Works.Msg
    | ProjectMsg Project.Msg
    | AboutMsg About.Msg
    | BlogMsg Blog.Msg
    | ArticleMsg Article.Msg
    | OnLocationChange Location


type Routes
    = Top
    | Works
    | Work String
    | About
    | Blogs
    | Blog String
    | NotFoundRoute
