module Works.Contents.CG exposing (content)

import Works.Project.Types exposing (..)

content : Project
content =  Project "3D CG" "3dcg" "assets/img/projects/XR-3DCG/fathers-day.png" [
  Description "I occasionally write shader code for raymarching in my free time. The code is on Github at [https://github.com/Spaghet/raymarch](https://github.com/Spaghet/raymarch)"
  ,Picture "./assets/img/projects/XR-3DCG/fathers-day.png"
  ,Description "This is a 3 dimensional Sierpinski triangle fractal rendered in Unity via raymarching"
  ,Video "./assets/img/projects/XR-3DCG/raymarch.mp4"
  ,Description "This is also another object rendered using raymarching which is animated."
  ,Description "I also tried making some audio reactive real time stuff using the OP-1 synth from Teenage Engineering; I wouldn't call it VJ-ing yet."
  ,Video "./assets/img/projects/XR-3DCG/midi2.mp4"
  ,Description "AR, especially Google's Project Tango devices and the Hololens are very appealing to me as well."
  ,Picture "./assets/img/projects/XR-3DCG/room-cloud.jpg"
  ,Picture "./assets/img/projects/XR-3DCG/dynamic-meshing.jpg"
  ]
