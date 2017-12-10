module Works.Contents.CG exposing (content)

import Works.Project.Types exposing (..)


content : Project
content =
    Project "Computer Graphics"
        "cg"
        "assets/img/projects/CG/square.jpg"
        [ Description "I've worked on some VR projects in the past (which I unfortunately can't share). AR, especially Google's Project Tango devices and the Hololens are very appealing to me as well."
        , Picture "./assets/img/projects/CG/room-cloud.jpg"
        , Picture "./assets/img/projects/CG/dynamic-meshing.jpg"
        , Description "I've also worked on implementing the shaders on the [Pixel Spirit](https://patriciogonzalezvivo.github.io/PixelSpiritDeck/) tarot cards"
        , Video "./assets/img/projects/CG/pixel_spirit.mp4"
        , Description "These were implemented using the atom [VEDA](https://github.com/fand/veda) plugin which I've contributed to a little."
        ]
