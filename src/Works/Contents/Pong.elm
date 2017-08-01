module Works.Contents.Pong exposing (content)

import Works.Project.Types exposing (..)

content : Project
content = Project "Pong.js" "pong" "./assets/img/projects/pong/canvas.png" [
  Description initialDescription
  ,Picture "./assets/img/projects/pong/canvas.png"
  ]

initialDescription : String
initialDescription = """
[Pong.js](https://github.com/Spaghet/pong.js) was one of the first projects that I worked on when I was first learning how to program.
I watched [a video](https://vimeo.com/105955605) on the internet where someone was programming a space invaders game from scratch using HTML canvas and changed the code to create pong.
"""
