# QP Example

Suppose that we want to solve the following 2-dimensional quadratic programming problem:

```math
\begin{array}{ll} \text{minimize} &  3x_1^2 + 2x_2^2 - x_1 - 4x_2\\
\text{subject to} &  -1 \leq x \leq 1, ~ x_1 = 2x_2
\end{array}
```

We will show how to solve this problem through each of Clarabel's supported languages and interfaces.

In each case the first step is to put the problem data into the standard form expected by the solver.

### Objective function

The Clarabel solver's default configuration expects problem data in the form $\frac{1}{2}x^\top P x + q^\top x$.   
We therefore define the objective function data as

$$P = 2 \cdot \begin{bmatrix} 3 & 0 \\ 0 & 2\end{bmatrix}
\textrm{~~~and~~~}
q = \begin{bmatrix} -1 \\ -4\end{bmatrix}.$$


### Constraints

The solver's default configuration expects constraints in the form $Ax + s = b$, where $s \in \mathcal{K}$ for some
composite cone $\mathcal{K}$.   We have 1 equality constraint and 4 inequalities, so we require the first element of $s$
to be zero (i.e. the first constraint will correspond to the equality) and all other elements $s_i \ge 0$.   Our
cone constraint on $s$ is therefore

$$s \in \mathcal K = \{0\}^1 \times \mathbb{R}^4_{\ge 0}.$$

Define the constraint data as

$$A =
\footnotesize\begin{bmatrix*}[r] 1 & -2 \\ 1 & 0 \\ 0 & 1 \\ -1 & 0 \\ 0 & -1\end{bmatrix*}
\textrm{~~~and~~~}
 b=
\footnotesize\begin{bmatrix} 0 \\ 1 \\ 1 \\ 1 \\ 1 \end{bmatrix}.$$

Note that Clarabel expects inputs in Compressed Sparse Column (CSC) format for both $P$ and $A$.
