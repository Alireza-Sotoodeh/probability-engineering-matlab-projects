# Probability Engineering - <img src="https://upload.wikimedia.org/wikipedia/commons/2/21/Matlab_Logo.png" width="30" height="30"> MATLAB Projects

This repository contains three MATLAB projects demonstrating fundamental concepts in probability theory and statistical analysis. The projects were completed as part of a Probability Engineering course under the supervision of PhD. A Zaimbashi at Shahid Bahonar University of Kerman.

**Author:** Alireza Sotoodeh (Student ID: 401412056)

## Table of Contents
- [Project Overview](#project-overview)
- [Project 1: Convergence Analysis of Sample Mean and Covariance](#project-1-convergence-analysis-of-sample-mean-and-covariance)
- [Project 2: Correlation Analysis of Random Variables](#project-2-correlation-analysis-of-random-variables)
- [Project 3: Gaussian Variable Transformation Analysis](#project-3-gaussian-variable-transformation-analysis)
- [Files Structure](#files-structure)
- [How to Run](#how-to-run)
- [Key Findings](#key-findings)
- [License](#license)

## Project Overview

This collection demonstrates three core concepts in probability theory:
1. **Convergence Behavior** of sample statistics as sample size increases.
2. **Correlation Analysis** between random variables under different conditions.
3. **Transformation of Random Variables** and their probability distributions.

## Project 1: Convergence Analysis of Sample Mean and Covariance

### Main Question
- **Q1:** How do sample mean and covariance converge to their expected values as the sample size $N$ increases? What is the relationship between sample size and estimation error?

### Objective
Demonstrates the convergence of sample mean and covariance to expected values as sample size $N$ increases, evaluating error convergence for specific $N$ values.

### Key Parameters
- **Dimension:** $n = 2$
- **Expected Mean:** $\mu = 10$ (originally $0.5$ in some versions)
- **Expected Covariance:** $\sigma^2 = 3$ (originally $5.0$ in some versions)
- **Sample Sizes Tested:** $N = [50000, 1000, 100, 10, 1]$

### Key Findings
- **Convergence Property:** Both sample mean and covariance values converge to their expected values as $N$ increases.
- **Error Reduction:** Estimation errors decrease with increasing sample size, following the Law of Large Numbers.
- **Visualization:** Log-log plots clearly show the convergence behavior.

### Outputs
- Mean and covariance convergence plots.
- Error convergence analysis (log-log scale).
- Numerical error tables for different sample sizes.

## Project 2: Correlation Analysis of Random Variables

### Main Questions
- **Q2a:** What is the correlation between independent random variables $Y$ and $Z$?
- **Q2b:** How does the linear transformation $Z = 2Y + 3$ affect the correlation coefficient?
- **Q2c:** How can we visualize correlation through scatter plots and interpret the relationship strength?
- **Q2d:** How can we generate correlated random variables with a specific correlation coefficient $r_{YZ} = \frac{2}{3}$?

### Analysis Parts

#### Part A: Independent Variables
- **Setup:** $Y \sim N(0,1)$, $Z \sim N(0,1)$ (independent)
- **Expected Result:** $r_{YZ} \approx 0$
- **Finding:** By increasing $N$, correlation approaches zero.

#### Part B: Linear Transformation
- **Setup:** $Z = 2Y + 3$
- **Expected Result:** $r_{YZ} = 1$ (perfect positive correlation)
- **Finding:** Correlation remains $1$ regardless of sample size $N$.

#### Part C: Visual Correlation Analysis
**Interpretation Guidelines:**
1. **Direction of Relationship:**
   - Positive slope → Positive relationship.
   - Negative slope → Negative relationship.
   - Flat trend → No linear relationship.
2. **Strength of Relationship:**
   - Tight clustering around a line → Strong correlation.
   - Scattered points → Weak correlation.
3. **Correlation Coefficient Values:**
   - $\rho = 1$: Perfect positive correlation.
   - $\rho = -1$: Perfect negative correlation.
   - $\rho = 0$: No linear correlation.

#### Part D: Controlled Correlation
- **Objective:** Generate variables with $r_{YZ} = \frac{2}{3}$
- **Method:** Cholesky decomposition of covariance matrix.
- **Covariance Matrix:** 
  $$\Sigma = \begin{bmatrix} \sigma_Y^2 & r\sigma_Y\sigma_Z \\ r\sigma_Y\sigma_Z & \sigma_Z^2 \end{bmatrix}$$

## Project 3: Gaussian Variable Transformation Analysis

### Main Question
- **Q3:** Given a Gaussian random variable $X \sim N(\mu, \sigma^2)$, what is the probability distribution of the transformed variable $Z = e^{-X}$? How can we verify this transformation theoretically and empirically?

### Objective
Analyzes the transformation $Z = e^{-X}$ where $X \sim N(\mu, \sigma^2)$ and compares the empirical distribution with the theoretical PDF.

### Key Parameters
- **Original Distribution:** $X \sim N(-1, 2^2)$
- **Transformation:** $Z = e^{-X}$
- **Sample Size:** $n = 2000$

### Theoretical Analysis
The PDF of $Z$ is given by:
$$f_Z(z) = \frac{1}{z} \cdot \frac{1}{\sqrt{2\pi}\sigma} \cdot \exp\left(-\frac{(\ln z - \mu)^2}{2\sigma^2}\right)$$

This represents a **log-normal distribution** with parameters $\mu$ and $\sigma$.

### Verification Method
- Generate samples from $X \sim N(\mu, \sigma^2)$.
- Apply transformation $Z = e^{-X}$.
- Compare histogram of $Z$ with theoretical PDF $f_Z(z)$.
- Visual verification shows excellent agreement.

## Files Structure
```
├── PJ1.m # Project 1: Convergence Analysis
├── PJ2.m # Project 2: Correlation Analysis
├── PJ3.m # Project 3: Transformation Analysis
├── Alireza Sotoodeh_PJ3.pdf # Complete project report
├── Results_Project_1/ # Output folder for Project 1
├── Result_Project_2/ # Output folder for Project 2
├── Result_Project_3/ # Output folder for Project 3
└── README.md # This file
```
## How to Run

### Prerequisites
- MATLAB R2016b or later (tested with R2023a).

### Execution
- Run each `.m` file individually in MATLAB.
- Results are automatically saved as PNG files in the respective result folders.
- All plots are displayed and saved automatically.

### Running Individual Projects
```matlab
% Project 1
run('PJ1.m')

% Project 2
run('PJ2.m')

% Project 3
run('PJ3.m')
```
## Key Findings
### Overall Insights

- Law of Large Numbers: Demonstrated through the convergence of sample statistics.
- Correlation Behavior:
  - Independent variables: ( r \to 0 ).
  - Linear transformation: ( r = 1 ) (deterministic).
  - Controlled correlation: Achievable through covariance matrix design.


Distribution Transformation: Exponential transformation of Gaussian variables yields a log-normal distribution.

### Practical Applications

- Quality Control: Understanding sample size requirements for accurate estimation.
- Financial Modeling: Correlation analysis for portfolio management.
-Signal Processing: Transformation analysis for system design.

### Mathematical Foundations
- The projects demonstrate key theoretical concepts:

  - Central Limit Theorem
  - Law of Large Numbers
  - Covariance and Correlation Theory
  - Random Variable Transformations
  - Log-normal Distribution Properties

---
-Course: Probability Engineering, Spring 1403
-Institution: Shahid Bahonar University of Kerman
-Supervisor: Dr. A. Zaimbashi
## License
MIT License
Copyright © 2025 Alireza Sotoodeh
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
