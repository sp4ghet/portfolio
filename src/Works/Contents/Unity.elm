module Works.Contents.Unity exposing (content)

import Works.Project.Types exposing (..)


content : Project
content =
    Project "Unity"
        "unity"
        "assets/img/projects/Unity/square.png"
        [ Description "I occasionally write shader code for raymarching in my free time. The code is on Github at [https://github.com/Spaghet/raymarch](https://github.com/Spaghet/raymarch)"
        , Picture "./assets/img/projects/Unity/fathers-day.png"
        , Description "This is a 3 dimensional Sierpinski triangle fractal rendered in Unity via raymarching"
        , Video "./assets/img/projects/Unity/raymarch.mp4"
        , Description "This is also another object rendered using raymarching which is animated."
        , Description "I also tried making some audio reactive real time stuff using the OP-1 synth from Teenage Engineering; I wouldn't call it VJ-ing yet."
        , Video "./assets/img/projects/Unity/midi2.mp4"
        , Description "I've also worked on some GPGPU stuff using Compute Shaders to simulate a school of sardines."
        , Video "./assets/img/projects/Unity/sardines.mp4"
        ]
