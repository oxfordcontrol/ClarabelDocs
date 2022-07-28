#=
# Basic SOCP Example in Julia

We will show how to solve this problem both natively in Clarabel.jl
and also by solving with Clarabel.jl within JuMP.

## Clarabel.jl native interface

To solve the problem directly within Clarabel.jl, start by creating the solver and settings:
=#

using Clarabel, LinearAlgebra, SparseArrays

settings = Clarabel.Settings(verbose = true)
solver   = Clarabel.Solver()

#=
### Objective function data

Next define the data for the objective function and the constraints:
=#

P = sparse([0. 0.;0. 1.].*2)
q = [0., 0.]
nothing  #hide

#

A = sparse([0.  0.
           -2.  0.;
            0. -1.])
b = [ 1.
     -2.;
     -2.]

cones = [Clarabel.SecondOrderConeT(3)]

nothing  #hide


# Finally populate the solver with problem data and solve:

Clarabel.setup!(solver, P, q, A, b, cones, settings)
result = Clarabel.solve!(solver)

# then retrieve the solution:

result.x


# ## Using JuMP

# We can solve the same problem using
# Clarabel.jl as the backend solver within [JuMP](http://www.juliaopt.org/JuMP.jl/stable/).
# Here is the same problem again:

using Clarabel, JuMP

model = JuMP.Model(Clarabel.Optimizer)
set_optimizer_attribute(model, "verbose", true)

@variable(model, x[1:2])
@constraint(model, [1, 2x[1]-2, x[2] - 2] in SecondOrderCone())
@objective(model, Min, x[2]^2 )

optimize!(model)

# Here is the solution

JuMP.value.(x)

# and the solver termination status again

JuMP.termination_status(model)


# ## Using Convex.jl

# One more time using Clarabel.jl as the backend solver within [Convex.jl](https://jump.dev/Convex.jl/stable/):

using Clarabel, Convex

x = Variable(2)
problem = minimize(square(x[2]))
problem.constraints = [norm([2x[1];x[2]] - [2;2], 2) <= 1]
solve!(problem, Clarabel.Optimizer; silent_solver = false)

# Here is our solution

evaluate(x)

# and the solver termination status again

problem.status
