module Routing exposing (..)

import Types exposing (..)
import Navigation exposing (Location)
import UrlParser exposing (Parser, (</>), s, top, int, string, map, oneOf, parseHash)

matchers : Parser (Routes -> a) a
matchers =
    oneOf
        [ map Top top
        , map Works (s "works")
        , map Work  (s "works" </> string)
        , map About (s "about")
        ]

parseLocation : Location -> Routes
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
