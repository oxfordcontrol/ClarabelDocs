### [Problem Data Updates](@id data-updates)

Clarabel allows for problem data to be updated and the solver re-run, provided that the overall problem shape (i.e. dimension and sparsity pattern) does not change.

Data updates can be applied to any matrix or vector term in the problem data, but not to the collection of cone constraints.   Data updating is also not permitted when the solver settings specify either `chordal_decomposition_enable = true` or `presolve_enable = true`.

Data updates can be applied by specifying either:

* A complete overwrite of the problem data component.
* A partial overwrite, specifying both values and indices into the original data.

For matrix updates, it is also possible to overwrite the data by specifying a new sparse matrix structure.    Note for updates of the quadratic term `P` in the objective, indexing is into the upper triangle of the data matrix, and updates must only specify the upper triangular part.

### Python example

````@eval
using Documenter
Documenter.md_include(
  source = "examples/py/example_qp_update.py",
  language = :python)
````
