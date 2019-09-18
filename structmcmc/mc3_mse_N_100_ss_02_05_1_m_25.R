library (kableExtra,
         lib = '/mnt/lfs2/mart9986/Rpackages/')
library (parental,
         lib = '/mnt/lfs2/mart9986/Rpackages/')
library (structmcmc,
         lib = '/mnt/lfs2/mart9986/Rpackages/')

load('/mnt/lfs2/mart9986/baycn/mc3_N_100_ss_02_05_1_m_25.RData')

# Create a variable for the two different MSE calculations for topology G2.
mse1_g2 <- 8
mse2_g2 <- 12

# The expected probabilities for topology G2.
ep_g2 <- matrix(c(0, 1/3, 1, 0,
                  2/3, 0, 0, 2/3,
                  0, 0, 0, 0,
                  0, 1/3, 1, 0),
                byrow = TRUE,
                nrow = 4)

# Create a variable for the two different MSE calculations for topology NC11.
mse1_nc11 <- 20
mse2_nc11 <- 110

# The expected probabilities for topology NC11.
ep_nc11 <- matrix(c(0, 0.2, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                    0.8, 0, 0.4, 0, 0, 0, 0, 0, 0, 0, 0,
                    0, 0.6, 0, 0.6, 0, 0, 0, 0, 0, 0, 0,
                    0, 0, 0.4, 0, 0.8, 0, 0, 0, 0, 0, 0,
                    0, 0, 0, 0.2, 0, 1, 0, 0, 0, 0, 0,
                    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                    0, 0, 0, 0, 0, 1, 0, 0.2, 0, 0, 0,
                    0, 0, 0, 0, 0, 0, 0.8, 0, 0.4, 0, 0,
                    0, 0, 0, 0, 0, 0, 0, 0.6, 0, 0.6, 0,
                    0, 0, 0, 0, 0, 0, 0, 0, 0.4, 0, 0.8,
                    0, 0, 0, 0, 0, 0, 0, 0, 0, 0.2, 0),
                  byrow = TRUE,
                  nrow = 11)

# Create a variable for the two different MSE calculations for topology PC.
mse1_pc <- 16
mse2_pc <- 56

# The expected probabilities for topology PC.
ep_pc <- matrix(c(0, 0.25, 0, 0, 0, 1, 0, 1,
                  0.75, 0, 0.75, 0, 0.75, 0, 0, 0,
                  0, 0.25, 0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0, 0, 0,
                  0, 0.25, 0, 0, 0, 1, 0, 1,
                  0, 0, 0, 0, 0, 0, 1, 0,
                  0, 0, 0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0, 0, 0),
                byrow = TRUE,
                nrow = 8)

denom_g2 <- mse1_g2
denom_nc11 <- mse1_nc11
denom_pc <- mse1_pc

################################################################################
# Calculate the MSE from the MC3 output.
################################################################################

# Initiate all of the vectors to length M
mc3_pm_g2_100_02_fc <- vector(mode = 'list',
                              length = M)

mc3_mse_g2_100_02_fc <- vector(mode = 'list',
                               length = M)

mc3_pm_g2_100_05_fc <- vector(mode = 'list',
                              length = M)

mc3_mse_g2_100_05_fc <- vector(mode = 'list',
                               length = M)

mc3_pm_g2_100_1_fc <- vector(mode = 'list',
                             length = M)

mc3_mse_g2_100_1_fc <- vector(mode = 'list',
                              length = M)

mc3_pm_g2_100_02 <- vector(mode = 'list',
                           length = M)

mc3_mse_g2_100_02 <- vector(mode = 'list',
                            length = M)

mc3_pm_g2_100_05 <- vector(mode = 'list',
                           length = M)

mc3_mse_g2_100_05 <- vector(mode = 'list',
                            length = M)

mc3_pm_g2_100_1 <- vector(mode = 'list',
                          length = M)

mc3_mse_g2_100_1 <- vector(mode = 'list',
                           length = M)

mc3_pm_nc11_100_02 <- vector(mode = 'list',
                             length = M)

mc3_mse_nc11_100_02 <- vector(mode = 'list',
                              length = M)

mc3_pm_nc11_100_05 <- vector(mode = 'list',
                             length = M)

mc3_mse_nc11_100_05 <- vector(mode = 'list',
                              length = M)

mc3_pm_nc11_100_1 <- vector(mode = 'list',
                            length = M)

mc3_mse_nc11_100_1 <- vector(mode = 'list',
                             length = M)

mc3_pm_pc_100_02 <- vector(mode = 'list',
                           length = M)

mc3_mse_pc_100_02 <- vector(mode = 'list',
                            length = M)

mc3_pm_pc_100_05 <- vector(mode = 'list',
                           length = M)

mc3_mse_pc_100_05 <- vector(mode = 'list',
                            length = M)

