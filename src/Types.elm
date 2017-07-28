module Types exposing (..)

import Navigation exposing (Location)
import Top.Types as Top
import Works.Types as Works
import Works.Project.Types as Project

type alias Model = {
  top : Top.Model
  , works : Works.Model
  , route: Routes
  }

type Msg =
  TopMsg Top.Msg
  | WorksMsg Works.Msg
  | ProjectMsg Project.Msg
  | OnLocationChange Location

type Routes =
  Top
  | Works
  | Work String
  | About
  | NotFoundRoute
