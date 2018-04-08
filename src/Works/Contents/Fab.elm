module Works.Contents.Fab exposing (content)

import Works.Project.Types exposing (..)


content : Project
content =
    Project "Digital Fabrication"
        "fab"
        "./assets/img/projects/fab/square.jpg"
        [ Description initialDescription
        , Picture "./assets/img/projects/fab/fab.jpg"
        , Picture "./assets/img/projects/fab/laptop.jpg"
        , Description moreDescription
        ]


initialDescription : String
initialDescription =
    """
I have been interested in Digital Fabrication ever since I visited Fab Lab Kamakura in high school.

The ability to bring computational structures into the material world while maintaining the freedom provided in digital worlds is amazing and exciting.

On a more currently practical note, being able to make customized items for daily use is very nice :)
"""


moreDescription : String
moreDescription =
    """
I laser engraved my laptop at FabCafe Tokyo with a few of my favorite phrases.

1. "Ich bin meine Welt."
  - This is a phrase from [Ludwig Wittgenstein](https://www.wikiwand.com/en/Ludwig_Wittgenstein) meaning "I am my World." from the Tractatus Logico Philosophicus.
1. "λそれ.そう"
  - This is a combination of [Lambda Calculus](https://www.wikiwand.com/en/Lambda_calculus) and the phrase "それはそう".
  - Lambda calculus is an idea that originates from Alonzo Church and provides another way to look at computable machines. The more popular way that computability is understood is the [Turing machine](https://www.wikiwand.com/en/Turing_machine). A simplified understanding of the meaning of λx.y is to think of it as functions `f(x) = y` in math.
  - "それはそう"  (Translates to "That is that.") is the ultimate tautology. I personally believe it emcompasses all expressible statements and is the most minimal statement.
1. `e^iθ = cosθ + isinθ` is [Euler's formula](https://www.wikiwand.com/en/Euler's_formula). It's the first mathematical equation that I worked through and derived on my own, instead of in school, so it holds a special place in my heart.
  """
