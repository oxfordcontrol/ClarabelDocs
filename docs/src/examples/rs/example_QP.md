Complete Cargo projects for all Rust examples can be found in [examples/rs](../../../../../../examples/rs).

# Basic QP Example in Rust

We will show how to solve the Basic QP example using Rust.   It is assumed here that you are building your project using `cargo`.

The first step is to add the solver to your project's `Cargo.toml` file like so:

```rust
[dependencies]
clarabel = "0.1"  
```

Then bring the solver into scope in your source files:

```rust
use clarabel::algebra::*;
use clarabel::solver::*;
```

The `algebra` module defines the `CscMatrix` type for defining matrices in compressed sparse column format.   It also contains some basic utilities for creating and manipulating sparse matrices.


### Problem data

Next define the data for the objective function and the constraints:

```rust
let P = CscMatrix::new(
    2,             // m
    2,             // n
    vec![0, 1, 2], // colptr
    vec![0, 1],    // rowval
    vec![6., 4.],  // nzval
);

let q = vec![-1., -4.];
```

!!! tip
    You are only required to specify the upper triangular part of the matrix `P` since it is assumed symmetric. Any entries in the matrix `P` that appear below the main diagonal will be ignored.

!!! tip
    To specify `P = I`, you can use
    ```rust
    let P = CscMatrix::identity(2);
    ```
    where in this case we have had to be specific about the floating point data type we want.   To use a zero matrix (e.g. if solving an LP), you can use
    ```rust
    let P = CscMatrix::spalloc(2,2,0);
    ```
    to construct a sparse matrix with no entries.


### Constraint data

```rust

let A = CscMatrix::new(
    5,                               // m
    2,                               // n
    vec![0, 3, 6],                   // colptr
    vec![0, 1, 3, 0, 2, 4],          // rowval
    vec![1., 1., -1., -2., 1., -1.], // nzval
);

let b = vec![0., 1., 1., 1., 1.];

let cones = [ZeroConeT(1), NonnegativeConeT(4)];

```

!!! tip
    There is no constraint on the ordering of the cones that appears
    in `cones` as long as it is compatible with the ordering of
    the constraints as they appear in `A` and `b`.   There is also no
    constraint on the number of instances of each type that appear.
    You could, for example, define the inequalities in the above example using:


    ```rust
    cones =
        [ZeroConeT(1),           #<--- for the equality constraint
         NonnegativeConeT(2),    #<--- first half of the inequality
         NonnegativeConeT(2)];   #<--- second half of the inequality
    ```


### Solver settings

Next construct a settings structure to pass to the solver.   This can be done using the `DefaultSettingsBuilder` method to specify custom settings.   For example, to run with equilibration enabled (although it is already enabled by default) and `max_iter = 50`, use:

```rust
let settings = DefaultSettingsBuilder::default()
    .equilibrate_enable(true)
    .max_iter(50)
    .build()
    .unwrap();
```

Alternatively, you can just specify the defaults directly using:
```rust
let settings = DefaultSettings::default();
```

### Running the solver

Finally populate the solver with problem data and solve:

```rust
let mut solver = DefaultSolver::new(&P, &q, &A, &b, &cones, settings);

solver.solve();
```

then retrieve the solution:

```rust
println!("Solution = {:?}", solver.solution.x);
```
