library (kableExtra)
#library (parental)
#library (structmcmc)

#load('/mnt/lfs2/mart9986/baycn/gib_N_200_ss_02_05_1_m_25.RData')

# Create a variable for the two different MSE calculations for each topology.
mse1_g2 <- 8
mse2_g2 <- 12
mse1_nc11 <- 20
mse2_nc11 <- 110
mse1_pc <- 16
mse2_pc <- 56

# Use a common variable for the denominator of the MSE calculation
denom_g2 <- mse1_g2
denom_nc11 <- mse1_nc11
denom_pc <- mse1_pc

# The expected probabilities for topology G2.
ep_g2 <- matrix(c(0, 1/3, 1, 0,
                  2/3, 0, 0, 2/3,
                  0, 0, 0, 0,
                  0, 1/3, 1, 0),
                byrow = TRUE,
                nrow = 4)

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

################################################################################
# Calculate the MSE from the gibbs output.
################################################################################

# Initiate all of the vectors to length M
gib_mse_g2_200_02_fc <- vector(mode = 'list',
                               length = M)

gib_mse_g2_200_05_fc <- vector(mode = 'list',
                               length = M)

gib_mse_g2_200_1_fc <- vector(mode = 'list',
                              length = M)

gib_mse_g2_200_02 <- vector(mode = 'list',
                            length = M)

gib_mse_g2_200_05 <- vector(mode = 'list',
                            length = M)

gib_mse_g2_200_1 <- vector(mode = 'list',
                           length = M)

gib_mse_nc11_200_02 <- vector(mode = 'list',
                              length = M)

gib_mse_nc11_200_05 <- vector(mode = 'list',
                              length = M)

gib_mse_nc11_200_1 <- vector(mode = 'list',
                             length = M)

gib_mse_pc_200_02 <- vector(mode = 'list',
                            length = M)

gib_mse_pc_200_05 <- vector(mode = 'list',
                            length = M)

gib_mse_pc_200_1 <- vector(mode = 'list',
                           length = M)

# Loop through each combination of signal strength and sample size for all
# topologies.
for (e in 1:M) {

  #################################################
  # G2 FULLY CONNECTED GRAPH
  # 100
  # 0.2, 0.5, 1
  #################################################

  # Calculate the MSE
  gib_mse_g2_200_02_fc[[e]] <- (sum((ep_g2 - gib_pm_g2_200_02_fc[[e]])^2) /
                                  mse2_g2)

  # Calculate the MSE
  gib_mse_g2_200_05_fc[[e]] <- (sum((ep_g2 - gib_pm_g2_200_05_fc[[e]])^2) /
                                  mse2_g2)

  # Calculate the MSE
  gib_mse_g2_200_1_fc[[e]] <- (sum((ep_g2 - gib_pm_g2_200_1_fc[[e]])^2) /
                                 mse2_g2)

  #################################################
  # G2
  # 100
  # 0.2, 0.5, 1
  #################################################

  # Calculate the MSE
  gib_mse_g2_200_02[[e]] <- sum((ep_g2 - gib_pm_g2_200_02[[e]])^2) / denom_g2

  # Calculate the MSE
  gib_mse_g2_200_05[[e]] <- sum((ep_g2 - gib_pm_g2_200_05[[e]])^2) / denom_g2

  # Calculate the MSE
  gib_mse_g2_200_1[[e]] <- sum((ep_g2 - gib_pm_g2_200_1[[e]])^2) / denom_g2

  #################################################
  # NC11
  # 100
  # 0.2, 0.5, 1
  #################################################

  # Calculate the MSE
  gib_mse_nc11_200_02[[e]] <- (sum((ep_nc11 - gib_pm_nc11_200_02[[e]])^2) /
                                 denom_nc11)

  # Calculate the MSE
  gib_mse_nc11_200_05[[e]] <- (sum((ep_nc11 - gib_pm_nc11_200_05[[e]])^2) /
                                 denom_nc11)

  # Calculate the MSE
  gib_mse_nc11_200_1[[e]] <- (sum((ep_nc11 - gib_pm_nc11_200_1[[e]])^2) /
                                denom_nc11)

  #################################################
  # PC
  # 100
  # 0.2, 0.5, 1
  #################################################

  # Calculate the MSE
  gib_mse_pc_200_02[[e]] <- sum((ep_pc - gib_pm_pc_200_02[[e]])^2) / denom_pc

  # Calculate the MSE
  gib_mse_pc_200_05[[e]] <- sum((ep_pc - gib_pm_pc_200_05[[e]])^2) / denom_pc

  # Calculate the MSE
  gib_mse_pc_200_1[[e]] <- sum((ep_pc - gib_pm_pc_200_1[[e]])^2) / denom_pc

}

