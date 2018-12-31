-- Defines the page routing for the SPA.
-- All child urls start with a "#" (id)
-- See https://www.elm-tutorial.org/en/07-routing/10-navigation.html for more details


module Routing exposing (..)

import Types exposing (..)
import Navigation exposing (Location)
import UrlParser exposing (Parser, (</>), s, top, int, string, map, oneOf, parseHash)


matchers : Parser (Routes -> a) a
matchers =
    oneOf
        [ map Top top
        , map Works (s "works")
        , map Work (s "works" </> string)
        , map About (s "about")
        , map Blogs (s "blog")
        , map Blog (s "blog" </> string)
        ]


parseLocation : Location -> Routes
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
