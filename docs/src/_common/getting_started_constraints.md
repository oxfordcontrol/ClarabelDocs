The Clarabel interface expects constraints to be presented in the single vectorized form ``Ax + s = b, s \in \mathcal{K}``, where ``\mathcal{K} = \mathcal{K}_1 \times \dots \times \mathcal{K}_p`` and each ``\mathcal{K}_i`` is one of the solver's supported cone types.



Suppose that we have a problem with decision variable ``x \in \mathbb{R}^3`` and our constraints are:
* A single equality constraint ``x_1 + x_2 - x_3 = 1``.   
* A pair of inequalities such that ``x_2`` and ``x_3`` are each less than 2.
* A second order cone constraint on the 3-dimensional vector ``x``.   

For the three constraints above, we have

```math

\begin{align*}

A_{eq} &=
\left[
\begin{array}{lll}
1 & 1 & -1
\end{array}
\right],
\quad &
b_{eq} &=
\left[
\begin{array}{l}
1
\end{array}
\right],

\\[4ex]

A_{ineq} &=
\left[
\begin{array}{lll}
0 & 1 & 0 \\
0 & 0 & 1
\end{array}
\right],
\quad &
b_{ineq} &=
\left[
\begin{array}{l}
2\\2
\end{array}
\right],

\\[4ex]

A_{soc} &=
\left[
\begin{array}{rrr}
-1 & 0 & 0 \\
 0 & -1 & 0 \\
 0 & 0 & -1
\end{array}
\right],
\quad &
b_{soc} &=
\left[
\begin{array}{l}
0 \\0 \\0
\end{array}
\right]

\end{align*}

```
