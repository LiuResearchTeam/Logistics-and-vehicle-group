**2021.4.25**

An allocation Scheme $(l_{i,S})_{i \in S,S \subseteq N}$ is a PMAS if and only if 

$\sum_{i \in S}{l_{i,S} = c(S)}$ for all $S \subseteq N$

and  

$l_{i,S} \geq l_{i,T}$ for all $i \in S$ and $i \in T$ ,where $S \subseteq T \subseteq N$.

*2021.5.2*

A vector $\alpha \in **R**^{A}$ is in the $\gamma$ -approximate core (or $\gamma$ -core, for short) 

of the game $(A,c)$ if it satisfies the following two conditions:

+ **$\gamma$ -Budget balance:** $\gamma c(A) \leq \sum_{j \in A}{\alpha_{j}}\leq c(A)$.

+ **Core property:** for every $S \subseteq A$, $\sum_{j \in A}{\alpha_{j}}\leq c(A)$.
