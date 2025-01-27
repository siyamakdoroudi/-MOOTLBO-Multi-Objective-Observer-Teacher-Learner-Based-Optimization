# MOOTLBO: Multi-Objective Observer–Teacher–Learner-Based Optimization

This repository contains the implementation of the **MOOTLBO algorithm**, a novel multi-objective optimization technique based on the Observer–Teacher–Learner-Based Optimization (OTLBO). The algorithm is designed to solve complex multi-objective optimization problems efficiently by leveraging Pareto-dominance principles, an external archive, and advanced mutation and leader selection mechanisms.

## Overview
Multi-objective optimization involves solving problems with multiple conflicting objectives. MOOTLBO extends the OTLBO algorithm to handle such problems by introducing the following enhancements:

1. **Mutation Operator**: Prevents local stagnation and ensures better exploration of the solution space.
2. **External Archive**: Maintains non-dominated Pareto-optimal solutions for high-quality results.
3. **Leader Selection**: Uses a roulette wheel mechanism to select leaders from the archive, ensuring diversity and convergence.

This repository includes:
- Source code for the MOOTLBO algorithm.
- A copy of the corresponding research paper detailing the methodology and experimental results.
- Example test cases for running the algorithm on benchmark optimization problems.

## Features
- Handles multi-objective optimization problems efficiently.
- Compatible with unconstrained and constrained problems.
- Proven superior performance compared to existing algorithms such as MOPSO, MOGWO, and MOMPA.

## How to Use
### Prerequisites
- MATLAB (preferred for running the provided implementation).
- A basic understanding of optimization and metaheuristic algorithms.

### Steps to Run
1. Clone this repository:
   ```bash
   git clone https://github.com/YourUsername/MOOTLBO.git
   ```
2. Open MATLAB and navigate to the folder containing the cloned repository.
3. Run the main script (e.g., `MOOTLBO_Main.m`) to execute the algorithm.

## Files in This Repository
- `MOOTLBO_Main.m`: Main file for running the MOOTLBO algorithm.
- `MOOTLBO_Functions.m`: Contains all supporting functions for the algorithm.
- `Examples/`: A folder with sample benchmark problems and their configurations.
- `Paper/MOOTLBO_Research.pdf`: The research paper detailing the algorithm.

## Algorithm Highlights
- **Pareto Dominance**: Ensures optimal solutions in a single run without reducing the problem to a single objective.
- **Diversity Maintenance**: Uses a grid-based external archive to retain diversity among solutions.
- **Scalable**: Performs well on a wide range of benchmark and real-world problems.

## Citation
If you use this repository or find it helpful, please cite the original research paper:

```
Doroudi, S., Sharafati, A., Mohajeri, S. H. (2023). "MOOTLBO: a new multi-objective observer–teacher–learner-based optimization." Soft Computing. Springer.
```

## Acknowledgements
This work is based on the research conducted by Siyamak Doroudi, Ahmad Sharafati, and Seyed Hossein Mohajeri. The authors would like to thank their institutions for their support.

---

Feel free to contribute or report any issues! If you have any questions, please contact us at [YourEmail@example.com].

