module Types exposing (..)

import Navigation exposing (Location)
import Top.Types as Top
import Works.Types as Works
import Works.Project.Types as Project
import About.Types as About
import Blog.Types as Blog


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
    | OnLocationChange Location


type Routes
    = Top
    | Works
    | Work String
    | About
    | Blog
    | NotFoundRoute
