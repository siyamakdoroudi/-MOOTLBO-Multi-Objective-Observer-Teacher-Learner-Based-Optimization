# MOOTLBO: Multi-Objective Observer–Teacher–Learner-Based Optimization

This repository contains the MATLAB implementation of the **MOOTLBO algorithm**, a multi-objective optimization method designed to solve complex optimization problems efficiently. The repository includes the algorithm's source code, detailed descriptions of its components, and examples for running it on benchmark problems.

## Overview
The MOOTLBO algorithm builds upon the Observer-Teacher-Learner-Based Optimization (OTLBO) framework and introduces:
- **Pareto-Dominance Mechanism**: Ensures high-quality non-dominated solutions.
- **Grid-Based Diversity Maintenance**: Enhances exploration of the solution space.
- **Flexible Parameterization**: Allows easy adaptation to various problems.

The algorithm has been tested on CEC 2009 benchmark problems such as UF2 and UF4.

## Features
- Handles multi-objective optimization problems effectively.
- External archive for storing non-dominated solutions.
- Provides robust solutions for benchmark and real-world problems.

## How to Use
### Prerequisites
- MATLAB R2020b or later.

### Steps to Run
1. Clone this repository or download the files as a ZIP archive.
2. Extract the files into a folder.
3. Open MATLAB and navigate to the folder containing the files.
4. Run the main script `MOTLBO.m`.

### Example
Modify the `TestProblem` variable in `MOTLBO.m` to select a benchmark problem:
```matlab
TestProblem = 'UF2';  % Choose 'UF2' or 'UF4'
```
Run the script to execute the algorithm and visualize the Pareto front.

## Files in This Repository
The repository contains the following key files:

### Main Script
1. **MOTLBO.m**: The main script for running the MOOTLBO algorithm.

### Functions
2. **Parametersfinal.m**: Defines the algorithm's parameters for specific benchmark problems.
3. **CreateEmptyIndividual.m**: Initializes the structure for individuals in the population.
4. **DetermineDomination.m**: Identifies non-dominated solutions in the population.
5. **Dominates.m**: Checks if one solution dominates another.
6. **GetNonDominatedPop.m**: Extracts non-dominated solutions from the population.
7. **GetCosts.m**: Retrieves cost (objective) values from the population.
8. **xboundary.m**: Defines boundaries for decision variables in benchmark problems.
9. **CreateHypercubes.m**: Creates hypercubes for diversity maintenance.
10. **GetGridIndex.m**: Assigns solutions to grid cells based on their objectives.
11. **Mutate.m**: Performs mutation operations to generate new solutions.
12. **GetMean.m**: Computes the mean of the population's positions.
13. **SelectLeader.m**: Selects leaders from the external archive using a roulette wheel mechanism.
14. **Createnewsol.m**: Generates a new solution by applying the teaching phase.
15. **Clipping.m**: Ensures solutions stay within valid boundaries.
16. **CreateObserver.m**: Creates an observer solution for the algorithm's observer phase.
17. **CreateStep.m**: Generates the step size for the learner phase.
18. **RouletteWheelSelection.m**: Implements the roulette wheel selection mechanism.

### Benchmark Problem Implementation
19. **cec09.m**: Defines benchmark problems (e.g., UF2, UF4) from CEC 2009.

## Citation
If you use this repository, please cite the original paper:

```
Doroudi, S., Sharafati, A., Mohajeri, S. H. (2023). "MOOTLBO: a new multi-objective observer–teacher–learner-based optimization." Soft Computing, 27(20), pp. 15003–15032. DOI: 10.1007/s00500-023-08603-0.
```


## Contact
For questions or issues, please contact:
- Siyamak Doroudi: siyamak.doroudi@yahoo.com


