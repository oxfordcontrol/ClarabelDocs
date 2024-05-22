# Getting Started

This section describes the process of creating a Clarabel.rs model, populating its settings and problem data, solving the problem and obtaining and understanding results.  It is assumed here that you are building your project using `cargo`.

Full documentation for the Rust API is available in the [API Reference](@ref api-ref-rust).

The first step is to make the Clarabel solver a dependency in your project by adding:

```rust
[dependencies]
clarabel = {version = "0"}
```

to your project's `Cargo.toml` file.    Then bring the solver into scope in your source files:

```rust
use clarabel::algebra::*;
use clarabel::solver::*;
```

The `algebra` module defines the `CscMatrix` type for defining matrices in compressed sparse column format.   It also contains some basic utilities for creating and manipulating sparse matrices.


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

The Clarabel default implementation in Rust expects matrix data as a CscMatrix object and provides a set of basic utilities for sparse matrix construction.   We can define our cost data as

```rust
let P = CscMatrix::new(
    3,                             // m
    3,                             // n
    vec![0, 1, 3, 6],              // colptr
    vec![0, 0, 1, 0, 1, 2],        // rowval
    vec![3., 1., 4., -1., 2., 5.], // nzval
);

let q = vec![1., 2., -3.];
```

!!! tip
    To specify `P = I`, you can use
    ```rust
    let P = CscMatrix::identity(2);
    ```
    where in this case we have had to be specific about the floating point data type we want.   To use a zero matrix (e.g. if solving an LP), you can use
    ```rust
    let P = CscMatrix::spalloc((2,2),0);
    ```
    to construct a sparse matrix with no entries.

    The solver will not conduct any check on the internal correctness of matrices 
    passed in CscMatrix format.   You can do this externally using the `check_format`
    method, e.g.:
    ```rust 
    assert!(P.check_format().is_ok());
    ```
    


## Constraints

````@eval
using Documenter
Documenter.md_include(
  source = "docs/src/_common/getting_started_constraints.md",
  plaintext = true)
````

We can define our constraint data as

```rust
let Aeq = CscMatrix::new(
        1,                 // m
        3,                 // n
        vec![0, 1, 2, 3],  // colptr
        vec![0, 0, 0],     // rowval
        vec![1., 1., -1.], // nzval
    );

    let Aineq = CscMatrix::new(
        2,                // m
        3,                // n
        vec![0, 0, 1, 2], // colptr
        vec![0, 1],       // rowval
        vec![1., 1.],     // nzval
    );

    let mut Asoc = CscMatrix::identity(3);
    Asoc.negate();

    let A = CscMatrix::vcat(&Aeq, &Aineq);
    let A = CscMatrix::vcat(&A, &Asoc);

    let b = vec![1., 2., 2., 0., 0., 0.];

    // optional correctness check 
    assert!(A.check_format().is_ok());
```

Clarabel.rs expects to receive a vector of cone specifications.  For the above constraints we should also define
```rust
# Clarabel.jl cone specification
let cones = [ZeroConeT(1), NonnegativeConeT(2), SecondOrderConeT(3)];
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

Solver settings for the Clarabel's default implementation in Rust are stored in a `DefaultSettings` object and can be modified by the user. To create a settings object using all defaults you can call the constructor directly:

```rust
let settings = DefaultSettings::default();
```

Alternatively, you can use the `DefaultSettingsBuilder` to specify custom settings.   For example, if you want to disable verbose printing and set a 5 second time limit on the solver, you can use:

```rust
let settings = DefaultSettingsBuilder::default()
    .verbose(false)
    .time_limit(1.)
    .build()
    .unwrap();
```
The full set of user configurable solver settings are listed in the [Rust API Reference](@ref api-ref-rust).

## Making a Solver

Finally populate the solver with problem data and solve:

```rust
let mut solver = DefaultSolver::new(&P, &q, &A, &b, &cones, settings);

solver.solve();
```

## Results

Once the solver algorithm terminates you can inspect the solution using the `solution` field of the solver.  

```rust
println!("Solution status = {:?}", solver.solution.status);
println!("Primal solution = {:?}", solver.solution.x);
println!("Dual solution   = {:?}", solver.solution.z);
println!("Primal slacks   = {:?}", solver.solution.s);
```

The outcome of the solve is specified in `solver.solution.status` and will be one of the following :

Status Code  | Description
---  | :---
Unsolved               |  Default value, only occurs prior to calling `solve`
Solved                 |  Solution found
PrimalInfeasible       |  Problem is primal infeasible
DualInfeasible         |  Problem is dual infeasible
AlmostSolved           |  Solution found (reduced accuracy)
AlmostPrimalInfeasible |  Problem is primal infeasible (reduced accuracy)
AlmostDualInfeasible   |  Problem is dual infeasible (reduced accuracy)
MaxIterations          |  Solver halted after reaching iteration limit
MaxTime                |  Solver halted after reaching time limit
NumericalError         |  Solver terminated with a numerical error
InsufficientProgress   |  Solver terminated due to lack of progress

The total solution time is available in `solver.solution.solve_time`.  

````@eval
using Documenter
Documenter.md_include(
  source = "docs/src/_common/getting_started_solution_warn.md",
  plaintext = true)
````
