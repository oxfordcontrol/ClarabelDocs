# Power Cone Example

In this example we show how to model optimization problems with 3-dimensional power cone constraints.   The power cone is defined as 
```math 
`\mathcal{K}_{pow}(\alpha) = \{(x, y, z) \mid x^\alpha y^{(1-\alpha)} 
\geq  |z|, (x,y) \geq 0 \} 
```
with $\alpha \in (0,1)$.

We will solve the following optimization problem:

```math
\begin{array}{ll} \text{maximize} & x_1^{0.6} y^{0.4} + x_2^{0.1}\\[2ex]
\text{subject to} &  
\begin{array}{rl}
(x_1, y, x_2) &\ge 0 \\
x_1 + 2y  + 3x_2 &= 3
\end{array}
\end{array}
``` 
which is equivalent to

```math
\begin{array}{ll} \text{maximize} & z_1 + z_2\\[2ex]
\text{subject to} &  
\begin{array}{rl}
(x1, y, z1) &\in~\mathcal{K}_{pow}(0.6) \\
(x2, 1, z2) &\in~\mathcal{K}_{pow}(0.1) \\ 
x_1 + 2y  + 3x_2 &=~3.
\end{array}
\end{array}
``` 


