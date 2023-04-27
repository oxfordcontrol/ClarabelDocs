import clarabel
import numpy as np
from scipy import sparse

# Define problem data
P = sparse.csc_matrix(
        [[ 3., 1., -1.],
         [ 1., 4.,  2.],
         [-1., 2.,  5.]])

P = sparse.triu(P).tocsc()

q = np.array([1.,2.,-3.])

# equality constraint
Aeq = sparse.csc_matrix([1.,1.,-1])
beq = np.array([1.])

# equality constraint
Aineq = sparse.csc_matrix(
        [[0., 1., 0.],
         [0., 0., 1.]])

bineq = np.array([2.,2.])

# SOC constraint
Asoc = -sparse.identity(3)
bsoc = np.array([0.,0.,0.])

# Clarabel constraint data
A = sparse.vstack([Aeq,Aineq,Asoc]).tocsc()
b = np.concatenate([beq,bineq,bsoc])

cones = [clarabel.ZeroConeT(1),
         clarabel.NonnegativeConeT(2),
         clarabel.SecondOrderConeT(3)]

settings = clarabel.DefaultSettings()
settings.verbose = True
settings.time_limit = 5.

solver = clarabel.DefaultSolver(P,q,A,b,cones,settings)

solver.solve()
