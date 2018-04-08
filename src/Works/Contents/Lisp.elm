module Works.Contents.Lisp exposing (..)

import Works.Project.Types exposing (..)


content : Project
content =
    Project "Slip"
        "slip"
        "./assets/img/projects/slip/square.jpg"
        [ Description initialDescription
        , Picture "./assets/img/projects/slip/repo.png"
        , Description futureWorks
        ]


initialDescription : String
initialDescription =
    """
  I worked through implementing [a lisp interpreter](https://github.com/sp4ghet/slip) in C following [this tutorial](http://www.buildyourownlisp.com/contents).
  """


futureWorks : String
futureWorks =
    """
  Currently, I've only implemented as far as the tutorial provides. Some future work includes running from files (currently only supports a REPL) and more stuff in the stdlib. However, I'd like to do a reimplementation using Rust as well as learn more about programming language compiler and interpreter implementations.

  Some topics I'm interested in include types (so I'd need to work through some set -> group -> category theory math before I get there.) and learning Haskell or ML(OCaml/StandardML).
  """
