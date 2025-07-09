---
title: "gsDesign2"
description: "Next generation group sequential design with modern R implementation"
version: "1.1.5"
repository: "https://github.com/Merck/gsDesign2"
cran: "https://cran.r-project.org/package=gsDesign2"
weight: 2
---

## Overview

gsDesign2 is the next generation of group sequential design tools, built with modern R practices and enhanced capabilities. It provides a comprehensive framework for designing and analyzing group sequential trials with improved performance and flexibility.

## Installation

```r
# Install from CRAN
install.packages("gsDesign2")

# Install development version from GitHub
devtools::install_github("Merck/gsDesign2")
```

## Key Features

- **Modern R Implementation**: Built with tidyverse principles and modern R best practices
- **Enhanced Performance**: Optimized calculations for faster execution
- **Flexible Design Framework**: Support for various trial designs and endpoints
- **Integration Ready**: Seamless integration with other statistical packages
- **Comprehensive Testing**: Extensive unit testing and validation

## Basic Usage

### Creating a Design

```r
library(gsDesign2)

# Create a group sequential design
design <- gs_design_ahr(
  enroll_rate = define_enroll_rate(duration = 18, rate = 1),
  fail_rate = define_fail_rate(duration = c(4, 100), fail_rate = log(2) / 12, hr = c(1, 0.7)),
  alpha = 0.025,
  beta = 0.1,
  ratio = 1
)

# View the design
design
```

### Power Calculations

```r
# Calculate power for different scenarios
power_calc <- gs_power_ahr(
  enroll_rate = define_enroll_rate(duration = 18, rate = 1),
  fail_rate = define_fail_rate(duration = c(4, 100), fail_rate = log(2) / 12, hr = c(1, 0.7)),
  event = c(200, 300, 400),
  analysis_time = c(12, 24, 36)
)
```

## Advanced Features

### Non-Proportional Hazards

```r
# Design for non-proportional hazards
nph_design <- gs_design_nph(
  enroll_rate = define_enroll_rate(duration = 18, rate = 1),
  fail_rate = define_fail_rate(
    duration = c(4, 8, 100),
    fail_rate = log(2) / 12,
    hr = c(1, 0.8, 0.6)
  ),
  alpha = 0.025,
  beta = 0.1
)
```

### Multiple Endpoints

```r
# Design with multiple endpoints
multi_endpoint <- gs_design_combo(
  alpha = 0.025,
  beta = 0.1,
  endpoints = list(
    primary = list(type = "ahr", hr = 0.7),
    secondary = list(type = "binary", or = 0.8)
  )
)
```

## Best Practices

1. **Use Modern Syntax**: Leverage the new functional programming approach
2. **Validate Assumptions**: Check design assumptions with sensitivity analyses
3. **Document Thoroughly**: Maintain clear documentation of all design decisions
4. **Test Scenarios**: Use simulation capabilities for robust design validation

## Common Applications

- Oncology trials with non-proportional hazards
- Immunotherapy studies
- Adaptive trial designs
- Platform trials
- Multi-arm studies

## Integration with Other Packages

gsDesign2 works well with:
- `gt`: For beautiful table formatting
- `ggplot2`: For advanced visualizations
- `dplyr`: For data manipulation
- `tibble`: For modern data structures
