# Clarabel Solver Settings


The Clarabel solver supports a variety of configuration options.   The Julia, Rust and Python
and interfaces all support the same set of options with identical field names.

!!! warning
    The solver defaults are configured to give good general performance for most problems, but 
    assume that the problem data is of 64 bit float type.   Although the Rust and Julia solvers 
    will accept 32 bit types instead (i.e. `Float32` in Julia or `f32` in Rust), the solver 
    is unlikely to perform well unless the tolerances are relaxed. 

---

The full set of options follows below.

## [Settings](@id api-settings)

```@docs
Clarabel.Settings
```