mc3_pm_pc_100_1 <- vector(mode = 'list',
                          length = M)

mc3_mse_pc_100_1 <- vector(mode = 'list',
                           length = M)

# Loop through each combination of signal strength and sample size for all
# topologies.
for (e in 1:M) {

  #################################################
  # G2 FULLY CONNECTED GRAPH
  # 100
  # 0.2, 0.5, 1
  #################################################

  # Calculate the posterior probability of each edge direction.
  mc3_pm_g2_100_02_fc[[e]] <- ep(mc3_g2_100_02_fc[[e]])
  # Calculate the MSE
  mc3_mse_g2_100_02_fc[[e]] <- (sum((ep_g2 - mc3_pm_g2_100_02_fc[[e]])^2) /
                                  mse2_g2)

  # Calculate the posterior probability of each edge direction.
  mc3_pm_g2_100_05_fc[[e]] <- ep(mc3_g2_100_05_fc[[e]])
  # Calculate the MSE
  mc3_mse_g2_100_05_fc[[e]] <- (sum((ep_g2 - mc3_pm_g2_100_05_fc[[e]])^2) /
                                  mse2_g2)

  # Calculate the posterior probability of each edge direction.
  mc3_pm_g2_100_1_fc[[e]] <- ep(mc3_g2_100_1_fc[[e]])
  # Calculate the MSE
  mc3_mse_g2_100_1_fc[[e]] <- (sum((ep_g2 - mc3_pm_g2_100_1_fc[[e]])^2) /
                                 mse2_g2)

  #################################################
  # G2
  # 100
  # 0.2, 0.5, 1
  #################################################

  # Calculate the posterior probability of each edge direction
  mc3_pm_g2_100_02[[e]] <- ep(mc3_g2_100_02[[e]])
  # Calculate the MSE
  mc3_mse_g2_100_02[[e]] <- sum((ep_g2 - mc3_pm_g2_100_02[[e]])^2) / denom_g2

  # Calculate the posterior probability of each edge direction
  mc3_pm_g2_100_05[[e]] <- ep(mc3_g2_100_05[[e]])
  # Calculate the MSE
  mc3_mse_g2_100_05[[e]] <- sum((ep_g2 - mc3_pm_g2_100_05[[e]])^2) / denom_g2

  # Calculate the posterior probability of each edge direction
  mc3_pm_g2_100_1[[e]] <- ep(mc3_g2_100_1[[e]])
  # Calculate the MSE
  mc3_mse_g2_100_1[[e]] <- sum((ep_g2 - mc3_pm_g2_100_1[[e]])^2) / denom_g2

  #################################################
  # NC11
  # 100
  # 0.2, 0.5, 1
  #################################################

  # Calculate the posterior probability of each edge direction
  mc3_pm_nc11_100_02[[e]] <- ep(mc3_nc11_100_02[[e]])
  # Calculate the MSE
  mc3_mse_nc11_100_02[[e]] <- (sum((ep_nc11 - mc3_pm_nc11_100_02[[e]])^2) /
                                 denom_nc11)

  # Calculate the posterior probability of each edge direction
  mc3_pm_nc11_100_05[[e]] <- ep(mc3_nc11_100_05[[e]])
  # Calculate the MSE
  mc3_mse_nc11_100_05[[e]] <- (sum((ep_nc11 - mc3_pm_nc11_100_05[[e]])^2) /
                                 denom_nc11)

  # Calculate the posterior probability of each edge direction
  mc3_pm_nc11_100_1[[e]] <- ep(mc3_nc11_100_1[[e]])
  # Calculate the MSE
  mc3_mse_nc11_100_1[[e]] <- (sum((ep_nc11 - mc3_pm_nc11_100_1[[e]])^2) /
                                denom_nc11)

  #################################################
  # PC
  # 100
  # 0.2, 0.5, 1
  #################################################

  # Calculate the posterior probability of each edge direction
  mc3_pm_pc_100_02[[e]] <- ep(mc3_pc_100_02[[e]])
  # Calculate the MSE
  mc3_mse_pc_100_02[[e]] <- sum((ep_pc - mc3_pm_pc_100_02[[e]])^2) / denom_pc

  # Calculate the posterior probability of each edge direction
  mc3_pm_pc_100_05[[e]] <- ep(mc3_pc_100_05[[e]])
  # Calculate the MSE
  mc3_mse_pc_100_05[[e]] <- sum((ep_pc - mc3_pm_pc_100_05[[e]])^2) / denom_pc

  # Calculate the posterior probability of each edge direction
  mc3_pm_pc_100_1[[e]] <- ep(mc3_pc_100_1[[e]])
  # Calculate the MSE
  mc3_mse_pc_100_1[[e]] <- sum((ep_pc - mc3_pm_pc_100_1[[e]])^2) / denom_pc

}

