module Types exposing (..)

import Navigation exposing (Location)
import Top.Types as Top
import Works.Types as Works
import String

type alias Model = {
  top : Top.Model
  , works : Works.Model
  , route: Routes
  }

type Msg =
  TopMsg Top.Msg
  | WorksMsg Works.Msg
  | OnLocationChange Location

type Routes =
  Top
  | Works
  | Work String
  | About
  | NotFoundRoute
