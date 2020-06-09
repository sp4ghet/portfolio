module Works.Contents.VJ exposing (content)

import Works.Project.Types exposing (Content(..), Project)


content : Project
content =
    Project "Live Visuals"
        "vj"
        "assets/img/projects/vj/square.png"
        [ part1
        , Picture "/assets/img/projects/vj/logo_smol.gif"
        , Picture "/assets/img/projects/vj/front.gif"
        , Picture "/assets/img/projects/vj/glitch.gif"
        , Instagram "Bxo7Ck-j2Gk"
        , part2
        , Instagram "B7kaj7HjQx8"
        ]


part1 : Content
part1 =
    Description """
I occasionally do live VJ sets using realtime computer graphics. Most of my sets use Unity with a mixture of audio reactive elements and elements controlled by a MIDI controller.

The shows I've worked on include AlgoMesh 2019 at AlgoMech, an algorave hosted by yaxu. It was great fun, and I got to meet Devine Lu Linvega for the first time. He is the creator of ORC∧, ronin, and Rotonde among other great tools and projects.
I also really enjoy hellocatfood's work and it was good to see him live as well. I was really sick that day so I regret being half conscious the whole time.

Another set I did was with [UCL's Electronic Music Society (EMS)](https://www.facebook.com/uclemsoc/) for their Synergy show at Corsica Studios in London. This one was also lots of fun. The crowds in the UK are much more energetic than the ones in Japan so it's always a great time.


Unfortunately, I don't have any video archives but you can see the source code for the set here [https://github.com/sp4ghet/algomesh](https://github.com/sp4ghet/algomesh).
Here are some gifs from the set:
"""


part2 : Content
part2 =
    Description """
Unfortunately didn't really have a cameraman for the EMS show either, so it's just a phone video from the night, but here is a clip from the EMS show:
"""
