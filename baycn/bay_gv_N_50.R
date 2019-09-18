library (baycn,
         lib = '/mnt/lfs2/mart9986/Rpackages/')

load('/mnt/lfs2/mart9986/data/data_gv_N_50.RData')

# Adjacency matrices for the M1, M2, layer, mulit-parent, and star topologies.

am_m1 <- matrix(c(0, 1, 0,
                  0, 0, 1,
                  0, 0, 0),
                byrow = TRUE,
                nrow = 3)

am_m2 <- matrix(c(0, 1, 0,
                  0, 0, 0,
                  0, 1, 0),
                byrow = TRUE,
                nrow = 3)

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
# Initialize the lists to full length.
################################################################################

#################################################
# 0.2
#################################################

bay_m1_50_02 <- vector(mode = 'list',
                       length = M)

bay_m2_50_02 <- vector(mode = 'list',
                       length = M)

bay_mp_50_02 <- vector(mode = 'list',
                       length = M)

bay_layer_50_02 <- vector(mode = 'list',
                          length = M)

bay_star_50_02 <- vector(mode = 'list',
                         length = M)

#################################################
# 0.5
#################################################

bay_m1_50_05 <- vector(mode = 'list',
                       length = M)

bay_m2_50_05 <- vector(mode = 'list',
                       length = M)

bay_mp_50_05 <- vector(mode = 'list',
                       length = M)

bay_layer_50_05 <- vector(mode = 'list',
                          length = M)

bay_star_50_05 <- vector(mode = 'list',
                         length = M)

#################################################
# 1
#################################################

bay_m1_50_1 <- vector(mode = 'list',
                      length = M)

bay_m2_50_1 <- vector(mode = 'list',
                      length = M)

bay_mp_50_1 <- vector(mode = 'list',
                      length = M)

bay_layer_50_1 <- vector(mode = 'list',
                         length = M)

bay_star_50_1 <- vector(mode = 'list',
                        length = M)

################################################################################
# Run the MH algorithm on each data set.
################################################################################

set.seed(44)

for (e in 1:M) {

  #################################################
  # 0.2
  #################################################

  bay_m1_50_02[[e]] <- mhEdge(adjMatrix = am_m1,
                              burnIn = 0.2,
                              data = data_m1_50_02[[e]],
                              iterations = 30000,
                              nGV = 1,
                              pmr = TRUE,
                              prior = c(0.05,
                                        0.05,
                                        0.9),
                              thinTo = 200)

  bay_m2_50_02[[e]] <- mhEdge(adjMatrix = am_m2,
                              burnIn = 0.2,
                              data = data_m2_50_02[[e]],
                              iterations = 30000,
                              nGV = 1,
                              pmr = TRUE,
                              prior = c(0.05,
                                        0.05,
                                        0.9),
                              thinTo = 200)

  bay_mp_50_02[[e]] <- mhEdge(adjMatrix = am_mp,
                              burnIn = 0.2,
                              data = data_mp_50_02[[e]],
                              iterations = 30000,
                              nGV = 1,
                              pmr = TRUE,
                              prior = c(0.05,
                                        0.05,
                                        0.9),
                              thinTo = 200)

  bay_layer_50_02[[e]] <- mhEdge(adjMatrix = am_layer,
                                 burnIn = 0.2,
                                 data = data_layer_50_02[[e]],
                                 iterations = 30000,
                                 nGV = 1,
                                 pmr = TRUE,
                                 prior = c(0.05,
                                           0.05,
                                           0.9),
                                 thinTo = 200)

  bay_star_50_02[[e]] <- mhEdge(adjMatrix = am_star,
                                burnIn = 0.2,
                                data = data_star_50_02[[e]],
                                iterations = 30000,
                                nGV = 1,
                                pmr = TRUE,
                                prior = c(0.05,
                                          0.05,
                                          0.9),
                                thinTo = 200)

  #################################################
  # 0.5
  #################################################

  bay_m1_50_05[[e]] <- mhEdge(adjMatrix = am_m1,
                              burnIn = 0.2,
                              data = data_m1_50_05[[e]],
                              iterations = 30000,
                              nGV = 1,
                              pmr = TRUE,
                              prior = c(0.05,
                                        0.05,
                                        0.9),
                              thinTo = 200)

  bay_m2_50_05[[e]] <- mhEdge(adjMatrix = am_m2,
                              burnIn = 0.2,
                              data = data_m2_50_05[[e]],
                              iterations = 30000,
                              nGV = 1,
                              pmr = TRUE,
                              prior = c(0.05,
                                        0.05,
                                        0.9),
                              thinTo = 200)

  bay_mp_50_05[[e]] <- mhEdge(adjMatrix = am_mp,
                              burnIn = 0.2,
                              data = data_mp_50_05[[e]],
                              iterations = 30000,
                              nGV = 1,
                              pmr = TRUE,
                              prior = c(0.05,
                                        0.05,
                                        0.9),
                              thinTo = 200)

  bay_layer_50_05[[e]] <- mhEdge(adjMatrix = am_layer,
                                 burnIn = 0.2,
                                 data = data_layer_50_05[[e]],
                                 iterations = 30000,
                                 nGV = 1,
                                 pmr = TRUE,
                                 prior = c(0.05,
                                           0.05,
                                           0.9),
                                 thinTo = 200)

  #################################################
  # 1
  #################################################

  bay_m1_50_1[[e]] <- mhEdge(adjMatrix = am_m1,
                             burnIn = 0.2,
                             data = data_m1_50_1[[e]],
                             iterations = 30000,
                             nGV = 1,
                             pmr = TRUE,
                             prior = c(0.05,
                                       0.05,
                                       0.9),
                             thinTo = 200)

  bay_m2_50_1[[e]] <- mhEdge(adjMatrix = am_m2,
                             burnIn = 0.2,
                             data = data_m2_50_1[[e]],
                             iterations = 30000,
                             nGV = 1,
                             pmr = TRUE,
                             prior = c(0.05,
                                       0.05,
                                       0.9),
                             thinTo = 200)

  bay_mp_50_1[[e]] <- mhEdge(adjMatrix = am_mp,
                             burnIn = 0.2,
                             data = data_mp_50_1[[e]],
                             iterations = 30000,
                             nGV = 1,
                             pmr = TRUE,
                             prior = c(0.05,
                                       0.05,
                                       0.9),
                             thinTo = 200)

  bay_layer_50_1[[e]] <- mhEdge(adjMatrix = am_layer,
                                burnIn = 0.2,
                                data = data_layer_50_1[[e]],
                                iterations = 30000,
                                nGV = 1,
                                pmr = TRUE,
                                prior = c(0.05,
                                          0.05,
                                          0.9),
                                thinTo = 200)

  bay_star_50_1[[e]] <- mhEdge(adjMatrix = am_star,
                               burnIn = 0.2,
                               data = data_star_50_1[[e]],
                               iterations = 30000,
                               nGV = 1,
                               pmr = TRUE,
                               prior = c(0.05,
                                         0.05,
                                         0.9),
                               thinTo = 200)

  bay_star_50_05[[e]] <- mhEdge(adjMatrix = am_star,
                                burnIn = 0.2,
                                data = data_star_50_05[[e]],
                                iterations = 30000,
                                nGV = 1,
                                pmr = TRUE,
                                prior = c(0.05,
                                          0.05,
                                          0.9),
                                thinTo = 200)

  print(e)

  save.image('/mnt/lfs2/mart9986/baycn/bay_gv_N_50.RData')

}
