module Works.Contents.CG exposing (content)

import Works.Project.Types exposing (..)


content : Project
content =
    Project "Computer Graphics"
        "cg"
        "assets/img/projects/CG/square.jpg"
        [ part1
        , Picture "./assets/img/projects/CG/room-cloud.jpg"
        , Description "This is a mandelbulb rendered in Vulkan, using rust. The code is here: [https://github.com/sp4ghet/gfx-learn](https://github.com/sp4ghet/gfx-learn)"
        , Instagram "B4vFn_yj_1t"
        , Description "This is ray tracing in one weekend implemented in pure GLSL [https://github.com/sp4ghet/raytracing_in_one_weekend](https://github.com/sp4ghet/raytracing_in_one_weekend)"
        , Instagram "CBEC4USjf74"
        , Instagram "B9CNQTsjHKq"
        , Description "Here are some houdini experiments, thanks to entagma"
        , Instagram "B70PohUD1Fr"
        , Instagram "B73-L6vDldo"
        , Description "I've also worked on implementing the shaders on the [Pixel Spirit](https://patriciogonzalezvivo.github.io/PixelSpiritDeck/) tarot cards"
        , Youtube "i7FLGoRD_sQ"
        , Description "These were implemented using the atom editor's [VEDA](https://veda.gl/) plugin which I've contributed to a little."
        , Description "The background of this website is also implemented using veda.js which is the standalone library version of veda."
        , Picture "./assets/img/projects/CG/webpage.jpg"
        ]


part1 : Content
part1 =
    Description """
I've worked on some VR projects in the past (which I unfortunately can't share). AR, especially Google's Project Tango devices and the Hololens are very appealing to me as well.
The image below is a mesh generated using the Lenovo Phab 2 Pro, one of the first Project Tango devices released commercially of my room when I used to live in Cambridge, MA.

More recently, I've been experimenting with using rust to try the Vulkan API. I also endulged in raytracing following the famous "Raytracing in One Weekend" book.
I also tried messing around with Houdini before the COVID pandemic forced me to leave my desktop behind in London.
"""
