using Clarabel, SparseArrays

P = spzeros(3,3)

q = [-1.,0.,0.]

A = sparse([
     -1.  0.  0.;        
      0. -1.  0.;        
      0.  0. -1.;        
      0.  1.  0.;       
      0.  0.  1.]); 

b = [0.,0.,0.,1.,exp(5.)];

cones  = [Clarabel.ExponentialConeT(), Clarabel.ZeroConeT(2)]

solver = Clarabel.Solver()

settings = Clarabel.Settings()

Clarabel.setup!(solver, P, q, A, b, cones, settings)

result = Clarabel.solve!(solver)

nothing #hide

#
result #hide

#

result.x