################################################################################
# Create a latex table with the mean and standard deviation of the MSE of the
# MC3 output for topology G2 with a fully connected graph.
################################################################################

mc3_mean_mse_g2_100_02 <- mean(unlist(mc3_mse_g2_100_02_fc))
mc3_mean_mse_g2_100_05 <- mean(unlist(mc3_mse_g2_100_05_fc))
mc3_mean_mse_g2_100_1 <- mean(unlist(mc3_mse_g2_100_1_fc))

mc3_sd_mse_g2_100_02 <- sd(unlist(mc3_mse_g2_100_02_fc))
mc3_sd_mse_g2_100_05 <- sd(unlist(mc3_mse_g2_100_05_fc))
mc3_sd_mse_g2_100_1 <- sd(unlist(mc3_mse_g2_100_1_fc))

mc3_100_02_05_1_fc <- matrix(c(mc3_mean_mse_g2_100_02, mc3_sd_mse_g2_100_02,
                               mc3_mean_mse_g2_100_05, mc3_sd_mse_g2_100_05,
                               mc3_mean_mse_g2_100_1, mc3_sd_mse_g2_100_1),
                             byrow = TRUE,
                             ncol = 2)

kable(format = 'latex',
      booktabs = TRUE,
      cbind(rep('', 3),
            rep('', 3),
            rep('', 3),
            round(mc3_100_02_05_1_fc, 4)))

################################################################################
# Create a latex table with the mean and standard deviation of the MSE of the
# MC3 output for topologies G2, NC11, and PC.
################################################################################

mc3_mean_mse_g2_100_02 <- mean(unlist(mc3_mse_g2_100_02))
mc3_mean_mse_g2_100_05 <- mean(unlist(mc3_mse_g2_100_05))
mc3_mean_mse_g2_100_1 <- mean(unlist(mc3_mse_g2_100_1))

mc3_sd_mse_g2_100_02 <- sd(unlist(mc3_mse_g2_100_02))
mc3_sd_mse_g2_100_05 <- sd(unlist(mc3_mse_g2_100_05))
mc3_sd_mse_g2_100_1 <- sd(unlist(mc3_mse_g2_100_1))

mc3_mean_mse_nc11_100_02 <- mean(unlist(mc3_mse_nc11_100_02))
mc3_mean_mse_nc11_100_05 <- mean(unlist(mc3_mse_nc11_100_05))
mc3_mean_mse_nc11_100_1 <- mean(unlist(mc3_mse_nc11_100_1))

mc3_sd_mse_nc11_100_02 <- sd(unlist(mc3_mse_nc11_100_02))
mc3_sd_mse_nc11_100_05 <- sd(unlist(mc3_mse_nc11_100_05))
mc3_sd_mse_nc11_100_1 <- sd(unlist(mc3_mse_nc11_100_1))

mc3_mean_mse_pc_100_02 <- mean(unlist(mc3_mse_pc_100_02))
mc3_mean_mse_pc_100_05 <- mean(unlist(mc3_mse_pc_100_05))
mc3_mean_mse_pc_100_1 <- mean(unlist(mc3_mse_pc_100_1))

mc3_sd_mse_pc_100_02 <- sd(unlist(mc3_mse_pc_100_02))
mc3_sd_mse_pc_100_05 <- sd(unlist(mc3_mse_pc_100_05))
mc3_sd_mse_pc_100_1 <- sd(unlist(mc3_mse_pc_100_1))

mc3_100_02_05_1 <- matrix(c(mc3_mean_mse_g2_100_02, mc3_sd_mse_g2_100_02,
                            mc3_mean_mse_pc_100_02, mc3_sd_mse_pc_100_02,
                            mc3_mean_mse_nc11_100_02, mc3_sd_mse_nc11_100_02,
                            mc3_mean_mse_g2_100_05, mc3_sd_mse_g2_100_05,
                            mc3_mean_mse_pc_100_05, mc3_sd_mse_pc_100_05,
                            mc3_mean_mse_nc11_100_05, mc3_sd_mse_nc11_100_05,
                            mc3_mean_mse_g2_100_1, mc3_sd_mse_g2_100_1,
                            mc3_mean_mse_pc_100_1, mc3_sd_mse_pc_100_1,
                            mc3_mean_mse_nc11_100_1, mc3_sd_mse_nc11_100_1),
                          byrow = TRUE,
                          ncol = 6)

kable(format = 'latex',
      booktabs = TRUE,
      cbind(rep('', 3),
            rep('', 3),
            rep('', 3),
            round(mc3_100_02_05_1, 4)))

save(denom_g2,
     denom_nc11,
     denom_pc,
     mc3_100_02_05_1_fc,
     mc3_100_02_05_1,
     file = '/mnt/lfs2/mart9986/mc3/mc3_mse1_N_100_ss_02_05_1_m_25.RData')
