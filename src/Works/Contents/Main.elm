-- This is where we will aggregate all the contents for the individual pages of projects.
module Works.Contents.Main exposing (projects)

import Works.Project.Types exposing (Project, Content)
import Works.Contents.OpenAgBrain as OpenAgBrain


projects : List Project
projects = [
  OpenAgBrain.content
  ]
