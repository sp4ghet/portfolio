module Works.Contents.OpenAgBrain exposing (content)

import Works.Project.Types exposing (..)

content : Project
content =  Project "OpenAg Brain" "openag_brain" "assets/img/projects/openag_brain/pfc2_render.jpg" [
  Description initialDescription
  ,Picture "./assets/img/projects/openag_brain/pfc2_render.jpg"
  ]

initialDescription : String
initialDescription = """
## openag_brain

openag_brain is the software stack running on a suite of hardware known as Food Computers. It is being developed at the MIT Media Lab's Open Agriculture Initiative.

- hoge
- fuga
"""
