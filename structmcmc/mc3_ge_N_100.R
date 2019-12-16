library (parental)
library (structmcmc)

load('data_ge_N_100.RData')

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

mc3_g2_100_02_fc <- vector(mode = 'list',
                           length = M)

mc3_g2_100_05_fc <- vector(mode = 'list',
                           length = M)

mc3_g2_100_1_fc <- vector(mode = 'list',
                          length = M)

mc3_g2_100_02 <- vector(mode = 'list',
                        length = M)

mc3_g2_100_05 <- vector(mode = 'list',
                        length = M)

mc3_g2_100_1 <- vector(mode = 'list',
                       length = M)

mc3_nc11_100_02 <- vector(mode = 'list',
                          length = M)

mc3_nc11_100_05 <- vector(mode = 'list',
                          length = M)

mc3_nc11_100_1 <- vector(mode = 'list',
                         length = M)

mc3_pc_100_02 <- vector(mode = 'list',
                        length = M)

mc3_pc_100_05 <- vector(mode = 'list',
                        length = M)

mc3_pc_100_1 <- vector(mode = 'list',
                       length = M)

# Initialize probability matrix lists to full length. --------------------------

mc3_g2_100_02_fc_pm <- vector(mode = 'list',
                              length = M)

mc3_g2_100_05_fc_pm <- vector(mode = 'list',
                              length = M)

mc3_g2_100_1_fc_pm <- vector(mode = 'list',
                             length = M)

mc3_g2_100_02_pm <- vector(mode = 'list',
                           length = M)

mc3_g2_100_05_pm <- vector(mode = 'list',
                           length = M)

mc3_g2_100_1_pm <- vector(mode = 'list',
                          length = M)

mc3_nc11_100_02_pm <- vector(mode = 'list',
                             length = M)

mc3_nc11_100_05_pm <- vector(mode = 'list',
                             length = M)

mc3_nc11_100_1_pm <- vector(mode = 'list',
                            length = M)

mc3_pc_100_02_pm <- vector(mode = 'list',
                           length = M)

mc3_pc_100_05_pm <- vector(mode = 'list',
                           length = M)

mc3_pc_100_1_pm <- vector(mode = 'list',
                          length = M)

# Initialize time lists to full length. ----------------------------------------

mc3_g2_100_02_fc_time <- vector(mode = 'list',
                                length = M)

mc3_g2_100_05_fc_time <- vector(mode = 'list',
                                length = M)

mc3_g2_100_1_fc_time <- vector(mode = 'list',
                               length = M)

mc3_g2_100_02_time <- vector(mode = 'list',
                             length = M)

mc3_g2_100_05_time <- vector(mode = 'list',
                             length = M)

mc3_g2_100_1_time <- vector(mode = 'list',
                            length = M)

mc3_nc11_100_02_time <- vector(mode = 'list',
                               length = M)

mc3_nc11_100_05_time <- vector(mode = 'list',
                               length = M)

mc3_nc11_100_1_time <- vector(mode = 'list',
                              length = M)

mc3_pc_100_02_time <- vector(mode = 'list',
                             length = M)

mc3_pc_100_05_time <- vector(mode = 'list',
                             length = M)

mc3_pc_100_1_time <- vector(mode = 'list',
                            length = M)

# Run MC3 on each data set. ----------------------------------------------------

set.seed(104)

