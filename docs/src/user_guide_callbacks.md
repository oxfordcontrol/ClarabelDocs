### [Termination Callbacks](@id callbacks)

Clarabel provides optional termination callback support, allowing users to inject custom logic during the solver’s execution. By registering a callback function users can monitor progress, log intermediate results or implement early termination criteria. The callback is invoked at each iteration of the solver and receives access to the current solver residuals and timing information. User callbacks allow users to carry custom data objects between calls, e.g. to implement stopping criteria based on slow convergence or other custom logic.

User-defined callbacks are support in Rust, Python and C/C++ only.
