module Works.Contents.Placelist exposing (content)

import Works.Project.Types exposing (..)


content : Project
content =
    Project "Placelist"
        "placelist"
        "./assets/img/projects/placelist/square.png"
        [ Description initialDescription
        , Picture "./assets/img/projects/placelist/top.png"
        , Picture "./assets/img/projects/placelist/list.png"
        , Picture "./assets/img/projects/placelist/baku.png"
        ]


initialDescription : String
initialDescription =
    """
Placelist is a service by [Placy](https://placy.city).
I worked on the web frontend, backend, and server infrastructure for their [Placelist](https://placy.city/placelist) service.
It is a service where you can post a playlist about your favorite places, which can also raise awareness for some projects that place might be working on to survive the operating restrictions enforced during the COVID emergency.

One of the highlights of working on this project was having a placelist made by DJ Baku, a DJ I listened to a lot as a child.
The system is implemented using Gatsby, Typescript/Node.js, and AWS. I also wrote Go for an internal application at Placy.
"""
