library (parental)
library (structmcmc)

load('data_ge_N_200.RData')

# Constrained matrices ---------------------------------------------------------

# Constrained matrix for topology G2.
cm_g2 <- matrix(c(0, 0, 0, -1,
                  0, 0, -1, 0,
                  0, -1, 0, 0,
                  -1, 0, 0, 0),
                byrow = TRUE,
                nrow = 4)

# Constrained matrix for topology NC11.
cm_nc11 <- matrix(c(0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1,
                    0, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1,
                    -1, 0, 0, 0, -1, -1, -1, -1, -1, -1, -1,
                    -1, -1, 0, 0, 0, -1, -1, -1, -1, -1, -1,
                    -1, -1, -1, 0, 0, 0, -1, -1, -1, -1, -1,
                    -1, -1, -1, -1, 0, 0, 0, -1, -1, -1, -1,
                    -1, -1, -1, -1, -1, 0, 0, 0, -1, -1, -1,
                    -1, -1, -1, -1, -1, -1, 0, 0, 0, -1, -1,
                    -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, -1,
                    -1, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0,
                    -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 0),
                  byrow = TRUE,
                  nrow = 11)

# Constrained matrix for topology PC.
cm_pc <- matrix(c(0, 0, -1, -1, -1, 0, -1, 0,
                  0, 0, 0, -1, 0, -1, -1, -1,
                  -1, 0, 0, -1, -1, -1, -1, -1,
                  -1, -1, -1, 0, -1, -1, -1, -1,
                  -1, 0, -1, -1, 0, 0, -1, 0,
                  0, -1, -1, -1, 0, 0, 0, -1,
                  -1, -1, -1, -1, -1, 0, 0, -1,
                  0, -1, -1, -1, 0, -1, -1, 0),
                byrow = TRUE,
                nrow = 8)

# Initialize output lists to full length. --------------------------------------

gib_g2_200_02_fc <- vector(mode = 'list',
                           length = M)

gib_g2_200_05_fc <- vector(mode = 'list',
                           length = M)

gib_g2_200_1_fc <- vector(mode = 'list',
                          length = M)

gib_g2_200_02 <- vector(mode = 'list',
                        length = M)

gib_g2_200_05 <- vector(mode = 'list',
                        length = M)

gib_g2_200_1 <- vector(mode = 'list',
                       length = M)

gib_nc11_200_02 <- vector(mode = 'list',
                          length = M)

gib_nc11_200_05 <- vector(mode = 'list',
                          length = M)

gib_nc11_200_1 <- vector(mode = 'list',
                         length = M)

gib_pc_200_02 <- vector(mode = 'list',
                        length = M)

gib_pc_200_05 <- vector(mode = 'list',
                        length = M)

gib_pc_200_1 <- vector(mode = 'list',
                       length = M)

# Initialize probability matrix lists to full length. --------------------------

gib_g2_200_02_fc_pm <- vector(mode = 'list',
                              length = M)

gib_g2_200_05_fc_pm <- vector(mode = 'list',
                              length = M)

gib_g2_200_1_fc_pm <- vector(mode = 'list',
                             length = M)

gib_g2_200_02_pm <- vector(mode = 'list',
                           length = M)

gib_g2_200_05_pm <- vector(mode = 'list',
                           length = M)

gib_g2_200_1_pm <- vector(mode = 'list',
                          length = M)

gib_nc11_200_02_pm <- vector(mode = 'list',
                             length = M)

gib_nc11_200_05_pm <- vector(mode = 'list',
                             length = M)

gib_nc11_200_1_pm <- vector(mode = 'list',
                            length = M)

gib_pc_200_02_pm <- vector(mode = 'list',
                           length = M)

gib_pc_200_05_pm <- vector(mode = 'list',
                           length = M)

gib_pc_200_1_pm <- vector(mode = 'list',
                          length = M)

# Initialize time lists to full length. ----------------------------------------

gib_g2_200_02_fc_time <- vector(mode = 'list',
                                length = M)

gib_g2_200_05_fc_time <- vector(mode = 'list',
                                length = M)

gib_g2_200_1_fc_time <- vector(mode = 'list',
                               length = M)

gib_g2_200_02_time <- vector(mode = 'list',
                             length = M)

gib_g2_200_05_time <- vector(mode = 'list',
                             length = M)

gib_g2_200_1_time <- vector(mode = 'list',
                            length = M)

gib_nc11_200_02_time <- vector(mode = 'list',
                               length = M)

gib_nc11_200_05_time <- vector(mode = 'list',
                               length = M)

