module Works.Contents.CG exposing (content)

import Works.Project.Types exposing (..)


content : Project
content =
    Project "Computer Graphics"
        "cg"
        "assets/img/projects/CG/square.jpg"
        [ Description "I've worked on some VR projects in the past (which I unfortunately can't share). AR, especially Google's Project Tango devices and the Hololens are very appealing to me as well."
        , Picture "./assets/img/projects/CG/room-cloud.jpg"
        , Description "I've also worked on implementing the shaders on the [Pixel Spirit](https://patriciogonzalezvivo.github.io/PixelSpiritDeck/) tarot cards"
        , Youtube "i7FLGoRD_sQ"
        , Description "These were implemented using the atom editor's [VEDA](https://veda.gl/) plugin which I've contributed to a little."
        , Description "The background of this website is also implemented using veda.js which is the standalone library version of veda."
        , Picture "./assets/img/projects/CG/webpage.jpg"
        ]
