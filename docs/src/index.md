__Clarabel__ is an interior point numerical solver for convex optimization problems using a novel homogeneous embedding.  The Clarabel package solves the following problem:

```math
\begin{array}{r}
\text{minimize} & \frac{1}{2}x^T P x + q^T x\\[2ex]
 \text{subject to} & Ax + s = b \\[1ex]
        & s \in \mathcal{K}
 \end{array}
```

with decision variables ``x \in \mathbb{R}^n``, ``s \in \mathbb{R}^m`` and data matrices ``P=P^\top \succeq 0``, ``q \in \mathbb{R}^n``, ``A \in \mathbb{R}^{m \times n}``, and ``b \in \mathbb{R}^m``. The convex set ``\mathcal{K}`` is a composition of convex cones.

Clarabel is available in either a native [Julia](https://julialang.org/) or a native [Rust](https://www.rust-lang.org/) implementation, with a Python interface also available for the Rust version.

## Features

* __Versatile__: Clarabel solves linear programs (LPs), quadratic programs (QPs), second-order cone programs (SOCPs) and semidefinite programs (SDPs). It also solves problems with exponential, power cone and generalized power cone constraints.
* __Quadratic objectives__: Unlike interior point solvers based on the standard homogeneous self-dual embedding (HSDE) model, Clarabel handles quadratic objective without requiring any epigraphical reformulation of its objective function.   It can therefore be significantly faster than other HSDE-based solvers for problems with quadratic objective functions.
* __Infeasibility detection__: Infeasible problems are detected using using a homogeneous embedding technique.
* __Arbitrary precision types__: You can solve problems with any floating point precision, e.g. Float32 or Julia's BigFloat type in Julia and f32 or f64 types in Rust.
* __Open Source__: Our code is available on GitHub and distributed under the Apache 2.0 License.   The Julia implementation is [here](https://github.com/oxfordcontrol/Clarabel.jl).   The Rust implementation and Python interface is [here](https://github.com/oxfordcontrol/Clarabel.rs).

## Credits

The following people are involved in the development of Clarabel:
* [Paul Goulart](http://users.ox.ac.uk/~engs1373/) (main development, maths and algorithms)
* Yuwen Chen (maths and algorithms)
All contributors are affiliated with the Control Group of the [Department of Engineering Science](http://www.eng.ox.ac.uk/) at the [University of Oxford](http://ox.ac.uk/).

If this project is useful for your work please consider
* [Citing](citing.md) the relevant papers
* Leaving a star on the GitHub repository [(Julia)](https://github.com/oxfordcontrol/Clarabel.jl/) : [(Rust)](https://github.com/oxfordcontrol/Clarabel.rs/).


## License
Clarabel.jl and Clarabel.rs are licensed under the Apache License 2.0 [(Julia)](https://github.com/oxfordcontrol/Clarabel.jl/blob/main/LICENSE.md) : [(Rust)](https://github.com/oxfordcontrol/Clarabel.rs/blob/main/LICENSE.md).
