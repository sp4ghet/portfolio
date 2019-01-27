module Blog.Contents.UntypedArithmetic2 exposing (..)

import Blog.Article.Types exposing (..)
import Date exposing (Date)


article : Article
article =
    Article
        "TaPL Summary Part 2: Adding Operations on Natural Numbers"
        "untyped-arithmetic-2"
        (Date.fromString "01/22/2019")
        "This is part 2 of a series summarizing Types and Programming Languages (TaPL). In the [previous post](#blog/untyped-arithmetic-1) we looked at a simple language which described basic boolean operations. We will now examine what happens to the language when we add natural numbers into our language."
        [ Words text ]


text : String
text =
    """
This is part 2 of a series summarizing Types and Programming Languages (TaPL). In the [previous post](#blog/untyped-arithmetic-1) we looked at a simple language which described basic boolean operations. We will now examine what happens to the language when we add natural numbers into our language.

## Review of the Expanded Syntax

Let us recall our limited boolean arithmetic's syntax:

```
t ::=
  true
  false
  if t then t else t
```

The expanded syntax now looks like this:

```
t ::=
  true
  false
  if t then t else t
  0
  succ t
  pred t
  iszero t
```

## Expanding the Semantics

Shown below is a continuation of the semantics table from Part 1. The parts mentioned in the previous table have been omitted for conciseness, and an ellipsis has been included where omissions have taken place to indicate that the new definitions are continuations of the previous tabe.

| syntax | transition rules |
| :----- | :--------------- |
| $$$
\\mathtt{t\\ ::=\\ ...}
\\\\ \\quad \\mathtt{0}
\\\\ \\quad \\mathtt{succ~t}
\\\\ \\quad \\mathtt{pred~t}
\\\\ \\quad \\mathtt{iszero~t}
\\\\~
\\\\ \\mathtt{v\\ ::=\\ ...}
\\\\ \\quad \\mathtt{nv}
\\\\~
\\\\ \\mathtt{nv\\ ::=}
\\\\ \\quad \\mathtt{0}
\\\\ \\quad \\mathtt{succ~nv}
$$$ | $$$
  ...\\\\
  \\cfrac{
    \\mathtt{t_1~\\to~t'_1}
  }{
    \\mathtt{succ~t_1~\\to~succ~t'_1}
  } \\quad \\text{(E-SUCC)}
  \\\\~
  \\\\ \\mathtt{pred~0~\\to~0} \\quad \\text{(E-PREDZERO)}
  \\\\~
  \\\\ \\mathtt{pred~(succ~nv_1)~\\to~nv_1} \\quad \\text{(E-PREDSUCC)}
  \\\\~
  \\\\ \\cfrac{
    \\mathtt{t_1~\\to~t'_1}
  }{
    \\mathtt{pred~t_1~\\to~pred~t'_1}
  } \\quad \\text{(E-PRED)}
  \\\\~
  \\\\ \\mathtt{iszero~0\\ \\to\\ true} \\quad \\text{(E-ISZEROZERO)}
  \\\\~
  \\\\ \\mathtt{iszero~(succ~nv_1)\\ \\to\\ false} \\quad \\text{(E-ISZEROSUCC)}
  \\\\~
  \\\\ \\cfrac{
    \\mathtt{t_1~\\to~t'_1}
  }{
    \\mathtt{iszero~t_1\\ \\to\\ iszero~t'_1}
  } \\quad \\text{(E-ISZERO)}
$$$ |

Of particular note is the addition of a new set, $$\\tt{nv}$$, which describes values that are numbers.
Since there is no rule to transition from `0`, as well as `succ 0`, we can use these to construct any arbitrary natural number.

Another thing to note is that in $$\\text{E-PREDSUCC}$$, we use $$\\tt{nv_1}$$ instead of $$\\tt{t_1}$$. This means that, for example, $$\\text{E-PREDSUCC}$$ cannot transition `pred (succ (pred 0))` to `pred 0`, we first need to convert `pred 0` to `0` using $$\\text{E-PREDZERO}$$ and then apply $$\\text{E-SUCC}$$ to `0`, which then applies $$\\text{E-PRED}$$ to `succ 0` to get `pred (succ 0)` which can finally be evaluated as `0` using $$\\text{E-PREDSUCC}$$. This explanation can be quite lengthly and difficult to follow, so we introduce a new notation using a _derivation tree_ to show how terms are evaluated:

$$
\\cfrac{}{
\\cfrac{
  \\mathtt{pred~0\\ \\to\\ 0}
}{
\\cfrac{
  \\mathtt{succ~(pred~0)\\ \\to\\ succ~0}
}{
\\cfrac{
    \\mathtt{pred~(succ~(pred~0))\\ \\to\\ pred~(succ~0)}
}{
  \\mathtt{pred~(succ~(pred~0))\\ \\to\\ 0}
} \\text{E-PREDSUCC}
} \\text{E-PRED}
} \\text{E-SUCC}
} \\text{E-PREDZERO}

$$

You proceed along the left side of the tree, reducing each term until it can be evaluated to a value, which then gets passed along back down the tree where the reduced term is shown on the right hand side. The transition rule which was applied to perform the reduction is shown next to the line above the particular state change.

## Error States

Now there is a problem in this language that we haven't seen before. For example, terms such as `if 0 then true else false` or `iszero true` are syntactically valid statements to make, but there is no transition function to evaluate the terms to a value. These "dead end" states in our semantics are called _deadlock states_. These are analogous to runtime errors like segmentation faults, illegal operations, or exceptions in real world programming languages.

Being unable to express and reason about these states is troublesome if we want to form a solid foundation for a theoretical understanding of programming languages. Therefore, we will expand our existing language for untyped arithmetic.

| syntax | transition rules |
| :----- | :--------------- |
| $$$
\\mathtt{t\\ ::=\\ ...}
\\\\ \\mathtt{badnat\\ ::=}
\\\\ \\quad \\mathtt{wrong}
\\\\ \\quad \\mathtt{true}
\\\\ \\quad \\mathtt{false}
\\\\~
\\\\ \\mathtt{badbool\\ ::=}
\\\\ \\quad \\mathtt{wrong}
\\\\ \\quad \\mathtt{nv}
$$$ | $$$
...
\\\\ \\mathtt{if~badbool~then~t_1~else~t_2} \\to \\mathtt{wrong} \\quad \\text{(E-IF-WRONG)}
\\\\ \\mathtt{succ~badnat} \\to \\mathtt{wrong} \\quad \\text{(E-SUCC-WRONG)}
\\\\ \\mathtt{pred~badnat} \\to \\mathtt{wrong} \\quad \\text{(E-PRED-WRONG)}
\\\\ \\mathtt{iszero~badnat} \\to \\mathtt{wrong} \\quad \\text{(E-ISZERO-WRONG)}
$$$ |

We can see that both `badnat` and `badbool` contain `wrong`. Thus, any `wrong`s in the evaluation will propagate to the final result, indicating that there was some invalid term. This is similar to how exceptions bubble upwards in most programming languages. Thus, we are now able to evaluate all clauses to a value once again. Although this is not the most elegant way of dealing with error cases as the errors will still be detected at runtime, we have at least subverted the problem of being unable to express there being cases where we have irreducible terms.

## To be continued...

I assume that the rest of TaPL will work towards introducing various type systems to detect these `wrong`s at compile time, instead of bubbling them up as exceptions at run time. I will hopefully be able to continue with this series given I have enough time..

"""
