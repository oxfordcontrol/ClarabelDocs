### [Chordal Decomposition](@id user-guide-chordal)

Clarabel implements a chordal decomposition and clique merging method to solve large-scale semidefinite programming problems.   If the problem has favorable structure, this method can decompose a sparse positive semidefiniteness constraint on a large semidefinite cone into a collection of semidefinite constraints on a collection of smaller cones.  This can lead to significant computational savings in terms of both memory and time. 

Clarabel uses the same decomposition strategy as [COSMO.jl](https://oxfordcontrol.github.io/COSMO.jl/stable/decomposition/).   For details see our [paper](https://arxiv.org/abs/1911.05615) on clique merging techniques and this [presentation](https://vimeo.com/439962112) by Michael Garstka.