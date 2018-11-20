module Blog.Article.Types exposing (..)

import Date exposing (Date)
import Common.Types exposing (NavModel, NavMsg)


type Msg
    = Nav NavMsg
    | None


type alias Model =
    { article : Article
    , navModel : NavModel
    }


type alias Article =
    { title : String
    , id : String
    , postDate : Result String Date
    , summary : String
    , body : List Content
    }


type Content
    = Words String
    | Picture String
    | Video String
    | Youtube String
