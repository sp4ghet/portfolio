module Works.Contents.OpenAgBrain exposing (content)

import Works.Project.Types exposing (..)


content : Project
content =
    Project "openag_brain"
        "openag_brain"
        "./assets/img/projects/openag_brain/square.jpg"
        [ Picture "./assets/img/projects/openag_brain/pfc2_render.jpg"
        , Description initialDescription
        , Picture "./assets/img/projects/openag_brain/hardware-asm.jpg"
        , Picture "./assets/img/projects/openag_brain/ui.jpg"
        , Description fermentaBotDescription
        , Picture "./assets/img/projects/openag_brain/fermenta.jpg"
        ]


initialDescription : String
initialDescription =
    """
[openag_brain](https://github.com/OpenAgInitiative/openag_brain) is the software stack running on a suite of hardware known as food computers. It is being developed at the [MIT Media Lab's Open Agriculture Initiative](https://www.media.mit.edu/groups/open-agriculture-openag/overview/).

The architecture is based on ROS(Robot Operating System) and is able to support flexible hardware configurations.

The main piece of hardware that openag_brain runs on, the PFC(Personal Food Computer) v2 uses a Raspberry Pi and an Arduino to control the climate inside a small growth chamber. (Render shown above.)

The parts that I have worked on are mainly the software, but I have also conducted some hardware assembly as well:
"""


fermentaBotDescription : String
fermentaBotDescription =
    """
The openag_brain software stack has also been used on other food computers, like the [fermentabot](https://github.com/openaginitiative/fermentabot)

The fermentabot has been deployed in the [Basque Culinary Center](http://www.bculinary.com/es/home).
"""