################################################################################
# Create a latex table with the mean and standard deviation of the MSE of the
# gibbs output for topology G2 with a fully connected graph.
################################################################################

gib_mean_mse_g2_200_02 <- mean(unlist(gib_mse_g2_200_02_fc))
gib_mean_mse_g2_200_05 <- mean(unlist(gib_mse_g2_200_05_fc))
gib_mean_mse_g2_200_1 <- mean(unlist(gib_mse_g2_200_1_fc))

gib_sd_mse_g2_200_02 <- sd(unlist(gib_mse_g2_200_02_fc))
gib_sd_mse_g2_200_05 <- sd(unlist(gib_mse_g2_200_05_fc))
gib_sd_mse_g2_200_1 <- sd(unlist(gib_mse_g2_200_1_fc))

gib_200_02_05_1_fc <- matrix(c(gib_mean_mse_g2_200_02, gib_sd_mse_g2_200_02,
                               gib_mean_mse_g2_200_05, gib_sd_mse_g2_200_05,
                               gib_mean_mse_g2_200_1, gib_sd_mse_g2_200_1),
                             byrow = TRUE,
                             ncol = 2)

kable(format = 'latex',
      booktabs = TRUE,
      cbind(rep('', 3),
            rep('', 3),
            rep('', 3),
            round(gib_200_02_05_1_fc, 4)))

################################################################################
# Create a latex table with the mean and standard deviation of the MSE of the
# gibbs output for topologies G2, NC11, and PC.
################################################################################

gib_mean_mse_g2_200_02 <- mean(unlist(gib_mse_g2_200_02))
gib_mean_mse_g2_200_05 <- mean(unlist(gib_mse_g2_200_05))
gib_mean_mse_g2_200_1 <- mean(unlist(gib_mse_g2_200_1))

gib_sd_mse_g2_200_02 <- sd(unlist(gib_mse_g2_200_02))
gib_sd_mse_g2_200_05 <- sd(unlist(gib_mse_g2_200_05))
gib_sd_mse_g2_200_1 <- sd(unlist(gib_mse_g2_200_1))

gib_mean_mse_nc11_200_02 <- mean(unlist(gib_mse_nc11_200_02))
gib_mean_mse_nc11_200_05 <- mean(unlist(gib_mse_nc11_200_05))
gib_mean_mse_nc11_200_1 <- mean(unlist(gib_mse_nc11_200_1))

gib_sd_mse_nc11_200_02 <- sd(unlist(gib_mse_nc11_200_02))
gib_sd_mse_nc11_200_05 <- sd(unlist(gib_mse_nc11_200_05))
gib_sd_mse_nc11_200_1 <- sd(unlist(gib_mse_nc11_200_1))

gib_mean_mse_pc_200_02 <- mean(unlist(gib_mse_pc_200_02))
gib_mean_mse_pc_200_05 <- mean(unlist(gib_mse_pc_200_05))
gib_mean_mse_pc_200_1 <- mean(unlist(gib_mse_pc_200_1))

gib_sd_mse_pc_200_02 <- sd(unlist(gib_mse_pc_200_02))
gib_sd_mse_pc_200_05 <- sd(unlist(gib_mse_pc_200_05))
gib_sd_mse_pc_200_1 <- sd(unlist(gib_mse_pc_200_1))

gib_200_02_05_1 <- matrix(c(gib_mean_mse_g2_200_02, gib_sd_mse_g2_200_02,
                            gib_mean_mse_pc_200_02, gib_sd_mse_pc_200_02,
                            gib_mean_mse_nc11_200_02, gib_sd_mse_nc11_200_02,
                            gib_mean_mse_g2_200_05, gib_sd_mse_g2_200_05,
                            gib_mean_mse_pc_200_05, gib_sd_mse_pc_200_05,
                            gib_mean_mse_nc11_200_05, gib_sd_mse_nc11_200_05,
                            gib_mean_mse_g2_200_1, gib_sd_mse_g2_200_1,
                            gib_mean_mse_pc_200_1, gib_sd_mse_pc_200_1,
                            gib_mean_mse_nc11_200_1, gib_sd_mse_nc11_200_1),
                          byrow = TRUE,
                          ncol = 6)

kable(format = 'latex',
      booktabs = TRUE,
      cbind(rep('', 3),
            rep('', 3),
            rep('', 3),
            round(gib_200_02_05_1, 4)))

save(denom_g2,
     denom_nc11,
     denom_pc,
     gib_200_02_05_1_fc,
     gib_200_02_05_1,
     file = '/mnt/lfs2/mart9986/mc3/gib_mse1_N_200_ss_02_05_1_m_25.RData')
