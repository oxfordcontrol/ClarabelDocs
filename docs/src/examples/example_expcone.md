# Exponential Cone Example

In this example we show how to model optimization problems with exponential cone constraints.   The exponential cone is defined as 
```math 
\begin{aligned}
\mathcal{K}_{exp} =& \{(x, y, z) \mid y \geq 0,~ ye^{x/y} \le z\} ~\cup~ \\
& \{ (x,y,z) \mid   x \leq 0, y = 0, z \geq 0 \}
\end{aligned}
```

We will solve the following optimization problem:

```math
\begin{array}{ll} \text{maximize} &x\\[2ex]
\text{subject to} &  
\begin{array}{rl}
y e^{x / y} &\!\le~z \\ 
y \!&=~1\\ 
z \!&=~e^5.
\end{array}
\end{array}
``` 

### Objective function

The Clarabel solver's default configuration expects problems to be posed as minimization problems, so we define:

```math
P = 0
\textrm{~~~and~~~}
q = -
\begin{bmatrix} 1 & 0 & 0
\end{bmatrix}^T.
```


### Constraints

The solver's default configuration expects constraints in the form $Ax + s = b$, where $s$ is in a cone or composition of cones.   In this case we can write 
```math
\begin{bmatrix} 0 \\ 0 \\ 0
\end{bmatrix}
 - I
\begin{bmatrix} x \\ y \\ z 
\end{bmatrix} = s
\in \mathcal{K}_{exp},
```   
and then append the two additional equality constraints.

