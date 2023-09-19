import clarabel
import numpy as np
from scipy import sparse

# solve the following power cone problem
# max  x1^0.6 y^0.4 + x2^0.1
# s.t. x1, y, x2 >= 0
#      x1 + 2y  + 3x2 == 3
# which is equivalent to
# max z1 + z2
# s.t. (x1, y, z1) in K_pow(0.6)
#      (x2, 1, z2) in K_pow(0.1)
#      x1 + 2y + 3x2 == 3

# x = (x1, y, z1, x2, y2, z2)

n = 6
P = sparse.csc_matrix((n, n))
q = np.array([0., 0., -1., 0., 0., -1.])

# (x1, y, z1) in K_pow(0.6)
# (x2, y2, z2) in K_pow(0.1)
A1 = -sparse.identity(n).tocsc()

b1 = np.zeros(n)
cones1 = [
    clarabel.GenPowerConeT([0.6, 0.4], 1),
    clarabel.GenPowerConeT([0.1, 0.9], 1),
]

# x1 + 2y + 3x2 == 3
# y2 == 1
A2 = sparse.csc_matrix(
    [[1., 2., 0., 3., 0., 0.],
     [0., 0., 0., 0., 1., 0.]])

b2 = np.array([3., 1.])
cones2 = [clarabel.ZeroConeT(2)]

A = sparse.vstack((A1, A2))
b = np.concatenate((b1, b2))
cones = cones1 + cones2

settings = clarabel.DefaultSettings()

solver = clarabel.DefaultSolver(P, q, A, b, cones, settings)

solver.solve()
