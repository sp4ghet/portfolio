module Works.Contents.AtCosme exposing (content)

import Works.Project.Types exposing (Content(..), Project)


content : Project
content =
    Project "ART OF SHOPPING"
        "art-of-shopping"
        "/assets/img/projects/art-of-shopping/square.png"
        [ part1
        , Picture "/assets/img/projects/art-of-shopping/top.jpg"
        , Picture "/assets/img/projects/art-of-shopping/kaleido.png"
        , Picture "/assets/img/projects/art-of-shopping/register.jpg"
        ]


part1 : Content
part1 =
    Description """
I helped work on [@cosme "ART OF SHOPPING"](https://whatever.co/en/post/art-of-shopping/) with Whatever and murasaqi.
The part I worked on was the shader for rendering the kaleidoscope as well as other random bits of code and tools for the designer and director.

Unfortunately, it's not something where I was the main programmer or anything, but it is one of my first times engaging in commercial creative coding and advertisement.
It was an interesting experience working with people "in the business" as well as professional designers, so I got to learn a lot and I'm thankful for the opportunity.


"""
