import cvxpy as cp

P = [[3., 1., -1.],
     [1., 4.,  2.],
     [-1., 2.,  5.]]

q = [1., 2., -3.]

# Create optimization variables
x = cp.Variable(3)

# Create two
constraints = [x[0] + x[1] - x[2] == 1,
               x[1] <= 2,
               x[2] <= 2,
               cp.SOC(x[0], x[1:])]

# Form objective.
obj = cp.Minimize(0.5*cp.quad_form(x, P) + q @ x)

# Form and solve problem.
prob = cp.Problem(obj, constraints)
prob.solve(solver='CLARABEL', verbose=True)
