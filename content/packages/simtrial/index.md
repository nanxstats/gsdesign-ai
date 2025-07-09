---
title: "simtrial"
description: "Clinical trial simulation for time-to-event endpoints"
version: "1.0.0"
repository: "https://github.com/Merck/simtrial"
cran: "https://cran.r-project.org/package=simtrial"
weight: 3
---

## Overview

simtrial provides comprehensive simulation capabilities for clinical trials with time-to-event endpoints. It enables researchers to validate trial designs, assess operating characteristics, and optimize study parameters through Monte Carlo simulation.

## Installation

```r
# Install from CRAN
install.packages("simtrial")

# Install development version from GitHub
devtools::install_github("Merck/simtrial")
```

## Key Features

- **Flexible Simulation Framework**: Simulate various trial designs and scenarios
- **Time-to-Event Focus**: Specialized for survival and time-to-event endpoints
- **Operating Characteristics**: Comprehensive evaluation of design performance
- **Scenario Analysis**: Test multiple assumptions and design variations
- **Integration**: Works seamlessly with gsDesign and gsDesign2

## Basic Usage

### Simple Simulation

```r
library(simtrial)

# Define trial parameters
enroll_rate <- define_enroll_rate(duration = 18, rate = 20)
fail_rate <- define_fail_rate(
  duration = c(4, 100),
  fail_rate = log(2) / 12,
  hr = c(1, 0.7),
  dropout_rate = 0.001
)

# Run simulation
sim_results <- sim_pw_surv(
  n_sim = 1000,
  study_duration = 36,
  enroll_rate = enroll_rate,
  fail_rate = fail_rate,
  block = c("Experimental", "Control")
)
```

### Group Sequential Simulation

```r
# Simulate group sequential trial
gs_sim <- sim_gs_n(
  n_sim = 1000,
  alpha = 0.025,
  beta = 0.1,
  enroll_rate = enroll_rate,
  fail_rate = fail_rate,
  timing = c(0.5, 0.75, 1),
  upper = list(bound = "OF"),
  lower = list(bound = "futility")
)
```

## Advanced Features

### Non-Proportional Hazards Simulation

```r
# Simulate with non-proportional hazards
nph_sim <- sim_pw_surv(
  n_sim = 1000,
  study_duration = 36,
  enroll_rate = define_enroll_rate(duration = 18, rate = 20),
  fail_rate = define_fail_rate(
    duration = c(4, 8, 100),
    fail_rate = log(2) / 12,
    hr = c(1, 0.8, 0.6),
    dropout_rate = 0.001
  )
)
```

### Adaptive Designs

```r
# Simulate adaptive trial with interim modifications
adaptive_sim <- sim_fixed_n(
  n_sim = 1000,
  alpha = 0.025,
  power = 0.9,
  enroll_rate = enroll_rate,
  fail_rate = fail_rate,
  study_duration = 36,
  interim_analysis = c(12, 24)
)
```

## Simulation Outputs

### Key Metrics

- **Power**: Probability of rejecting null hypothesis
- **Type I Error**: False positive rate under null hypothesis
- **Expected Study Duration**: Average trial completion time
- **Expected Sample Size**: Average number of subjects needed
- **Operating Characteristics**: Comprehensive performance metrics

### Result Analysis

```r
# Analyze simulation results
summary(sim_results)
plot(sim_results)

# Calculate operating characteristics
oc <- operating_characteristics(sim_results)
print(oc)
```

## Best Practices

1. **Sufficient Simulations**: Use adequate number of simulations (≥1000)
2. **Scenario Testing**: Test multiple scenarios and assumptions
3. **Sensitivity Analysis**: Assess robustness to assumption changes
4. **Computational Efficiency**: Use parallel processing for large simulations
5. **Result Validation**: Cross-check with analytical methods when possible

## Common Applications

- Power analysis for complex designs
- Operating characteristics evaluation
- Adaptive trial planning
- Non-proportional hazards assessment
- Regulatory submission support

## Integration with Other Packages

simtrial works well with:
- `gsDesign2`: For modern group sequential designs
- `gsDesign`: For traditional group sequential methods
- `survival`: For survival analysis
- `future`: For parallel processing
- `ggplot2`: For result visualization