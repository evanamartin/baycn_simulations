library (BiDAG,
         lib = '/mnt/lfs2/mart9986/Rpackages')

load('/mnt/lfs2/mart9986/data/data_gv_N_500.RData')

# Adjacency matrices for the M1, M2, layer, mulit-parent, and star topologies.

am_mp <- matrix(c(0, 0, 0, 1,
                  0, 0, 0, 1,
                  0, 0, 0, 1,
                  0, 0, 0, 0),
                byrow = TRUE,
                nrow = 4)

am_layer <- matrix(c(0, 1, 1, 1, 0, 0, 0, 0,
                     0, 0, 0, 0, 1, 1, 0, 0,
                     0, 0, 0, 0, 0, 1, 1, 0,
                     0, 0, 0, 0, 0, 0, 0, 1,
                     0, 0, 0, 0, 0, 0, 0, 0,
                     0, 0, 0, 0, 0, 0, 0, 0,
                     0, 0, 0, 0, 0, 0, 0, 0,
                     0, 0, 0, 0, 0, 0, 0, 0),
                   byrow = TRUE,
                   nrow = 8)

am_star <- matrix(c(0, 1, 0, 0, 0, 0,
                    0, 0, 1, 1, 1, 1,
                    0, 0, 0, 0, 0, 0,
                    0, 0, 0, 0, 0, 0,
                    0, 0, 0, 0, 0, 0,
                    0, 0, 0, 0, 0, 0),
                  byrow = TRUE,
                  nrow = 6)

################################################################################
# Initialize the output lists to full length.
################################################################################

#################################################
# 0.2
#################################################

par_mp_500_02 <- vector(mode = 'list',
                        length = M)

par_layer_500_02 <- vector(mode = 'list',
                           length = M)

par_star_500_02 <- vector(mode = 'list',
                          length = M)

#################################################
# 0.5
#################################################

par_mp_500_05 <- vector(mode = 'list',
                        length = M)

par_layer_500_05 <- vector(mode = 'list',
                           length = M)

par_star_500_05 <- vector(mode = 'list',
                          length = M)

#################################################
# 1
#################################################

par_mp_500_1 <- vector(mode = 'list',
                       length = M)

par_layer_500_1 <- vector(mode = 'list',
                          length = M)

par_star_500_1 <- vector(mode = 'list',
                         length = M)

################################################################################
# Initialize the probability matrix lists to full length.
################################################################################

#################################################
# 0.2
#################################################

par_mp_500_02_pm <- vector(mode = 'list',
                           length = M)

par_layer_500_02_pm <- vector(mode = 'list',
                              length = M)

par_star_500_02_pm <- vector(mode = 'list',
                             length = M)

#################################################
# 0.5
#################################################

par_mp_500_05_pm <- vector(mode = 'list',
                           length = M)

par_layer_500_05_pm <- vector(mode = 'list',
                              length = M)

par_star_500_05_pm <- vector(mode = 'list',
                             length = M)

#################################################
# 1
#################################################

par_mp_500_1_pm <- vector(mode = 'list',
                          length = M)

par_layer_500_1_pm <- vector(mode = 'list',
                             length = M)

par_star_500_1_pm <- vector(mode = 'list',
                            length = M)

################################################################################
# Initialize the time lists to full length.
################################################################################

#################################################
# 0.2
#################################################

par_mp_500_02_time <- vector(mode = 'list',
                             length = M)

par_layer_500_02_time <- vector(mode = 'list',
                                length = M)

par_star_500_02_time <- vector(mode = 'list',
                               length = M)

#################################################
# 0.5
#################################################

par_mp_500_05_time <- vector(mode = 'list',
                             length = M)

par_layer_500_05_time <- vector(mode = 'list',
                                length = M)

par_star_500_05_time <- vector(mode = 'list',
                               length = M)

#################################################
# 1
#################################################

par_mp_500_1_time <- vector(mode = 'list',
                            length = M)

par_layer_500_1_time <- vector(mode = 'list',
                               length = M)

par_star_500_1_time <- vector(mode = 'list',
                              length = M)

set.seed(444)

