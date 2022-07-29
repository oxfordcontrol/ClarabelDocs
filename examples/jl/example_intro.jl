# This code implements the example in the Clarabel
# "Getting Started" documentation

using Clarabel, SparseArrays

P = sparse([3. 1 -1; 0 4 2; 0 0 5])

q = [1,2,-3.]

# equality constraint
Aeq = [1. 1. -1.]
beq = [1.]

# inequality constraint
Aineq = [0. 1. 0.;
         0. 0. 1.]
bineq = [2.,2.]

# SOC constraint
Asoc = -I(3)*1.
bsoc = [0.,0.,0.]

# Clarabel.jl constraint data
A = sparse([Aeq; Aineq; Asoc])
b = [beq;bineq;bsoc]

cones = [Clarabel.ZeroConeT(1),
         Clarabel.NonnegativeConeT(2),
         Clarabel.SecondOrderConeT(3)]

settings = Clarabel.Settings(verbose = true, time_limit = 5)

solver   = Clarabel.Solver()

Clarabel.setup!(solver, P, q, A, b, cones, settings)

solution = Clarabel.solve!(solver)
