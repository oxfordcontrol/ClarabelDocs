# Getting Started

This section describes the process of creating a Clarabel.jl model, populating its settings and problem data, solving the problem and obtaining and understanding results.  The description here relates to Clarabel's native API.  

The first step is to bring the Clarabel solver and other required packages into scope in your code using:

```julia
using Clarabel, SparseArrays, LinearAlgebra
```

The `SparseArrays` package from the Julia standard distribution defines the `SparseMatrixCSC` type for defining matrices in compressed sparse column format.  

* __JuMP / Convex.jl support__: We provide an interface to [MathOptInterface](https://jump.dev/JuMP.jl/stable/moi/) (MOI), which allows you to describe your problem in [JuMP](https://github.com/JuliaOpt/JuMP.jl) and [Convex.jl](https://github.com/JuliaOpt/Convex.jl).  If you want to use `JuMP` or `Convex.jl` to model your  problem instead, see the [JuMP Interface](@ref) and [Convex.jl Interface](@ref) sections.

## Problem Format

````@eval
using Documenter
Documenter.md_include(
  source = "docs/src/_common/getting_started_problem.md",
  plaintext = true)
````

## Objective Function
````@eval
using Documenter
Documenter.md_include(
  source = "docs/src/_common/getting_started_objective.md",
  plaintext = true)
````

The Clarabel default implementation in Julia expects matrix data in sparse `SparseMatrixCSC` format.  We can define our cost data as

```julia
P = sparse([3. 1 -1; 0 4 2; 0 0 5])
q = [1,2,-3.]
```


## Constraints

````@eval
using Documenter
Documenter.md_include(
  source = "docs/src/_common/getting_started_constraints.md",
  plaintext = true)
````

We can then define our constraint data as

```julia
using SparseArrays

# equality constraint
Aeq = [1. 1. -1.]
beq = [1.]

# inequality constraint
Aineq = [0. 1. 0.;
         0. 0. 1.]
bineq = [2.,2.]

# SOC constraint
Asoc = -I(3)*1.
bsoc = [0.,0.,0.]

# Clarabel.jl constraint data
A = sparse([Aeq; Aineq; Asoc])
b = [beq;bineq;bsoc]
```

Clarabel.jl expects to receive a vector of cone specifications.  For the above constraints we  should also define
```julia
# Clarabel.jl cone specification
cones = [Clarabel.ZeroConeT(1), Clarabel.NonnegativeConeT(2), Clarabel.SecondOrderConeT(3)]
```

There is no restriction on the ordering of the cones that appear in `cones`, nor on the number of instances of each type that appear.  The `cones` should be of type `Vector{Clarabel.SupportedCone}`, and your input vector `b` should be compatible with the sum of the cone dimensions.

````@eval
using Documenter
Documenter.md_include(
  source = "docs/src/_common/getting_started_constraints_note.md",
  plaintext = true)
````


## Solver Settings

Solver settings are stored in a `Settings` object and can be modified by the user. To create a `Settings` object just call the constructor:

```julia
settings = Clarabel.Settings()
```

To adjust those values, you can pass options and parameters as a key-value pair to the constructor or edit the corresponding field afterwards. For example, if you want to disable verbose printing and set a 5 second time limit on the solver, you can use
```julia
settings = Clarabel.Settings(verbose = false, time_limit = 5)

# the following is equivalent
settings = Clarabel.Settings()
settings.verbose    = false
settings.time_limit = 5
```

The full set of user configurable solver settings are listed in the [API Reference](@ref api-settings).


## Making a Solver

The problem data, user settings and workspace variables are all stored in a top level `Solver` type. First define an empty Solver:

```julia
solver  = Clarabel.Solver()
```

Then provide the solver with problem data using

```julia
Clarabel.setup!(solver, P, q, A, b, cones, settings)
```

This takes an internal copy of all data parameters and initializes internal variables and other objects in the solver.  The final `settings` argument is optional.

Now you can solve your problem using:
```julia
solution = Clarabel.solve!(solver)
```

## Results

Once the solver algorithm terminates you can inspect the solution using the `solution` object.   The primal solution will be in `solution.x` and the dual solution in `solution.z`. The outcome of the solve is specified in `solution.status` and will be one of the following :

### Status Codes


Status Code  | Description
---  | :---
UNSOLVED            |  Default value, only occurs prior to calling `Clarabel.solve!`
SOLVED              |  Solution found
PRIMAL_INFEASIBLE   |  Problem is primal infeasible
DUAL_INFEASIBLE     |  Problem is dual infeasible
MAX_ITERATIONS      |  Solver halted after reaching iteration limit
MAX_TIME            |  Solver halted after reaching time limit

The total solution time (include combined `setup!` and `solve!` times) is given in `solution.solve_time`.   Detailed information about the solve time and memory allocation can be found in the solver's `timer` field.

````@eval
using Documenter
Documenter.md_include(
  source = "docs/src/_common/getting_started_solution_warn.md",
  plaintext = true)
````
