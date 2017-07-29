module Works.Contents.CG exposing (content)

import Works.Project.Types exposing (..)

content : Project
content =  Project "3D CG" "3dcg" "assets/img/projects/XR-3DCG/fathers-day.png" [
  Description "I occasionally write shader code for raymarching in my free time."
  ,Picture "/assets/img/projects/XR-3DCG/fathers-day.png"
  ,Video "/assets/img/projects/XR-3DCG/raymarch.mp4"
  ,Description "I also tried making some audio reactive real time stuff, I wouldn't call it VJ-ing yet."
  ,Video "/assets/img/projects/XR-3DCG/midi2.mp4"
  ,Description "AR, especially Google's Project Tango devices and the Hololens are very appealing to me as well."
  ,Picture "/assets/img/projects/XR-3DCG/room-cloud.jpg"
  ,Picture "/assets/img/projects/XR-3DCG/dynamic-meshing.jpg"
  ]
