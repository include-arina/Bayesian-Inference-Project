#question 8
set.seed(4912)
N=1000 #total number of birds
xE=sample(400:800, 1); xE
trials <- 50000 #number of trials
#initializing arrays for the data
pE = numeric(trials)
sigma = numeric(trials)
yE = numeric(trials)
yW = numeric(trials)
theta_E = numeric(trials)
#generating a probability of a seabird to be on the island E at year 1 pE ~ U(0, 1)
pE[1] = runif(1, 0, 1)
#generating a probability of seabird to change an island from sigma ~ Beta(2, 10)
sigma[1]= rbeta(1, 2, 10)
for(iter in 1:(trials-1)){
  #calculating theta_E based on last pE and sigma
  theta_E[iter] = pE[iter]*(1 - sigma[iter]) +(1 - pE[iter])*sigma[iter]
  #calculate tau_E based on last pE and sigma
  tau_E = ((1-sigma[iter])*pE[iter])/theta_E[iter]
  #calculating tau_W based on last pE and sigma
  tau_W = ((1-sigma[iter])*(1-pE[iter]))/(1-theta_E[iter])
  #simulating the variables yE and yW based on last pE and sigma
  yE[iter] = rbinom(1, xE, tau_E)
  yW[iter] = rbinom(1, N-xE, tau_W)
  pE[iter+1] = rbeta(1, N - xE -yW[iter] + yE[iter] + 1, xE - yE[iter] + yW[iter] + 1)
  sigma[iter+1] = rbeta(1, N - yE[iter] - yW[iter] + 2, yE[iter] + yW[iter] + 10)
}
#plot for theta_E data
plot(seq(1, trials, 1), theta_E, type = "l", xlab = "trials")
#plot for pE data
plot(seq(1, trials, 1), pE, type = "l", xlab = "trials")
#plot for sigma data
plot(seq(1, trials, 1), sigma, type = "l", xlab = "trials")
#plot for yE data
plot(seq(1, trials, 1), yE, type = "l", xlab = "trials")
#plot for yW data
plot(seq(1, trials, 1), yW, type = "l", xlab = "trials")
#histogram for p_E data
hist(pE, xlab = "pE", main = "Histogram for values of pE")
#histogram for sigma data
hist(sigma, xlab = "sigma", main = "Histogram for values of sigma")
summary(pE)
summary(sigma)