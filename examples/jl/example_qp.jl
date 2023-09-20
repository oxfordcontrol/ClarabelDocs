#=
# Quadratic Program (QP) Example in Julia

We will show how to solve the Basic QP example problem both natively in Clarabel.jl
and also by solving with Clarabel.jl within either JuMP or Convex.jl.

## Clarabel.jl native interface

=#

using Clarabel, SparseArrays

P = sparse([3. 0.;0. 2.].*2)

q = [-1., -4.]

A = sparse([1. -2.;    #<-- LHS of equality constraint
            1.  0.;    #<-- LHS of inequality constraint (upper bound)
            0.  1.;    #<-- LHS of inequality constraint (upper bound)
           -1.  0.;    #<-- LHS of inequality constraint (lower bound)
            0. -1.;    #<-- LHS of inequality constraint (lower bound)
            ])

b = [0.;        #<-- RHS of equality constraint
     ones(4)]   #<-- RHS of inequality constraints

cones =
    [Clarabel.ZeroConeT(1),           #<--- for the equality constraint
     Clarabel.NonnegativeConeT(4)]    #<--- for the inequality constraints

settings = Clarabel.Settings()

solver   = Clarabel.Solver()

Clarabel.setup!(solver, P, q, A, b, cones, settings)

result = Clarabel.solve!(solver)

nothing #hide

#
result #hide

#

result.x

# ## Using JuMP

# We can solve the same problem a little more easily by using
# Clarabel.jl as the backend solver within [JuMP](http://www.juliaopt.org/JuMP.jl/stable/).
# Here is the same problem again:

using Clarabel, JuMP

model = JuMP.Model(Clarabel.Optimizer)
set_optimizer_attribute(model, "verbose", true)

@variable(model, x[1:2])
@constraint(model, x[1] == 2x[2])
@constraint(model,  -1 .<= x .<= 1)
@objective(model, Min, 3x[1]^2 + 2x[2]^2 - x[1] - 4x[2])

optimize!(model)

# Here is the solution

JuMP.value.(x)

# and the solver termination status again

JuMP.termination_status(model)


# ## Using Convex.jl

# We can likewise solve the same problem a using
# Clarabel.jl as the backend solver within [Convex.jl](https://jump.dev/Convex.jl/stable/).   Here is the same problem one more time:

using Clarabel, Convex

x = Variable(2)
problem = minimize(3square(x[1]) + 2square(x[2]) - x[1] - 4x[2])
problem.constraints = [x[1] == 2x[2]]
problem.constraints += [x >= -1; x <= 1]
solve!(problem, Clarabel.Optimizer; silent_solver = false)

# Here is our solution

evaluate(x)

# and the solver termination status again

problem.status

#=
!!! warning
    Note that in the Clarabel.jl output that follows the call to solve! using Convex.jl, the problem posed
    to the solver has been converted to a second-order cone program with a linear objective.   You can see this
    because now `nnz(P) == 0` (there is no quadratic term in the objective) and the solver reports two second order
    cone constraints.

     Although the solution will be the same, the required number of iterations and solve time are slightly higher.
     When solving problems with quadratic objectives in Clarabel.jl, it is generally preferable to use either the
     native Clarabel.jl interface or JuMP, both of which handle quadratic terms in the objective directly.

=#
