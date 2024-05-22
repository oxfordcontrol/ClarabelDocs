# Linear System Solvers

The primary numerical operation inside Clarabel.jl is the solution of a symmetric quasidefinite linear system at each iteration.  The solver currently supports three different solvers to perform factorization and forward/backward substitution on this system.

The linear solver can be configured in Settings using the `direct_solve_method` field, e.g.

```julia
settings = Solver.Settings(direct_solve_method = :qdldl)
```

The solvers currently supported are

Symbol | Package | Description
---  | :--- | :---
:qdldl | [QDLDL.jl](https://github.com/osqp/QDLDL.jl)   | Default solver
:mkl   | [Pardiso.jl](https://github.com/JuliaSparse/Pardiso.jl) | Intel MKL Pardiso
:panua | [Pardiso.jl](https://github.com/JuliaSparse/Pardiso.jl) | Panua Pardiso
:ma57 | [HSL.jl](https://github.com/JuliaSmoothOptimizers/HSL.jl) | HSL MA57
:cholmod | Julia native [ldlt](https://docs.julialang.org/en/v1/stdlib/LinearAlgebra/#LinearAlgebra.ldlt) solver | SuiteSparse.CHOLMOD

!!! note
    To use the Pardiso solvers you must install the respective libraries and the corresponding Julia wrapper. For more information about installing these, visit the [Pardiso.jl](https://github.com/JuliaSparse/Pardiso.jl) repository page.   You must also bring Pardiso into scope first (i.e. `using Pardiso`) before solving.
    The same is true for the HSL MA57 solver, which requires the HSL library and the Julia wrapper [HSL.jl].

QDLDL is a single threaded solver written in pure Julia, and is generally adequate for problems of small to medium size.  
