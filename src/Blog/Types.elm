module Blog.Types exposing (..)

import Common.Types exposing (NavModel, NavMsg)
import Blog.Article.Types exposing (Article)


type alias Model =
    { navModel : NavModel
    , articles : List Article
    }


type Msg
    = Nav NavMsg
    | None
