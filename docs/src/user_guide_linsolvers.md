### [Linear System Solvers](@id linear-solvers)

Clarabel factors and solves an indefinite symmetric linear system at every interior point iteration.    The choice if linear subsolver is set by the `direct_solve_method` setting, which defaults to "auto", the behaviour of which depends on the solver build options, platform and language implementation.    It is also possible to specify the linear solver directly.   Supported linear solvers follow -- note that solvers supported in Rust are also supported by languages that use Rust underneath, e.g. Python, C/C++, R.

| `direct_solve_method` | language    | notes                                                                                                  |
| :---------------------- | :---------- | :----------------------------------------------------------------------------------------------------- |
| `auto`                | julia, rust | Lets Clarabel choose the LDL solver (default)                                                                                                       |
| `cholmod`             | julia       | Uses CHOLMOD as implemented by Julia's `ldlt` function.                                              |
| `qdldl`               | julia, rust | Uses the QDLDL indefinite linear solver.                                                               |
| `faer`                | rust        | Uses the LDL linear solver from the [faer-rs](https://crates.io/crates/faer) linear algebra library.  |
| `pardiso-mkl`         | rust        | Uses the [`MKL Pardiso`](https://www.intel.com/content/www/us/en/docs/onemkl/developer-reference-c/) linear solver.  Intel machines only.                                             |
| `pardiso-panua`       | rust        | Uses the [`Panua Pardiso`](https://panua.ch/pardiso/) linear solver.  Requires separate license.                                    |
| `ma57`                | julia       | Uses the [`MA57`](https://www.hsl.rl.ac.uk/catalogue/ma57.html) solver from the Harwell subroutine library.                                              |

QDLDL is a single threaded solver written in both pure Julia and pure Rust and is part of the standard Clarabel distribution. It is generally adequate for problems of small to medium size.

### Optional solvers in Julia

The MA57 and Pardiso libraries require separate installation of the [HSL.jl](https://github.com/JuliaSmoothOptimizers/HSL.jl) and [Pardiso.jl](https://github.com/JuliaSparse/Pardiso.jl) packages respectively.  Support for these solvers in Clarabel is implemented via Julia package extensions.  You just therefore import the relevant package first (e.g. "using HSL"), before solving.

### Optional solvers in Rust

#### Faer

The `faer-rs` solver is included in Clarabel as an optional build feature.  When building natively in Rust, use 
```
cargo build --features faer-sparse
``` 
to include support for `faer`.  Support for this solver is included by default as part of the python distribution.

#### Pardiso

The `pardiso-mkl` and `pardiso-panua` solvers are included as optional build features.  When building natively in Rust, use 
```
cargo build --features pardiso-mkl,pardiso-panua
```  
to include support.   Support for Pardiso is included by default as part of the python distribution.

The Pardiso solvers are loaded dynamically at run time and require appropriate environment variables to be set to make them visible to Clarabel.

###### Linking to Pardiso

 To enable dynamic linking to [`MKL Pardiso`](https://www.intel.com/content/www/us/en/docs/onemkl/developer-reference-c/),
 the MKL Pardiso libary (e.g. `libmkl_rt.so`) must be on the system library path
 (e.g. on `LD_LIBRARY_PATH` on Linux).    Alternatively, set the `MKLROOT` environment
 variable to the root of the MKL installation or `MKL_PARDISO_PATH` to the location
 of the library.    The Intel MKL library is available as part of the Intel oneAPI toolkit and is only available on x86_64 platforms.

 To enable dynamic linking to [`Panua Pardiso`](https://panua.ch/pardiso/),
 the Panua Pardiso library (e.g. `libpardiso.so`) must be on the system library path
 (e.g. on `LD_LIBRARY_PATH` on Linux).  Alternatively, set the `PARDISO_PATH` environment
 variable to the location of the library.

 Panua Pardiso is a commercial solver and requires a separate license.
