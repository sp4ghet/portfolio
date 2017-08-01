module Works.Contents.Fab exposing (content)

import Works.Project.Types exposing (..)

content : Project
content = Project "Digital Fabrication" "fab" "./assets/img/projects/fab/coaster.jpg" [
  Description initialDescription
  ,Picture "./assets/img/projects/fab/fab.png"
  ]

initialDescription : String
initialDescription = """
I have been interested in Digital Fabrication ever since I visited Fab Lab Kamakura in high school.

The ability to bring computational structures into the material world while maintaining the freedom provided in digital worlds is amazing and exciting.

On a more currently practical note, being able to make customized items for daily use is very nice :)
"""
