module Types exposing (..)

import Top.Types as Top

type alias Model = {
  top : Top.Model,
  hoge : Int
  }

type Msg =
  TopMsg Top.Msg
