module State exposing (init, update)

import Top.State as Top
import Works.State as Works
import Types exposing (..)
import Routing exposing (parseLocation)
import Navigation exposing (Location)

init : Location -> (Model, Cmd msg)
init location =
  let
    route = parseLocation location
  in
    (Model
      Top.init
      Works.init
      route
    , Cmd.none)

update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  case msg of
    OnLocationChange location ->
      let
        newRoute = parseLocation location
      in
        ( { model | route = newRoute }, Cmd.none )
    TopMsg message ->
      let
        (topModel, topCmd) =
          Top.update message model.top
      in
        ({ model | top =  topModel}, topCmd)
    WorksMsg message ->
      let
        (worksModel, worksCmd) =
          Works.update message model.works
      in
        ({ model | works = worksModel }, worksCmd)
