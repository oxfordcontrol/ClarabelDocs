# Getting Started

This section describes the process of creating a Clarabel model directly in Python, populating its settings and problem data, solving the problem and obtaining and understanding results.  The complete example from this page can be found [here](@ref python_example_intro_complete).

The first step is to bring the Clarabel solver and other required packages into scope in your code using:

```python
import clarabel
import numpy as np
from scipy import sparse
```

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

The Clarabel default implementation in Python expects matrix data in Compressed Sparse Column format as produced by `scipy`.   We can define our cost data as

```python
P = sparse.csc_matrix(
        [[ 3., 1., -1.],
         [ 1., 4.,  2.],
         [-1., 2.,  5.]])

P = sparse.triu(P).tocsc()

q = np.array([1., 2., -3.])


```

## Constraints

````@eval
using Documenter
Documenter.md_include(
  source = "docs/src/_common/getting_started_constraints.md",
  plaintext = true)
````

We can define our constraint data as

```python
# equality constraint
Aeq = sparse.csc_matrix([1.,1.,-1])

beq = np.array([1.])

# equality constraint
Aineq = sparse.csc_matrix(
        [[0., 1., 0.],
         [0., 0., 1.]])

bineq = np.array([2.,2.])

# SOC constraint
Asoc = -sparse.identity(3)

bsoc = np.array([0.,0.,0.])

# Clarabel constraint data
A = sparse.vstack([Aeq,Aineq,Asoc]).tocsc()

b = np.concatenate([beq,bineq,bsoc])
```

Clarabel expects to receive a vector of cone specifications.  For the above constraints we should also define
```python
cones = [clarabel.ZeroConeT(1),
         clarabel.NonnegativeConeT(2),
         clarabel.SecondOrderConeT(3)]
```

There is no restriction on the ordering of the cones that appear
in `cones`, nor on the number of instances of each type that appear.
Your input vector `b` should be compatible with the sum of the cone dimensions.


````@eval
using Documenter
Documenter.md_include(
  source = "docs/src/_common/getting_started_constraints_note.md",
  plaintext = true)
````

## Solver Settings

Solver settings for the Clarabel's default implementation in Rust are stored in a `PyDefaultSettings` object and can be modified by the user. To create a settings object using all defaults you can call the constructor directly:

```rust
settings = clarabel.DefaultSettings()
```

If you want to disable verbose printing and set a 5 second time limit on the solver, you can then just modify the fields:

```python
settings.verbose = False
settings.time_limit = 5.
```

The Clarabel Python interface set supports the same options as those listed in the [Rust API Reference](@ref api-ref-rust).

## Making a Solver

Finally, populate the solver with problem data and solve:

```python
solver = clarabel.DefaultSolver(P,q,A,b,cones,settings)

solution = solver.solve()
```

## Results

Once the solver algorithm terminates you can inspect the solution using the `solution` output.   The primal solution will be in `solution.x` and the dual solution in `solution.z`.  The outcome of the solve is specified in `solution.status` and will be one of the following :

Status Code  | Description
---  | :---
Solved             |  Solution found
PrimalInfeasible   |  Problem is primal infeasible
DualInfeasible     |  Problem is dual infeasible
MaxIterations      |  Solver halted after reaching iteration limit
MaxTime            |  Solver halted after reaching time limit

The total solution time is available in `solution.solve_time`.  

## CVXPY Interface

The same problem above can also be modelled in CVXPY and solved via Clarabel.

````@eval
using Documenter
Documenter.md_include(
  source = "examples/py/example_intro_cvxpy.py",
  language = :python)
````