for (e in 1:M) {

  #################################################
  # 0.2
  #################################################

  ####################
  # multi-parent
  ####################

  score_mp_500_02 <- scoreparameters(4,
                                     "bge",
                                     data_mp_500_02[[e]])

  starttime <- Sys.time()
  par_mp_500_02[[e]] <- partitionMCMC(iterations = 30000,
                                      n = 4,
                                      scoreparam = score_mp_500_02,
                                      verbose = FALSE)
  endtime <- Sys.time()
  par_mp_500_02_time[[e]] <- endtime - starttime
  par_mp_500_02_pm[[e]] <- edges.posterior(par_mp_500_02[[e]]$c$i,
                                           burnin = 0.2)

  ####################
  # layer
  ####################

  score_layer_500_02 <- scoreparameters(8,
                                        "bge",
                                        data_layer_500_02[[e]])

  starttime <- Sys.time()
  par_layer_500_02[[e]] <- partitionMCMC(iterations = 30000,
                                         n = 8,
                                         scoreparam = score_layer_500_02,
                                         verbose = FALSE)
  endtime <- Sys.time()
  par_layer_500_02_time[[e]] <- endtime - starttime
  par_layer_500_02_pm[[e]] <- edges.posterior(par_layer_500_02[[e]]$c$i,
                                              burnin = 0.2)

  ####################
  # star
  ####################

  score_star_500_02 <- scoreparameters(6,
                                       "bge",
                                       data_star_500_02[[e]])

  starttime <- Sys.time()
  par_star_500_02[[e]] <- partitionMCMC(iterations = 30000,
                                        n = 6,
                                        scoreparam = score_star_500_02,
                                        verbose = FALSE)
  endtime <- Sys.time()
  par_star_500_02_time[[e]] <- endtime - starttime
  par_star_500_02_pm[[e]] <- edges.posterior(par_star_500_02[[e]]$c$i,
                                             burnin = 0.2)

  #################################################
  # 0.5
  #################################################

  ####################
  # multi-parent
  ####################

  score_mp_500_05 <- scoreparameters(4,
                                     "bge",
                                     data_mp_500_05[[e]])

  starttime <- Sys.time()
  par_mp_500_05[[e]] <- partitionMCMC(iterations = 30000,
                                      n = 4,
                                      scoreparam = score_mp_500_05,
                                      verbose = FALSE)
  endtime <- Sys.time()
  par_mp_500_05_time[[e]] <- endtime - starttime
  par_mp_500_05_pm[[e]] <- edges.posterior(par_mp_500_05[[e]]$c$i,
                                           burnin = 0.2)

  ####################
  # layer
  ####################

  score_layer_500_05 <- scoreparameters(8,
                                        "bge",
                                        data_layer_500_05[[e]])

  starttime <- Sys.time()
  par_layer_500_05[[e]] <- partitionMCMC(iterations = 30000,
                                         n = 8,
                                         scoreparam = score_layer_500_05,
                                         verbose = FALSE)
  endtime <- Sys.time()
  par_layer_500_05_time[[e]] <- endtime - starttime
  par_layer_500_05_pm[[e]] <- edges.posterior(par_layer_500_05[[e]]$c$i,
                                              burnin = 0.2)

  ####################
  # star
  ####################

  score_star_500_05 <- scoreparameters(6,
                                       "bge",
                                       data_star_500_05[[e]])

  starttime <- Sys.time()
  par_star_500_05[[e]] <- partitionMCMC(iterations = 30000,
                                        n = 6,
                                        scoreparam = score_star_500_05,
                                        verbose = FALSE)
  endtime <- Sys.time()
  par_star_500_05_time[[e]] <- endtime - starttime
  par_star_500_05_pm[[e]] <- edges.posterior(par_star_500_05[[e]]$c$i,
                                             burnin = 0.2)

  #################################################
  # 1
  #################################################

  ####################
  # multi-parent
  ####################

  score_mp_500_1 <- scoreparameters(4,
                                    "bge",
                                    data_mp_500_1[[e]])

  starttime <- Sys.time()
  par_mp_500_1[[e]] <- partitionMCMC(iterations = 30000,
                                     n = 4,
                                     scoreparam = score_mp_500_1,
                                     verbose = FALSE)
  endtime <- Sys.time()
  par_mp_500_1_time[[e]] <- endtime - starttime
  par_mp_500_1_pm[[e]] <- edges.posterior(par_mp_500_1[[e]]$c$i,
                                          burnin = 0.2)

  ####################
  # layer
  ####################

  score_layer_500_1 <- scoreparameters(8,
                                       "bge",
                                       data_layer_500_1[[e]])

  starttime <- Sys.time()
  par_layer_500_1[[e]] <- partitionMCMC(iterations = 30000,
                                        n = 8,
                                        scoreparam = score_layer_500_1,
                                        verbose = FALSE)
  endtime <- Sys.time()
  par_layer_500_1_time[[e]] <- endtime - starttime
  par_layer_500_1_pm[[e]] <- edges.posterior(par_layer_500_1[[e]]$c$i,
                                             burnin = 0.2)

  ####################
  # star
  ####################

  score_star_500_1 <- scoreparameters(6,
                                      "bge",
                                      data_star_500_1[[e]])

  starttime <- Sys.time()
  par_star_500_1[[e]] <- partitionMCMC(iterations = 30000,
                                       n = 6,
                                       scoreparam = score_star_500_1,
                                       verbose = FALSE)
  endtime <- Sys.time()
  par_star_500_1_time[[e]] <- endtime - starttime
  par_star_500_1_pm[[e]] <- edges.posterior(par_star_500_1[[e]]$c$i,
                                            burnin = 0.2)

  print(e)
  print(Sys.time())

  save(M,
       par_mp_500_02,
       par_mp_500_05,
       par_mp_500_1,
       par_layer_500_02,
       par_layer_500_05,
       par_layer_500_1,
       par_star_500_02,
       par_star_500_05,
       par_star_500_1,
       file = '/mnt/lfs2/mart9986/bidag/par_gv_N_500.RData')


  save(M,
       par_mp_500_02_pm,
       par_mp_500_05_pm,
       par_mp_500_1_pm,
       par_layer_500_02_pm,
       par_layer_500_05_pm,
       par_layer_500_1_pm,
       par_star_500_02_pm,
       par_star_500_05_pm,
       par_star_500_1_pm,
       file = '/mnt/lfs2/mart9986/bidag/par_gv_N_500_pm.RData')


  save(M,
       par_mp_500_02_time,
       par_mp_500_05_time,
       par_mp_500_1_time,
       par_layer_500_02_time,
       par_layer_500_05_time,
       par_layer_500_1_time,
       par_star_500_02_time,
       par_star_500_05_time,
       par_star_500_1_time,
       file = '/mnt/lfs2/mart9986/bidag/par_gv_N_500_time.RData')

}
