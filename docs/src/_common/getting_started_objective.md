To set the objective function of your optimisation problem simply define the square positive semidefinite matrix ``P \in \mathrm{R}^{n\times n} `` and the vector ``q \in \mathrm{R}^{n}``.

Suppose that we have a problem with decision variable ``x \in \mathbb{R}^3`` and our objective function is:

```math
\begin{equation*}
\min ~
\frac{1}{2}
\left[
\begin{array}{l}
x_1 \\ x_2 \\x_3
\end{array}
\right]
^T
\left[
\begin{array}{rrr}
3.0  & 1.0  & -1.0 \\
1.0   & 4.0 &  2.0 \\
 -1.0 &   2.0 &   5.0
\end{array}
\right]
\left[
\begin{array}{l}
x_1 \\ x_2 \\x_3
\end{array}
\right]
+
\left[
\begin{array}{r}
1 \\ 2 \\-3
\end{array}
\right]^T
\left[
\begin{array}{l}
x_1 \\ x_2 \\x_3
\end{array}
\right]
\end{equation*}
```
Clarabel expects the `P` matrix to be supplied in Compressed Sparse Column format.  `P` is assumed by the solver to be symmetric and only values in the upper triangular part of `P` are needed by the solver, i.e. you only need to provide

```math
\begin{equation*}
P =
\left[
\begin{array}{rrr}
3.0  & 1.0  & -1.0 \\
⋅   & 4.0 &  2.0 \\
⋅ &   ⋅ &   5.0
\end{array}
\right]
\end{equation*}
```
