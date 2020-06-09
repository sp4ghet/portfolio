module Works.Contents.Utsuro exposing (content)

import Works.Project.Types exposing (Content(..), Project)


content : Project
content =
    Project "虚"
        "utsuro"
        "assets/img/projects/utsuro/square.png"
        [ part1
        , Picture "/assets/img/projects/utsuro/utsuro.gif"
        ]


part1 : Content
part1 =
    Description """
This piece is called 虚 (read: utsuro). 
[https://github.com/sp4ghet/utsuro](https://github.com/sp4ghet/utsuro)

This is one of the rare pieces where I actually put some emotion into a piece.
It was made the day after I went to the hospital for depression.

The word 虚無 is commonly used to refer to feeling like absolute garbage to the point you become numb.
It's often used in hyperbole on the internet.

The word 虚空 is a buddhist term refering to a the void where nothing and everything exists at the same time, a place where there are no obstacles and all is clear.
The image you can peek through the character 空 (which also means sky), is an image of the sky over the great lakes in Michigan, where I grew up.
The gray bleak sky reminds me of home and makes me feel comfortable.

Fortunately, I was able to flip my 虚無 into 虚空.
"""
