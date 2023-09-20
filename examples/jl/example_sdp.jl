#=
# Semidefinite Programming (SDP) in Julia

We will show how to solve the Basic QP example problem both natively in Clarabel.jl
and also by solving with Clarabel.jl within either JuMP or Convex.jl.

## Clarabel.jl native interface

=#

using Clarabel, SparseArrays, LinearAlgebra

n    = 3
nvec = Int(n*(n+1)/2) 

P = spzeros(nvec,nvec)

q = [1.,0.,1.,0.,0.,1.]

A1 = -Diagonal([                         #<-- LHS of SDP constraint
     1., sqrt(2), 1., sqrt(2), sqrt(2), 1.
])               
A2 = [1. 2(2.) 3. 2(4.) 2(5.) 6.]        #<-- LHS of equality constraint
A  = sparse([A1;A2]);

b = [zeros(nvec);                       #<-- RHS of SDP constraint
     1.]                                #<-- RHS of equality constraint

cones =
    [Clarabel.PSDTriangleConeT(n),      #<--- for the SDP constraint
     Clarabel.ZeroConeT(1)]             #<--- for the equality constraints

settings = Clarabel.Settings()

solver   = Clarabel.Solver()

Clarabel.setup!(solver, P, q, A, b, cones, settings)

result = Clarabel.solve!(solver)

nothing #hide

# Recover the symmetric matrix X
X = zeros(n,n)
X[triu(ones(Bool,3,3))] .= result.x
X = Symmetric(X)

# ## Using JuMP

# We can solve the same problem a little more easily by using
# Clarabel.jl as the backend solver within [JuMP](http://www.juliaopt.org/JuMP.jl/stable/).
# Here is the same problem again. Note that we are *not* required to model our SDP constraint
# in triangular form if we are using JuMP.

using Clarabel, JuMP

n = 3
A = [1 2 4;
     2 3 5;
     4 5 6]

model = JuMP.Model(Clarabel.Optimizer)
set_optimizer_attribute(model, "verbose", true)
set_optimizer_attribute(model, "equilibrate_enable",false)

@variable(model, X[1:n,1:n],PSD)
@constraint(model, tr(A*X) == 1)
@objective(model, Min, tr(X))

optimize!(model)

# Here is the solution again

JuMP.value.(X)


