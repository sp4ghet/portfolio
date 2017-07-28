module Works.Types exposing (..)

import Works.Project.Types exposing (Project)

type alias Model = {
  projects: List Project
  }

type Msg = None
