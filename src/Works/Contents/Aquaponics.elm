module Works.Contents.Aquaponics exposing (content)

import Works.Project.Types exposing (..)


content : Project
content =
    Project "Aquaponics"
        "aquaponics"
        "./assets/img/projects/aquap/square.png"
        [ Description initialDescription
        , Picture "./assets/img/projects/aquap/first.jpg"
        , Description middleschoolDescription
        , Description highschoolDescription
        , Picture "./assets/img/projects/aquap/whole.jpg"
        , Description hsDetailDescription
        , Picture "./assets/img/projects/aquap/prizes.jpg"
        ]


initialDescription : String
initialDescription =
    """
> <p class="has-text-dark">Aquaponics (/ˈækwəˈpɒnᵻks/) refers to any system that combines conventional aquaculture (raising aquatic animals such as snails, fish, crayfish or prawns in tanks) with hydroponics (cultivating plants in water) in a symbiotic environment.
--- Wikipedia</p>

The first Aquaponics system I built was in middle school in Kakegawa, Japan. It was very basic and didn't involve any complicated control systems.
"""


middleschoolDescription : String
middleschoolDescription =
    """
It involved a simple pump with a syphon to pump the waste water from goldfish going into a Media Filled Growbed(MFG) with gravel medium.
The system worked sufficiently well, and was able to grow some fruits and vegetables.

The main problems with this system were:
  - The syphon malfunctioning
  - Not enough light due to the balcony walls being too high
  - Mother kept harvesting whimsically, killing some plants.
"""


highschoolDescription : String
highschoolDescription =
    """
----
In high school, I did some surveying of aquaponics technology for a research project in school.

The research received an excellence award within the school even though it was just a light survey.

It can be found [here](./assets/pdf/2014.pdf) (English)

In the second research project at school, I made the next iteration of an aquaponics system with some friends which used an Intel Edison to sense and control some parts of the system.
"""


hsDetailDescription : String
hsDetailDescription =
    """
The new system had several changes to the previous one:

1. Artificial lighting
1. Use of Hydroton(expanded clay pebble) medium
1. Removal of syphon system for timed pump system
1. Automated fish feeding
1. Sensing

This solved some of the problems given above and provided some quality of life improvements:

  - ~~The syphon malfunctioning~~
  - ~~Not enough light due to the balcony walls being too high~~
  - Mother kept harvesting whimsically, killing some plants.

Unfortunately, I could not "fix" my mother.

The system won the Softbank Prize and Yahoo Japan! Prize at the Innovator's Summer Hackathon.

I did a writeup on the system [here](./assets/pdf/2015.pdf) (Japanese)
"""
