# Basic SOCP Example

Suppose that we want to solve the following 2-dimensional optimization problem:

```math
\begin{array}{ll} \text{minimize} & x_2^2\\[2ex]
\text{subject to} &  \left\|\begin{pmatrix} 2x_1 \\ x_2 \end{pmatrix}
- \begin{pmatrix} 2 \\ 2 \end{pmatrix}\right\|_2 \le 1
\end{array}
```

We will show how to solve this problem through each of Clarabel's supported languages and interfaces.


### Objective function

The Clarabel solver's default configuration expects problem data in the form $\frac{1}{2}x^\top P x + q^\top x$.   
We therefore define the objective function data as


$$P = 2 \cdot \begin{bmatrix} 0 & 0 \\ 0 & 1\end{bmatrix}
\textrm{~~~and~~~}
q = \begin{bmatrix} 0 \\ 0\end{bmatrix}.$$


### Constraints

The solver's default configuration expects constraints in the form $Ax + s = b$, where $s \in \mathcal{K}$ for some
composite cone $\mathcal{K}$.   We have a single constraint on the 2-norm of a vector, so we rewrite
```math
\left\|\begin{pmatrix} 2x_1 \\ x_2 \end{pmatrix} - \begin{pmatrix} 2 \\ 2 \end{pmatrix}\right\|_2 \le 1
\quad \Longleftrightarrow \quad
\begin{pmatrix} 1 \\ 2x_1 - 2\\ x_2 - 2 \end{pmatrix} \in \mathcal{K}_{SOC}
```
which puts our constraint in the form $b - Ax \in \mathcal{K}_{SOC}$.   
