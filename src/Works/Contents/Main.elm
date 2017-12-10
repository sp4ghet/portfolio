-- This is where we will aggregate all the contents for the individual pages of projects.


module Works.Contents.Main exposing (projects)

import Works.Project.Types exposing (Project, Content)
import Works.Contents.OpenAgBrain as OpenAgBrain
import Works.Contents.CG as CG
import Works.Contents.Unity as Unity
import Works.Contents.Pong as Pong
import Works.Contents.GODEL as GODEL
import Works.Contents.Fab as Fab
import Works.Contents.Aquaponics as Aquaponics


projects : List Project
projects =
    [ OpenAgBrain.content
    , Unity.content
    , CG.content
    , GODEL.content
    , Aquaponics.content
    , Fab.content
    , Pong.content
    ]
