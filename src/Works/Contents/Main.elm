-- This is where we will aggregate all the contents for the individual pages of projects.


module Works.Contents.Main exposing (projects)

import Works.Contents.Aquaponics as Aquaponics
import Works.Contents.AtCosme as AtCosme
import Works.Contents.CG as CG
import Works.Contents.Fab as Fab
import Works.Contents.GODEL as GODEL
import Works.Contents.Grad as Grad
import Works.Contents.InfiniteRave as InifiniteRave
import Works.Contents.Lisp as Lisp
import Works.Contents.OpenAgBrain as OpenAgBrain
import Works.Contents.Placelist as Placelist
import Works.Contents.Pong as Pong
import Works.Contents.Unity as Unity
import Works.Contents.Utsuro as Utsuro
import Works.Contents.VJ as VJ
import Works.Project.Types exposing (Content, Project)


projects : List Project
projects =
    [ InifiniteRave.content
    , VJ.content
    , CG.content
    , Utsuro.content
    , Placelist.content
    , AtCosme.content
    , Grad.content
    , Lisp.content
    , OpenAgBrain.content
    , Aquaponics.content
    , Unity.content
    , GODEL.content
    , Pong.content
    , Fab.content
    ]
