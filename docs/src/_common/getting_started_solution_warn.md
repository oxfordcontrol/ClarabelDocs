!!! warning
    Be careful to retrieve solver solutions from the `solution` that is returned by the solver, or directly from a `solver` object from the `solver.solution` field.   Do *not* use the `solver.variables`, since these have both homogenization and equilibration scaling applied and therefore do *not* solve the optimization problem posed to the solver.