gib_nc11_200_1_time <- vector(mode = 'list',
                              length = M)

gib_pc_200_02_time <- vector(mode = 'list',
                             length = M)

gib_pc_200_05_time <- vector(mode = 'list',
                             length = M)

gib_pc_200_1_time <- vector(mode = 'list',
                            length = M)

# Run the Gibbs sampler on each data set. --------------------------------------

set.seed(202)

# Loop through each combination of signal strength and sample size for all
# topologies.
for (e in 1:M) {
  
  # ss = 0.2 --------------------------------------
  
  starttime <- Sys.time()
  gib_g2_200_02[[e]] <- posterior(data = data_g2_200_02[[e]],
                                  method = 'gibbs',
                                  logScoreFUN = logScoreNormalFUN(),
                                  constraint = cm_g2,
                                  nSamples = 30000,
                                  nBurnin = 6000,
                                  verbose = FALSE)
  endtime <- Sys.time()
  gib_g2_200_02_time[[e]] <- endtime - starttime
  gib_g2_200_02_pm[[e]] <- ep(gib_g2_200_02[[e]])
  
  starttime <- Sys.time()
  gib_g2_200_02_fc[[e]] <- posterior(data = data_g2_200_02[[e]],
                                     method = 'gibbs',
                                     logScoreFUN = logScoreNormalFUN(),
                                     nSamples = 30000,
                                     nBurnin = 6000,
                                     verbose = FALSE)
  endtime <- Sys.time()
  gib_g2_200_02_fc_time[[e]] <- endtime - starttime
  gib_g2_200_02_fc_pm[[e]] <- ep(gib_g2_200_02_fc[[e]])
  
  starttime <- Sys.time()
  gib_nc11_200_02[[e]] <- posterior(data = data_nc11_200_02[[e]],
                                    method = 'gibbs',
                                    logScoreFUN = logScoreNormalFUN(),
                                    constraint = cm_nc11,
                                    nSamples = 50000,
                                    nBurnin = 10000,
                                    verbose = FALSE)
  endtime <- Sys.time()
  gib_nc11_200_02_time[[e]] <- endtime - starttime
  gib_nc11_200_02_pm[[e]] <- ep(gib_nc11_200_02[[e]])
  
  starttime <- Sys.time()
  gib_pc_200_02[[e]] <- posterior(data = data_pc_200_02[[e]],
                                  method = 'gibbs',
                                  logScoreFUN = logScoreNormalFUN(),
                                  constraint = cm_pc,
                                  nSamples = 50000,
                                  nBurnin = 10000,
                                  verbose = FALSE)
  endtime <- Sys.time()
  gib_pc_200_02_time[[e]] <- endtime - starttime
  gib_pc_200_02_pm[[e]] <- ep(gib_pc_200_02[[e]])
  
  # ss = 0.5 --------------------------------------
  
  starttime <- Sys.time()
  gib_g2_200_05[[e]] <- posterior(data = data_g2_200_05[[e]],
                                  method = 'gibbs',
                                  logScoreFUN = logScoreNormalFUN(),
                                  constraint = cm_g2,
                                  nSamples = 30000,
                                  nBurnin = 6000,
                                  verbose = FALSE)
  endtime <- Sys.time()
  gib_g2_200_05_time[[e]] <- endtime - starttime
  gib_g2_200_05_pm[[e]] <- ep(gib_g2_200_05[[e]])
  
  starttime <- Sys.time()
  gib_g2_200_05_fc[[e]] <- posterior(data = data_g2_200_05[[e]],
                                     method = 'gibbs',
                                     logScoreFUN = logScoreNormalFUN(),
                                     nSamples = 30000,
                                     nBurnin = 6000,
                                     verbose = FALSE)
  
  endtime <- Sys.time()
  gib_g2_200_05_fc_time[[e]] <- endtime - starttime
  gib_g2_200_05_fc_pm[[e]] <- ep(gib_g2_200_05_fc[[e]])
  
  starttime <- Sys.time()
  gib_nc11_200_05[[e]] <- posterior(data = data_nc11_200_05[[e]],
                                    method = 'gibbs',
                                    logScoreFUN = logScoreNormalFUN(),
                                    constraint = cm_nc11,
                                    nSamples = 50000,
                                    nBurnin = 10000,
                                    verbose = FALSE)
  endtime <- Sys.time()
  gib_nc11_200_05_time[[e]] <- endtime - starttime
  gib_nc11_200_05_pm[[e]] <- ep(gib_nc11_200_05[[e]])
  
  starttime <- Sys.time()
  gib_pc_200_05[[e]] <- posterior(data = data_pc_200_05[[e]],
                                  method = 'gibbs',
                                  logScoreFUN = logScoreNormalFUN(),
                                  constraint = cm_pc,
                                  nSamples = 50000,
                                  nBurnin = 10000,
                                  verbose = FALSE)
  endtime <- Sys.time()
  gib_pc_200_05_time[[e]] <- endtime - starttime
  gib_pc_200_05_pm[[e]] <- ep(gib_pc_200_05[[e]])
  
  # ss = 1 ----------------------------------------
  
  starttime <- Sys.time()
  gib_g2_200_1[[e]] <- posterior(data = data_g2_200_1[[e]],
                                 method = 'gibbs',
                                 logScoreFUN = logScoreNormalFUN(),
                                 constraint = cm_g2,
                                 nSamples = 30000,
                                 nBurnin = 6000,
                                 verbose = FALSE)
  endtime <- Sys.time()
  gib_g2_200_1_time[[e]] <- endtime - starttime
  gib_g2_200_1_pm[[e]] <- ep(gib_g2_200_1[[e]])
  
  starttime <- Sys.time()
  gib_g2_200_1_fc[[e]] <- posterior(data = data_g2_200_1[[e]],
                                    method = 'gibbs',
                                    logScoreFUN = logScoreNormalFUN(),
                                    nSamples = 30000,
                                    nBurnin = 6000,
                                    verbose = FALSE)
  endtime <- Sys.time()
  gib_g2_200_1_fc_time[[e]] <- endtime - starttime
  gib_g2_200_1_fc_pm[[e]] <- ep(gib_g2_200_1_fc[[e]])
  
  starttime <- Sys.time()
  gib_nc11_200_1[[e]] <- posterior(data = data_nc11_200_1[[e]],
                                   method = 'gibbs',
                                   logScoreFUN = logScoreNormalFUN(),
                                   constraint = cm_nc11,
                                   nSamples = 50000,
                                   nBurnin = 10000,
                                   verbose = FALSE)
  endtime <- Sys.time()
  gib_nc11_200_1_time[[e]] <- endtime - starttime
  gib_nc11_200_1_pm[[e]] <- ep(gib_nc11_200_1[[e]])
  
  starttime <- Sys.time()
  gib_pc_200_1[[e]] <- posterior(data = data_pc_200_1[[e]],
                                 method = 'gibbs',
                                 logScoreFUN = logScoreNormalFUN(),
                                 constraint = cm_pc,
                                 nSamples = 50000,
                                 nBurnin = 10000,
                                 verbose = FALSE)
  endtime <- Sys.time()
  gib_pc_200_1_time[[e]] <- endtime - starttime
  gib_pc_200_1_pm[[e]] <- ep(gib_pc_200_1[[e]])
  
  print(e)
  print(Sys.time())
  
  # Save the output, probability matrices, and time separately. ----------------
  
  save(M,
       gib_g2_200_02_fc,
       gib_g2_200_05_fc,
       gib_g2_200_1_fc,
       gib_g2_200_02,
       gib_g2_200_05,
       gib_g2_200_1,
       gib_nc11_200_02,
       gib_nc11_200_05,
       gib_nc11_200_1,
       gib_pc_200_02,
       gib_pc_200_05,
       gib_pc_200_1,
       file = 'gib_ge_N_200.RData')
  
  save(M,
       gib_g2_200_02_fc_pm,
       gib_g2_200_05_fc_pm,
       gib_g2_200_1_fc_pm,
       gib_g2_200_02_pm,
       gib_g2_200_05_pm,
       gib_g2_200_1_pm,
       gib_nc11_200_02_pm,
       gib_nc11_200_05_pm,
       gib_nc11_200_1_pm,
       gib_pc_200_02_pm,
       gib_pc_200_05_pm,
       gib_pc_200_1_pm,
       file = 'gib_ge_N_200_pm.RData')
  
  save(M,
       gib_g2_200_02_fc_time,
       gib_g2_200_05_fc_time,
       gib_g2_200_1_fc_time,
       gib_g2_200_02_time,
       gib_g2_200_05_time,
       gib_g2_200_1_time,
       gib_nc11_200_02_time,
       gib_nc11_200_05_time,
       gib_nc11_200_1_time,
       gib_pc_200_02_time,
       gib_pc_200_05_time,
       gib_pc_200_1_time,
       file = 'gib_ge_N_200_time.RData')
  
}
