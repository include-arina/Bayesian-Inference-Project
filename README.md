# Bayesian-Inference-Project
This project applies Bayesian inference and data augmentation to model seabird movement between two islands over two consecutive years. Using a simulated year-two population count for a sanctuary of 1,000 seabirds, it estimates the initial proportion nesting on the East island and a shared probability of migration in either direction.

The analysis derives island occupancy probabilities, conditional probabilities of remaining on the same island, and a binomial likelihood for the observed population count. Unobserved counts of birds remaining on each island are introduced as latent variables, enabling beta full conditional distributions for the unknown parameters under uniform and beta priors.

A Gibbs sampler implemented in R runs for 50,000 iterations, alternating between sampling the latent counts and updating the population proportion and migration probability. Trace plots, posterior histograms, and numerical summaries explore parameter uncertainty, while derived occupancy probabilities describe the proportion expected on the East island in year two.

## Project Report
[View full report](Bayesian_Inference-Project.pdf)

## License
This project is provided for viewing and evaluation purposes only.
Reuse, modification, or distribution is not permitted without explicit permission.
