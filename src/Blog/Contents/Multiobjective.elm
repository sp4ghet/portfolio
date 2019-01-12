module Blog.Contents.Multiobjective exposing (..)

import Blog.Article.Types exposing (..)
import Date exposing (Date)


article : Article
article =
    Article
        "Multiobjective Optimization Algorithms"
        "multiobjective-optimization"
        (Date.fromString "12/13/2017")
        "Optimization problems can generally be categorized into 3 types of problems: single objective single optimum questions, multimodal questions, and multiobjective problems; each subsequently leading to increasing levels of complexity."
        [ Words mainText ]


mainText : String
mainText =
    """
# Multiobjective Optimization Algorithms

  * Types of Optimization
  * Key Concepts in Optimization
    * Multiobjective Optimization Concepts
    * Genetic/Evolutionary Algorithm Concepts
  * References

## Types of Optimization

Optimization can be treated as a minimization problem:

$$ min\\ \\mathbb{F}(x) = [F1(x),F2(x)...Fk(x)] $$
  subject to $$ g_j(x) < 0,\\ j=1,2,...,m,\\ h_l(x)=0,\\ l=1,2,...,e $$

where `F` is the objective function vector of size `k` that takes a single argument vector of design variables `x` subject to inequality constraints `g(x) < 0`(ex: `minimumFanCount - x.fanCount < 0`) and equality constraints `h(x) = 0` (ex: `1 - x.controllerCount = 0`). <sup>1</sup>


| Type           | Objective      | Optimum        |
| :------------- | :------------- | :------------- |
| Single         | 1              | 1              |
| Multimodal     | 1              | Multiple       |
| Multiobjective | Multiple       | Multiple       |


Optimization problems can generally be categorized into 3 types of problems: single objective single optimum questions, multimodal questions, and multiobjective problems; each subsequently leading to increasing levels of complexity. <sup>2</sup> The end goal of the GODEL project fits within the multiobjective category; however, the problem can be split into separate multimodal optimization problems for each submodule, leaving the integration and compromise between submodules to the designer. There are several approaches to multiobjective optimization problems, including Genetic Algorithms <sup>3,5</sup>, Particle Swarm Optimization<sup>4</sup>, Physical Computing, Simulated Annealing<sup>6</sup>, or a combination of methods<sup>6</sup>. I don’t know enough about artificial neural networks to argue for their usefulness but they have been mentioned sparsely in the literature.<sup>7</sup>

  * **Genetic Algorithms** are highly general and can be applied to a wide variety of problems, but suffer computational load problems. <sup>1</sup>
  * **Particle Swarm Optimization** techniques are based on boid-like simulations which direct the swarm towards the pareto optimal front. It seems to be a strongly heuristic approach, with faster solutions, but slightly less accurate results.<sup>4</sup>
  * **Simulated Annealing** techniques rely on emulating annealing in thermodynamics, where cooling an object slowly allows it to settle to the lowest energy point(global optima), whereas cooling it quickly can result in the object sitting in a higher energy state(local optima). This approach has problems finding the global optimum in a large design space but is effective at finding the local optima from a smaller local group.<sup>6</sup>
  * **Physical Computing** is an approach which allows for the designer to specify in less strict terms the utopia point. This is done through specifying the weights of various objective functions in terms of curves, rather than absolute values. This approach can be combined with other methods, although the implementation can become more complex, in order to incorporate the expertise of the designer to improve the accuracy of the algorithm.<sup>9</sup>

## Key Concepts in Optimization

  * Multiobjective Optimization Concepts
    * Pareto-Optimality
    * Dominance
    * Utopia Point
  * GA/EA Concepts
    * Fitness
    * Elitism
    * Function Normalization
    * Diversity

#### Multiobjective Optimization Concepts

  * Pareto-Optimality:
   There can be many “equally optimal answers” to an optimization problem, particularly for multiobjective optimization problems. This set of “equally optimal” answers is referred to as the Pareto-Optimal Set, or the Pareto-Optimal Front. There are several definitions in the literature for pareto-optimality, one of which looks like the following:
 $$x^* \\in \\mathbb{X}$$, is pareto optimal iff no other $$x\\in\\mathbb{X}$$ exists, where $$\\mathbb{F}(x) ≦ \\mathbb{F}(x^*)$$ and for any $$F_i$$ in $$\\mathbb{F}$$, $$F_i(x) < F_i(x^*)$$.
  * Dominance:
   Dominance is similar to pareto optimality, except that it deals with the current known dataset. Dominated design vectors are guaranteed to not be part of the pareto-optimal set because there exists another member of the current non-dominated set which can act as `x` in the above definition of pareto-optimality. Dominance is commonly used to discuss the intermittent state of an optimization algorithm while it is running.
  * Utopia Point:
   The Utopia point is the ideal point in which all functions are at their global minimum. This point is usually not achievable under the multiobjective constraint, since there is usually a tradeoff relationship between the objective functions.

#### Genetic/Evolutionary Algorithm Concepts

Genetic/Evolutionary Algorithms are algorithms which are used in a wide variety of optimization problems mainly because they are very general, and can be applied to non-differentiable problems.<sup>1</sup> The Basic idea of Genetic Algorithms was expressed by Holland in 1975; the design variables, referred to as chromosomes, are encoded and expressed by an organism, which is evaluated by a fitness function. The most “fit” organisms are selected and get to reproduce into the next generation. There is usually a random mutation incorporated into the algorithm.<sup>8</sup>

  * Fitness:
   Fitness is an evaluation of how well an optimization process is running. There can be multiple fitness functions in the fitness function vector `F`. There is usually a scalarization process of the function vector to determine the “more fit” output of `F(x)`.
  * Function Normalization:
   In the process of scalarization, it is best to normalize the units that each fitness function generates. For example, if a specific fitness function discusses the millisecond subdivided time required to complete a manual task, and compares that with the number of users, the difference will be too great for the latter information to affect the results of the algorithm. Thus, function outputs are usually normalized to sit between the numbers 0 and 1.
  * Elitism:
   Elitism is a concept in genetic algorithms where the genome from the most fit individuals from a group in a previous generation will be passed down directly to the following generation. This will help alert the algorithm of long periods of stagnant evolution, or help to halt the degradation of species when it strays from the optimum.
  * Diversity:
   Diversity is a similar concept to that in traditional biology, but in the case of genetic algorithms, along with random mutations, assists the algorithm from getting stuck in local optima which can prohibit the algorithm from finding the better, global optima. This can be achieved by penalizing results that are too “close” to an existing undominated design vector, or through specialization integrated into the core of the algorithm.

## References

* * *

  <span name="1">1.</span> Marler, R.t., and J.s. Arora. “Survey of Multi-objective Optimization Methods for Engineering.” Structural and Multidisciplinary Optimization 26.6 (2004): 369-95. Print.↩
  <span name="2">2.</span> Wong, Ka-Chun. “Evolutionary Multimodal Optimization: A Short Survey.” (2015): 1–17. Web. 14 Nov. 2016.↩
  <span name="3">3.</span> Rahmani Asl, Mohammad et al. “BPOpt: A Framework for BIM-Based Performance Optimization.” Energy and Buildings 108 (2015): 401–412. Web.↩
  <span name="4">4.</span> Palermo, Gianluca, Cristina Silvano, and Vittorio Zaccaria. “Discrete Particle Swarm Optimization for Multi-Objective Design Space Exploration.” 2008 11th EUROMICRO Conference on Digital System Design Architectures, Methods and Tools (2008): 641–644. Web. 13 Nov. 2016.↩
  <span name="5">5.</span> Holzer, Martin, Bastian Knerr, and Markus Rupp. “Design Space Exploration with Evolutionary Multi-Objective Optimisation.” 2007 International Symposium on Industrial Embedded Systems. IEEE, 2007. 126–133. Web. 13 Nov. 2016.↩
  <span name="6">6.</span> Qian, Bin, Fanchao Meng, and Dianhui Chu. “A Cost-Driven Multi-Objective Optimization Algorithm for SaaS Applications Placement.” 2015 IEEE International Conference on Smart City/SocialCom/SustainCom (SmartCity). N.p., 2015. 1086–1091. Web. 13 Nov. 2016.↩
  <span name="7">7.</span> Suman, B, and P Kumar. “A Survey of Simulated Annealing as a Tool for Single and Multiobjective Optimization.” Journal of the Operational Research Society 57 (2006): 1143–1160. Web.↩
  <span name="8">8.</span> [Okamura, Kazuhide. “遺伝的アルゴリズム（Genetic Algorithm）を始めよう！” _Slideshare_. 16 Nov. 2014. Web. 10 Nov. 2016](http://www.slideshare.net/kzokm/genetic-algorithm-41617242)
  <span name="9">9.</span> Meb, M., and J. Schlattmann. “The Use of Physical Programming in the Design Process.” Sauder School of Business (2014): 937–942. Web.↩
"""
