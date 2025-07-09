---
title: "gsDesign"
description: "Group sequential design for clinical trials"
version: "3.6.9"
repository: "https://github.com/keaven/gsDesign"
cran: "https://cran.r-project.org/package=gsDesign"
weight: 1
---

## Overview

The gsDesign package provides comprehensive tools for group sequential clinical trial design. It supports both superiority and non-inferiority designs with various spending function options.

## Installation

```r
# Install from CRAN
install.packages("gsDesign")

# Install development version from GitHub
devtools::install_github("keaven/gsDesign")
```

## Key Features

- **Flexible Spending Functions**: O'Brien-Fleming, Pocock, and custom spending functions
- **Sample Size Calculation**: Automated sample size and power calculations
- **Interim Analysis Planning**: Design trials with multiple interim analyses
- **Boundary Crossing Probabilities**: Calculate probabilities under various scenarios
- **Graphics**: Built-in plotting functions for visualizing designs

## Basic Usage

### Creating a Simple Design

```r
library(gsDesign)

# Create a group sequential design with 3 analyses
design <- gsDesign(
  k = 3,                    # Number of analyses
  test.type = 1,            # One-sided test
  alpha = 0.025,            # Type I error
  beta = 0.1,               # Type II error (90% power)
  sfu = "OF",               # O'Brien-Fleming spending
  sfupar = NULL
)

# View the design
design
```

### Sample Size Calculation

```r
# Calculate sample size for a two-arm trial
n <- nSurv(
  lambda1 = log(2) / 12,    # Hazard rate in control
  lambda2 = log(2) / 18,    # Hazard rate in treatment
  Ts = 24,                  # Study duration
  Tr = 12,                  # Recruitment duration
  eta = 0,                  # Dropout rate
  ratio = 1,                # Randomization ratio
  alpha = 0.025,
  beta = 0.1
)
```

## Advanced Features

### Custom Spending Functions

```r
# Define a custom spending function
myspend <- function(alpha, t, param) {
  alpha * t^param
}

# Use in design
design_custom <- gsDesign(
  k = 4,
  test.type = 2,
  alpha = 0.025,
  beta = 0.2,
  sfu = myspend,
  sfupar = 2
)
```

### Time-to-Event Endpoints

```r
# Design for survival endpoint
survival_design <- gsSurv(
  k = 3,
  test.type = 2,
  alpha = 0.025,
  beta = 0.1,
  lambdaC = log(2) / 12,
  hr = 0.7,
  eta = 0.05,
  T = 36,
  minfup = 12,
  ratio = 1
)
```

## Visualization

```r
# Plot the design boundaries
plot(design, main = "Group Sequential Design")

# Plot spending functions
plot(design, plottype = 2)

# Plot expected sample size
plot(design, plottype = "ASN")
```

## Best Practices

1. **Choose Appropriate Spending Functions**: O'Brien-Fleming for late-stopping designs, Pocock for early-stopping
2. **Consider Practical Constraints**: Account for recruitment rates and follow-up time
3. **Plan for Overruns**: Account for patients enrolled but not yet evaluated
4. **Document Assumptions**: Clearly state all design assumptions in protocols

## Common Applications

- Phase III clinical trials
- Interim efficacy analyses
- Safety monitoring
- Adaptive designs
- Non-inferiority trials

## Integration with Other Packages

gsDesign works well with:
- `survival`: For survival analysis
- `rpact`: For adaptive designs
- `ggplot2`: For custom visualizations
- `knitr`: For reproducible reports