# Loop through each combination of signal strength and sample size for all
# topologies.
for (e in 1:M) {
  
  # ss = 0.2 --------------------------------------
  
  starttime <- Sys.time()
  mc3_g2_100_02[[e]] <- posterior(data = data_g2_100_02[[e]],
                                  method = 'mc3',
                                  logScoreFUN = logScoreNormalFUN(),
                                  constraint = cm_g2,
                                  nSamples = 30000,
                                  nBurnin = 6000,
                                  verbose = FALSE)
  endtime <- Sys.time()
  mc3_g2_100_02_time[[e]] <- endtime - starttime
  mc3_g2_100_02_pm[[e]] <- ep(mc3_g2_100_02[[e]])
  
  starttime <- Sys.time()
  mc3_g2_100_02_fc[[e]] <- posterior(data = data_g2_100_02[[e]],
                                     method = 'mc3',
                                     logScoreFUN = logScoreNormalFUN(),
                                     nSamples = 30000,
                                     nBurnin = 6000,
                                     verbose = FALSE)
  endtime <- Sys.time()
  mc3_g2_100_02_fc_time[[e]] <- endtime - starttime
  mc3_g2_100_02_fc_pm[[e]] <- ep(mc3_g2_100_02_fc[[e]])
  
  starttime <- Sys.time()
  mc3_nc11_100_02[[e]] <- posterior(data = data_nc11_100_02[[e]],
                                    method = 'mc3',
                                    logScoreFUN = logScoreNormalFUN(),
                                    constraint = cm_nc11,
                                    nSamples = 50000,
                                    nBurnin = 10000,
                                    verbose = FALSE)
  endtime <- Sys.time()
  mc3_nc11_100_02_time[[e]] <- endtime - starttime
  mc3_nc11_100_02_pm[[e]] <- ep(mc3_nc11_100_02[[e]])
  
  starttime <- Sys.time()
  mc3_pc_100_02[[e]] <- posterior(data = data_pc_100_02[[e]],
                                  method = 'mc3',
                                  logScoreFUN = logScoreNormalFUN(),
                                  constraint = cm_pc,
                                  nSamples = 50000,
                                  nBurnin = 10000,
                                  verbose = FALSE)
  endtime <- Sys.time()
  mc3_pc_100_02_time[[e]] <- endtime - starttime
  mc3_pc_100_02_pm[[e]] <- ep(mc3_pc_100_02[[e]])
  
  # ss = 0.5 --------------------------------------
  
  starttime <- Sys.time()
  mc3_g2_100_05[[e]] <- posterior(data = data_g2_100_05[[e]],
                                  method = 'mc3',
                                  logScoreFUN = logScoreNormalFUN(),
                                  constraint = cm_g2,
                                  nSamples = 30000,
                                  nBurnin = 6000,
                                  verbose = FALSE)
  endtime <- Sys.time()
  mc3_g2_100_05_time[[e]] <- endtime - starttime
  mc3_g2_100_05_pm[[e]] <- ep(mc3_g2_100_05[[e]])
  
  starttime <- Sys.time()
  mc3_g2_100_05_fc[[e]] <- posterior(data = data_g2_100_05[[e]],
                                     method = 'mc3',
                                     logScoreFUN = logScoreNormalFUN(),
                                     nSamples = 30000,
                                     nBurnin = 6000,
                                     verbose = FALSE)
  
  endtime <- Sys.time()
  mc3_g2_100_05_fc_time[[e]] <- endtime - starttime
  mc3_g2_100_05_fc_pm[[e]] <- ep(mc3_g2_100_05_fc[[e]])
  
  starttime <- Sys.time()
  mc3_nc11_100_05[[e]] <- posterior(data = data_nc11_100_05[[e]],
                                    method = 'mc3',
                                    logScoreFUN = logScoreNormalFUN(),
                                    constraint = cm_nc11,
                                    nSamples = 50000,
                                    nBurnin = 10000,
                                    verbose = FALSE)
  endtime <- Sys.time()
  mc3_nc11_100_05_time[[e]] <- endtime - starttime
  mc3_nc11_100_05_pm[[e]] <- ep(mc3_nc11_100_05[[e]])
  
  starttime <- Sys.time()
  mc3_pc_100_05[[e]] <- posterior(data = data_pc_100_05[[e]],
                                  method = 'mc3',
                                  logScoreFUN = logScoreNormalFUN(),
                                  constraint = cm_pc,
                                  nSamples = 50000,
                                  nBurnin = 10000,
                                  verbose = FALSE)
  endtime <- Sys.time()
  mc3_pc_100_05_time[[e]] <- endtime - starttime
  mc3_pc_100_05_pm[[e]] <- ep(mc3_pc_100_05[[e]])
  
  # ss = 1 ----------------------------------------
  
  starttime <- Sys.time()
  mc3_g2_100_1[[e]] <- posterior(data = data_g2_100_1[[e]],
                                 method = 'mc3',
                                 logScoreFUN = logScoreNormalFUN(),
                                 constraint = cm_g2,
                                 nSamples = 30000,
                                 nBurnin = 6000,
                                 verbose = FALSE)
  endtime <- Sys.time()
  mc3_g2_100_1_time[[e]] <- endtime - starttime
  mc3_g2_100_1_pm[[e]] <- ep(mc3_g2_100_1[[e]])
  
  starttime <- Sys.time()
  mc3_g2_100_1_fc[[e]] <- posterior(data = data_g2_100_1[[e]],
                                    method = 'mc3',
                                    logScoreFUN = logScoreNormalFUN(),
                                    nSamples = 30000,
                                    nBurnin = 6000,
                                    verbose = FALSE)
  endtime <- Sys.time()
  mc3_g2_100_1_fc_time[[e]] <- endtime - starttime
  mc3_g2_100_1_fc_pm[[e]] <- ep(mc3_g2_100_1_fc[[e]])
  
  starttime <- Sys.time()
  mc3_nc11_100_1[[e]] <- posterior(data = data_nc11_100_1[[e]],
                                   method = 'mc3',
                                   logScoreFUN = logScoreNormalFUN(),
                                   constraint = cm_nc11,
                                   nSamples = 50000,
                                   nBurnin = 10000,
                                   verbose = FALSE)
  endtime <- Sys.time()
  mc3_nc11_100_1_time[[e]] <- endtime - starttime
  mc3_nc11_100_1_pm[[e]] <- ep(mc3_nc11_100_1[[e]])
  
  starttime <- Sys.time()
  mc3_pc_100_1[[e]] <- posterior(data = data_pc_100_1[[e]],
                                 method = 'mc3',
                                 logScoreFUN = logScoreNormalFUN(),
                                 constraint = cm_pc,
                                 nSamples = 50000,
                                 nBurnin = 10000,
                                 verbose = FALSE)
  endtime <- Sys.time()
  mc3_pc_100_1_time[[e]] <- endtime - starttime
  mc3_pc_100_1_pm[[e]] <- ep(mc3_pc_100_1[[e]])
  
  print(e)
  print(Sys.time())
  
  # Save the output, probability matrices, and time separately. ----------------
  
  save(M,
       mc3_g2_100_02_fc,
       mc3_g2_100_05_fc,
       mc3_g2_100_1_fc,
       mc3_g2_100_02,
       mc3_g2_100_05,
       mc3_g2_100_1,
       mc3_nc11_100_02,
       mc3_nc11_100_05,
       mc3_nc11_100_1,
       mc3_pc_100_02,
       mc3_pc_100_05,
       mc3_pc_100_1,
       file = 'mc3_ge_N_100.RData')
  
  save(M,
       mc3_g2_100_02_fc_pm,
       mc3_g2_100_05_fc_pm,
       mc3_g2_100_1_fc_pm,
       mc3_g2_100_02_pm,
       mc3_g2_100_05_pm,
       mc3_g2_100_1_pm,
       mc3_nc11_100_02_pm,
       mc3_nc11_100_05_pm,
       mc3_nc11_100_1_pm,
       mc3_pc_100_02_pm,
       mc3_pc_100_05_pm,
       mc3_pc_100_1_pm,
       file = 'mc3_ge_N_100_pm.RData')
  
  save(M,
       mc3_g2_100_02_fc_time,
       mc3_g2_100_05_fc_time,
       mc3_g2_100_1_fc_time,
       mc3_g2_100_02_time,
       mc3_g2_100_05_time,
       mc3_g2_100_1_time,
       mc3_nc11_100_02_time,
       mc3_nc11_100_05_time,
       mc3_nc11_100_1_time,
       mc3_pc_100_02_time,
       mc3_pc_100_05_time,
       mc3_pc_100_1_time,
       file = 'mc3_ge_N_100_time.RData')
  
}
