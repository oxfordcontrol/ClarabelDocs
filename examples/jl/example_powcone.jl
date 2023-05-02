using Clarabel, SparseArrays

P = spzeros(6,6)

q = [0., 0., -1., 0., 0., -1.]

A = sparse([
       -1.  0.  0.  0.  0.  0.;
        0. -1.  0.  0.  0.  0.;
        0.  0. -1.  0.  0.  0.;
        0.  0.  0. -1.  0.  0.;
        0.  0.  0.  0. -1.  0.;
        0.  0.  0.  0.  0. -1.;
        1.  2.  0.  3.  0.  0.;      
        0.  0.  0.  0.  1.  0.])

b = [0., 0., 0., 0., 0., 0., 3., 1.]

cones  = [Clarabel.PowerConeT(0.6), Clarabel.PowerConeT(0.1), Clarabel.ZeroConeT(2)]

solver = Clarabel.Solver()

settings = Clarabel.Settings()

Clarabel.setup!(solver, P, q, A, b, cones, settings)

result = Clarabel.solve!(solver)

nothing #hide

#
result #hide

#

result.x
