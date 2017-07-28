module Common.Types exposing (..)

type alias Name = {
  first : JpEnText,
  last : JpEnText
}

type alias JpEnText = {
  jp : String,
  en : String
}
