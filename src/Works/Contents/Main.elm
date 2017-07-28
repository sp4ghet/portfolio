-- This is where we will aggregate all the contents for the individual pages of projects.
module Works.Contents.Main exposing (projects)

import Works.Project.Types exposing (Project, Content)


projects : List Project
projects = [
  Project "OpenAg Brain" "openag_brain" "assets/img/projects/openag_brain/pfc2_render.jpg" []
  ]
