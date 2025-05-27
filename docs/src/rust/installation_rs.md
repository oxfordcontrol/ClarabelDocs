# Installation

### Using Cargo

Clarabel.rs is available through the Rust registry at [crates.io](https://crates.io/) and can be imported directly as a dependency in your project.   Just add

```rust
[dependencies]
clarabel = "0"  
```

in your project's `Cargo.toml` file to obtain the latest version.

### Direct from source

You can also download and build the repository directly from Github:

```
git clone https://github.com/oxfordcontrol/Clarabel.rs
cd Clarabel.rs
cargo build --release
```

To check that your installation worked, you can run

```
cargo run --example qp
```

### Optional build features

The solver comes with several optional build features that are not enabled by default.   Build features that are intended for users include :


| feature            | description                                                                                |
| :----------------- | :----------------------------------------------------------------------------------------- |
| `serde`          | enables read/write of problem instances to .json files (enabled by default)                |
| `faer-sparse`    | enables "faer" as an optional `direct_solve_method`                                      |
| `pardiso-mkl`    | enables "mkl" as an optional `direct_solve_method` (intel only)                         |
| `pardiso-panua`  | enabled "panua" as an optional `direct_solve_method)` (requires separate license)        |
| `pardiso`        | enables both the "mkl" and "panua" options                                                 |
| `sdp-accelerate` | enables solution of SDPs using Apple's "accelerate" BLAS/LAPACK implementation (OSX only) |
| `sdp-mkl`        | enables solution of SDPs using Intel's BLAS/LAPACK implementation (OSX only)             |
| `sdp-openblas`   | enables solution of SDPs using OpenBlas                                                    |
| `sdp-netlib`     | enables solution of SDPs using the Netlib reference BLAS/LAPACK (not recommended)          |
| `buildinfo`      | adds a `buildinfo` function to the package that reports on the build configuration       |
