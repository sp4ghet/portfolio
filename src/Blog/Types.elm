module Blog.Types exposing (..)

import Common.Types exposing (NavModel, NavMsg)
import Blog.Article.Types as Article


type alias Model =
    { navModel : NavModel
    , articles : List Article.Model
    }


type Msg
    = Nav NavMsg
    | None
