Clarabel solves optimisation problems in the format:
```math
\begin{array}{ll} \text{minimize} & \textstyle{\frac{1}{2}}x^\top Px + q^\top x\\ \text{subject to} & Ax + s = b \\ & s \in \mathcal{K}, \end{array}
```

with decision variables ``x \in \mathbb{R}^n``, ``s \in \mathbb{R}^m`` and data matrices ``P=P^\top \succeq 0``, ``q \in \mathbb{R}^n``, ``A \in \mathbb{R}^{m \times n}``, and ``b \in \mathbb{R}^m``.  The convex cone ``\mathcal{K}``
is a composition of smaller convex cones ``\mathcal{K} = \mathcal{K}_1 \times \mathcal{K}_2  \dots \mathcal{K}_p``.   Equality conditions can be modelled in this format using the solver's ZeroCone type.  

To initialize the solver with an optimisation problem we require three things:
* The objective function, i.e. the matrix `P` and the vector `q` in ``\frac{1}{2}x^\top P x + q^\top x``.
* The data matrix `A` and vector `b`, along with a description of the composite cone `\mathcal{K}` and the dimensions of its constituent pieces.
* A `settings` object that specifies how Clarabel solves the problem.
