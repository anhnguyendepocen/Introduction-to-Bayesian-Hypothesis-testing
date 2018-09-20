# Using JASP

## Installing JASP

## A quick tour of the interface

# Bayesian Hypothesis Testing in Practice

## Binomial Test

Use coin toss example. Compare JASP output to what we saw earlier when experimenting with the Shiny app.

Load coin_toss data.

These are 100 coin flips from a slightly biased coin (prob(Heads) = 0.55) generated with seed 20180921. The sample can be reproduced via the shiny app if desired.

### Selecting the test

Common > Frequencies > Bayesian Binomial Test

### Options

* Choose null hypothesis, either one or two sided.
* Add prior and posterior plots.
* Choose prior.
* Discuss sequential analysis.

## T tests

### Input options

* Can choose direction of comparison.
* Available priors.

### An obvious example

* Male vs Female traffic deaths.
* Compare Bayesian to Frequentist analysis.
* Very large effect, doesn't really matter what we do.

### A subtle example

* Traffic mortality 30 - 44 years vs 45 - 59 years old.
* Compare Bayesian to Frequentist analysis.
* Frequentist analysis would conclude that there is a significant differece.
* Somewhat less obvious with Bayesian analysis as results may change with choice of prior.

## ANOVA

* Use weight perception data
* Investigate effect of age and gender on height.
* Look at descriptives.
* Fit height ~ age*gender
* Look at Bayes factors for model comparisons.
* Add age and gender to null model. How much evidence is there for the interaction on top of that?

### Exercise: ANOVA

Repeat the analysis for weight.

## ANCOVA

* Height is likely to have a substantial influence on weight.
* May want to fit a regression model, but JASP doesn't support factors as predictors.
* Could dummy code them, lets do an ANCOVA for now.

### Exercise: ANCOVA

Fit a model for weight that includes age, gender and height.

