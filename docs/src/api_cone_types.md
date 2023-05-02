# [Supported Cone Types](@id api-cone-types)


Clarabel natively supports optimization problems with conic constraints defined on the following cones:

Cone Type| Constructor | Definition 
-----      |   :----- | :-----
Zero cone | `ZeroConeT(n)`    | ``\{ 0 \}^{n}``
Nonnegative orthant | `NonnegativeConeT(n)` | ``\{ x \in \mathbb{R}^{n} : x_i \ge 0, \forall i=1,\dots,\mathrm{n} \}``
Second order cone | `SecondOrderConeT(n)` | ``\{ (t,x) \in \mathbb{R}^{n}  :  \|x\|_2   \leq t \}``
Exponential Cone | `ExponentialConeT()` | ``\{(x, y, z) : y > 0,~~ ye^{x/y} ≤ z \}``
Power cone | `PowerConeT(a)` |  ``\{(x, y, z) : x^a y^{(1-a)} \geq  \|z\|,~ (x,y) \geq 0 \}`` with ``a \in (0,1)``
Positive semidefinite cone (triangular part) | `PSDTriangleConeT(n)` | Upper triangular part of the positive semidefinite cone ``\mathbb{S}^{n}_+``. The elements ``x`` of this cone represent the columnwise stacking of the upper triangular part of a positive semidefinite matrix ``X \in \mathbb{S}^{n}_+``, so that ``x \in \mathbb{R}^d`` with ``d = {n(n+1)}/{2}.``