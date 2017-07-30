module Works.Project.Types exposing (..)

type alias Model = Project

type Msg =
  None

type alias Project = {
  title: String
  ,id: String
  ,imgUrl: String
  ,contents: List Content
}

type Content =
  Description String
  |Picture String
  |Video String
