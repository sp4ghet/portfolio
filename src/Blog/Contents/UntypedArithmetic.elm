module Blog.Contents.UntypedArithmetic exposing (..)

import Blog.Article.Types exposing (..)
import Date exposing (Date)


article : Article
article =
    Article
        "Untyped Arithmetic and Proofs about Languages (Part 1)"
        "untyped-arithmetic-1"
        (Date.fromString "01/16/2019")
        "I've recently been reading Types and Programming Languages (TaPL) and figured I should take notes while I do so. This is from Chapter 3, Untyped Arithmetic. I will try to explain the contents from Chapter 1 and 2 as needed but will keep to explaining the simple arithmetic language described in chapter 3 as well as showing how we can investigate it using Operational Semantics."
        [ Words text ]


text : String
text =
    """
I've recently been reading Types and Programming Languages (TaPL) and figured I should take notes while I do so. This is from Chapter 3, Untyped Arithmetic. I will try to explain the contents from Chapter 1 and 2 as needed but will keep to explaining the simple arithmetic language described in chapter 3 as well as showing how we can investigate it using Operational Semantics.

The main goal here will be to understand the difference between _syntax_ and _semantics_ as well as learning a formal method of looking at languages. We will explore how these formal definitions help us in examining characteristics of a language and seeing how theoretical computer scientists analyze languages.

The numbering of theorems and definitions will follow the same numbering as the ones in TaPL, so if you own a copy of the book you can refer to the actual book to see the proof but the goal of this post is to show a broad overview of the chapter so I will omit things that should feel self evident.

### Defining the language syntax

The _syntax_ for the simple language we will be looking at is shown below:

```
t ::=
  true
  false
  if t then t else t
  0
  succ t //successor
  pred t //predecessor
  iszero t
```
Note that there is no type distinction between natural numbers and booleans.
This defines a _term_ `t` which can be combined to form "sentences" in our syntax, which are also terms.
We can write things like `if true then 0 else 0` and `succ (pred (succ 0))` and `if (iszero 0) then true else false`. We don't actually define how parentheses are evaluated but we add them in our examples for clarity.

We don't explain how our syntax is _evaluated_, so our language currently lacks any meaning, or _semantics_. We will add semantics in the next section.
It is also of note that we don't define common arithmetic regarding the natural numbers such as addition or subtraction, but one can see how those operations can be expressed as a combination of `succ` and `pred`, if we take `succ 0` to mean 1 and `pred (succ (succ 0))` to also mean 1.

There are a few formal ways to construct this syntax, namely through _induction_, _inference rules_, and _construction_. I want to show how inference rules are expressed, so the reader can more easily understand the notation of _transition functions_ which show up in the next section when we define our semantics.
Our goal is to define the set $$\\mathcal{T}$$ which is the set of all possible terms in our syntax.

$$
  \\mathtt{true} \\in \\mathcal{T}
  \\quad  \\mathtt{false} \\in \\mathcal{T}
  \\quad 0 \\in \\mathcal{T}
  \\\\  \\cfrac{\\mathtt{t_1} \\in \\mathcal{T}}{\\mathtt{succ\\ t_1} \\in \\mathcal{T}}
  \\quad \\cfrac{\\mathtt{t_1} \\in \\mathcal{T}}{\\mathtt{pred\\ t_1} \\in \\mathcal{T}}
  \\quad \\cfrac{\\mathtt{t_1} \\in \\mathcal{T}}{\\mathtt{iszero\\ t_1} \\in \\mathcal{T}}
  \\\\ \\cfrac{
              \\mathtt{t_1} \\in \\mathcal{T}
              \\quad \\mathtt{t_2} \\in \\mathcal{T}
              \\quad \\mathtt{t_3} \\in \\mathcal{T}
             }
             {
              \\mathtt{if\\ t_1\\ then\\ t_2\\ else\\ t_3} \\in \\mathcal{T}
             }
$$

The notation shows how one can _infer_ the bottom _conclusion_ if the _meta variables_ (ex: $$\\mathtt{t_1}$$) in the top part satisfy the _conditions_ above it. We can express the infinite set of possible syntactic statements $$\\mathcal{T}$$ in a finite set of rules because we have these meta variables (ex: `if (iszero 0) then true else false` is contained within $$\\mathtt{if\\ t_1\\ then\\ t_2\\ else\\ t_3}$$).  Conclusions with no conditions are called _axioms_.


Initially, we will investigate a reduced subset of this language dealing with only the boolean arithmetic:

```
t ::=
  true
  false
  if t then t else t
```

### Syntax, Semantics, and Evaluation

Our language now has syntax and we are ready to add meaning, or _semantics_.
For example, the terms `iszero true` or `if 0 then t else t` are syntactically valid, but they should feel "meaningless" in practice. Semantics provides us with a way to understand what kinds of terms have meaning and which ones do not.

There are several approaches to semantics. Of note is _Axiomatic Semantics_, _Denotational Semantics_, and _Operational Semantics_. We will look at operational semantics in order to give meaning to our language.
Operational semantics gives meaning to our syntax by defining an _abstract interpreter_ of _terms_ in our syntax. Keep in mind a term can be a combination of the basic rules used to define a term; `true` and `if true then true else (if false then true else false)` are both terms.
This abstract machine can be thought of as an _automaton_ (like a finite state automaton) with the current term being treated as its state and the state transitions being an evaluation of the current term into some other term. The meaning of a term is the final state of the automaton if and when it _terminates_. In our example, the meaning of a term will be the _value_ that is returned when a term is _evaluated_ (ie: either `true` or `false`).

We define the operational semantics of our boolean arithmetic below:

| syntax | transition rules |
| :----- | :--------------- |
| $$$
\\mathtt{t\\ ::=}
\\\\ \\quad \\mathtt{true}
\\\\ \\quad \\mathtt{false}
\\\\ \\quad \\mathtt{if\\ t \\ then \\ t\\ else\\ t}
\\\\
\\\\ \\mathtt{v\\ ::=}
\\\\ \\quad \\mathtt{true}
\\\\ \\quad \\mathtt{false}
$$$ | $$$
  \\mathtt{if~true~then~t_2~else~t_3~\\to~t_2} \\quad \\text{(E-IFTRUE)}
  \\\\ \\mathtt{if~false~then~t_2~else~t_3~\\to~t_3} \\quad \\text{(E-IFFALSE)}
  \\\\ \\cfrac{
    \\mathtt{t_1~\\to~t'_{1}}
  }{
    \\mathtt{if~t_1~then~t_2~else~t_3}
  } \\quad \\text{(E-IF)}
  \\\\ \\to \\mathtt{if~t'_{1}~then~t_2~else~t_3}
$$$ |

We have defined 3 sets, the set of terms, the set of _values_, and the set of _transition rules_. Transition rules are expressed as _transition functions_.
There are a few things to note here. One is that we make a distinction between _values_ and _terms_ in our syntax now. The main addition here is the right hand side of the table, which shows the _transition rules_ of our language. This describes what kind of terms can be transitioned into other terms.

For example, We can say $$\\tt{if~true~then~true~else~false} \\to \\tt{true}$$ due to transition rule $$\\text{E-IFTRUE}$$.
This should be self evident, but the order of operations when dealing with rule $$\\text{E-IF}$$ deserves to be mentioned explicitly:

$$\\mathtt{if~(if~true~then~true~else~false)}
    \\\\ \\quad \\mathtt{then~(if~false~then~true~else~false)}
    \\\\ \\quad \\mathtt{else~true}
  \\\\ \\to \\mathtt{if~true~then~(if~false~then~true~else~false)~else~true} \\quad \\because \\text{(E-IF)}
  \\\\ \\to \\mathtt{if~false~then~true~else~false} \\quad \\because \\text{(E-IFTRUE)}
  \\\\ \\to \\mathtt{false} \\quad \\because \\text{(E-IFFALSE)}$$

We evaluate the condition term of the if statement before we evaluate the content terms to return. The transition rule $$\\text{E-IF}$$ determines the behaviour, the order of operations in this case, of our abstract interpreter.

Let us explicitly make note of a property of this semantics. Note that this is only true for the particular semantics we are looking at, and are aimed to describe properties of our semantics, not discern general truths about all semantics.

**Theorem 3.5.4**: A transition function is deterministic, i.e. if $$\\mathtt{t}\\to\\mathtt{t'}$$ and $$\\mathtt{t}\\to\\mathtt{t''}$$ then $$\\mathtt{t'}=\\mathtt{t''}$$.

Now, notice how there is no rule to transition from $$\\tt{false}$$ onwards. We say that terms which cannot be transitioned from any further are in its _normal form_.

**Theorem 3.5.7**:  All values are in its normal form.

**Theorem 3.5.8**: All terms in its normal form are values.

Hopefully these two theorems are also self evident for our language.

We express using the symbol $$\\to^*$$ as opposed to just $$\\to$$ for a transition. We call a series of transitions from a term to its normal form an _evaluation_.

**Theorem 3.5.11**: An evaluation is deterministic, i.e. if $$\\tt{u}$$ and $$\\tt{u'}$$ are in its normal form, $$\\mathtt{t} \\to^* \\mathtt{u} ~\\land~ \\mathtt{t} \\to^* \\mathtt{u'} \\implies \\mathtt{u} = \\mathtt{u'}$$

**Theorem 3.5.12**: In our simplified language, all terms can be evaluated to its normal form.

The proof for this is an interesting one. Another way to interpret this theorem is to say that our automaton _terminates_ after a finite amount of state transitions.
We will prove that our automaton terminates, which in turn should provide us with a more vivid view of what it means for a program to terminate.
In order to do this, we introduce the idea of a _well founded set_.

**Definition 2.2.10**: A well founded set $$S$$ is a set with a _partial order relation_ $$\\leq$$ with no _infinite descending chains_.
In simpler terms, this means that we can define a "minimum" value from our set. (ex: 1 is the minimum of $$\\mathbb{N}$$, so the set of natural numbers is well founded.)

The basic flow of proofs about termination is as follows:
  1. We define a mapping $$f$$ from the automaton's state $$\\tt{t}$$ to some well founded set $$S$$.
  1. Then, we show that a state transition $$\\mathtt{t}\\to\\mathtt{t'}$$ satisfies $$f(\\mathtt{t})<f(\\mathtt{t'})$$.
  1. Thus, a series of state transitions is finite (the automaton terminates) because there is no infinite descending chain for set $$S$$.

**Proof for theorem 3.5.12**: First, we define our mapping $$f$$.
$$f(\\mathtt{t}) := size(\\mathtt{t})$$
where
$$
  \\quad size(\\mathtt{true}) = 1
  \\\\ \\quad size(\\mathtt{false}) = 1
  \\\\ \\quad size(\\mathtt{if~t_1~then~t_2~else~t_3}) = 1+size(\\mathtt{t_1})+size(\\mathtt{t_2})+size(\\mathtt{t_3})
$$

$$f$$ maps a term to the set of natural numbers $$\\mathbb{N}$$ which is well founded.

We can see how each transition reduces the size of a term, as each transition will "remove" one $$\\tt{if}$$ statement from the term, so $$f(\\mathtt{t}) < f(\\mathtt{t'}) \\quad \\text{q.e.d.}$$.

Once we begin to add more features to our language, this will not always be the case; adding recursive functions will cause infinite loops.

### Tweaking the Semantics for New Behaviour

Let us add a new transition function to our existing transition rules:

$$\\mathtt{if~true~then~t_2~else~t_3} \\to \\mathtt{t_3} \\quad \\text{(E-FUNNY1)}$$

This invalidates some of our theorems that we have mentioned above. Theorem 3.5.4 no longer holds, as transitions are now ambiguous when a term looks like `if true then t_1 else t_2`. 3.5.11 also does not hold, since the evaluation is also ambiguous. 3.5.7 and 3.5.8 still holds as we can still evaluate a term to a value, as all our previous rules still exist.

Now, let us add a different transition function instead of $$\\text{E-FUNNY1}$$:

$$
\\cfrac{
  \\mathtt{t_2} \\to \\mathtt{t_2'}
}{
  \\mathtt{if~t_1~then~t_2~else~t_3} \\to \\mathtt{if~t_1~then~t_2'~else~t_3}
}
\\quad \\text{(E-FUNNY2)}
$$

With the addition of this rule, we can see that 3.5.4 no longer holds, much like the previous example. However, 3.5.11 still holds, because the only ambiguity introduced is in the order of operations, not the resulting value. 3.5.7 and 3.5.8 still hold for the same reason as before.

### To be continued...

In this post, we have explored the concept of syntax and semantics, taking a closer look at what we can formally say about a language.
In the next section, we will add the arithmetic regarding natural numbers again and explore syntactically valid terms which are semantically meaningless.
"""
