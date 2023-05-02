# Semidefinite Program (SDP) Example

In this example we show how to model semidefinite programming problems, i.e. problems defined with constraints on the symmetric positive semidefinite cone.

Given some symmetric matrix $X \in \mathbb{R}^{n\times n}$, Clarabel takes only the upper triangular vector of $n(n+1)/2$ entries when imposing semidefinite constraints.   For example, given a $3 \times 3$ symmetric matrix variable  
```math 
X = \begin{bmatrix}
x_1 & x_2 & x_4 \\ 
x_2 & x_3 & x_5 \\ 
x_4 & x_5 & x_6
\end{bmatrix}
```
we would take as our decision variable the 6 element vector 
```math
x = 
\begin{bmatrix}
x_1 & x_2 & x_3 & x_4 & x_5 & x_6
\end{bmatrix}.
```

We define an operation 
```math
\textrm{vec}(X) = 
\begin{bmatrix}
x_1 & \sqrt{2}x_2 & x_3 & \sqrt{2}x_4 & \sqrt{2}x_5 & x_6
\end{bmatrix}
```
on symmetric matrices such that inner products are preserved, i.e. $\textrm{tr}(AB) = 
\textrm{vec}(A)^T\textrm{vec}(B)$, and will use the relationship 
```math 
S \in \mathbb{R}^{n} \quad \Longleftrightarrow \quad \textrm{vec}(S) \in \mathcal{K}_{\text{tri}}^n
```
where $\mathcal{K}_{\text{tri}}^n$ is the positive semidefinite triangle cone.

### Problem statement

We will solve the following optimization problem:

```math
\begin{array}{ll} \text{minimize} &\textrm{trace}(X)\\[2ex]
\text{subject to} &  
\begin{gathered}
\langle A,X\rangle = 1 \\
X \succeq 0
\end{gathered}
\end{array}
``` 

where $X = X^T \in\mathbb{R}^{3\times 3}$ and the symmetric matrix $A$ is defined as 
```math 
A = \begin{bmatrix}
1 & 2 & 4 \\ 
2 & 3 & 5 \\ 
4 & 5 & 6
\end{bmatrix}
```

### Objective function

We can model the trace of the matrix $X$ by defining our objective function as 
```math
\frac{1}{2}x^TPx + q^Tx  
```
with $P = 0$ and 
$q = \begin{bmatrix}
1 & 0 & 1 & 0 & 0 & 1
\end{bmatrix}^T$,
where the elements of $q$ are chosen to select those elements of $x$ corresonding to the diagonal of the matrix $X$.  

### Constraints

The solver's default configuration expects constraints in the form $Ax + s = b$.   In this we can write our semidefiniteness constraint as 
```math
-\text{vec}(X) = s \in \mathcal{K}_{\text{tri}}^n
```   
where $\mathcal{K}_{\text{tri}}^n$ is the cone of vectors representing the triangular part of matrices in $\mathbb{S}_+^n$.


For the equality constraint can we must be careful to rewrite the inner product on $X$ in a form that is an equivalent linear function of $x$.  We therefore write 
```math 
\begin{aligned}
  \langle A,X\rangle &= \textrm{vec}(A)^T\textrm{vec}(X) \\
  &= \begin{bmatrix}
1 & (2\cdot 2) & 3 & (2\cdot 4) & (2\cdot 5) & 6
\end{bmatrix}
\begin{bmatrix}
x_1 \\ x_2 \\ x_3 \\ x_4 \\ x_5 \\ x_6
\end{bmatrix} = 1.
\end{aligned}
```
