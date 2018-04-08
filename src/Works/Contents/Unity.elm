module Works.Contents.Unity exposing (content)

import Works.Project.Types exposing (..)


content : Project
content =
    Project "Unity"
        "unity"
        "assets/img/projects/Unity/square.jpg"
        [ Description "I occasionally write shader code for raymarching in my free time. The code is on Github at [https://github.com/sp4ghet/raymarch](https://github.com/sp4ghet/raymarch)"
        , Picture "./assets/img/projects/Unity/dirt_marching.jpg"
        , Description "This is a 3 dimensional Sierpinski triangle fractal rendered in Unity via raymarching"
        , Youtube "aWW8BYCwJ_k"
        , Description "This is also another object rendered using raymarching which is animated."
        , Description "I also tried making some audio reactive real time stuff using the OP-1 synth from Teenage Engineering; I wouldn't call it VJ-ing yet."
        , Youtube "2UprjV380JE"
        , Description "I've also worked on some GPGPU stuff using Compute Shaders to simulate a school of sardines."
        , Youtube "J08V7aJMBaI"
        ]
