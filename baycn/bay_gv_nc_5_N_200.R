library (baycn,
         lib = '/mnt/lfs2/mart9986/Rpackages/')

load('/mnt/lfs2/mart9986/data/data_gv_nc_5_N_200.RData')

# adjacency matrix for m1_cp with 5 common parent confounding variables
am_m1_cp_5 <- matrix(c(0, 1, 0, 0, 0, 0, 0, 0,
                       0, 0, 1, 0, 0, 0, 0, 0,
                       0, 0, 0, 0, 0, 0, 0, 0,
                       0, 1, 1, 0, 0, 0, 0, 0,
                       0, 1, 1, 0, 0, 0, 0, 0,
                       0, 1, 1, 0, 0, 0, 0, 0,
                       0, 1, 1, 0, 0, 0, 0, 0,
                       0, 1, 1, 0, 0, 0, 0, 0),
                     byrow = TRUE,
                     nrow = 8)

# Adjacency matrix for m1_cc with 5 common child confounding variables
am_m1_cc_5 <- matrix(c(0, 1, 0, 0, 0, 0, 0, 0,
                       0, 0, 1, 1, 1, 1, 1, 1,
                       0, 0, 0, 1, 1, 1, 1, 1,
                       0, 0, 0, 0, 0, 0, 0, 0,
                       0, 0, 0, 0, 0, 0, 0, 0,
                       0, 0, 0, 0, 0, 0, 0, 0,
                       0, 0, 0, 0, 0, 0, 0, 0,
                       0, 0, 0, 0, 0, 0, 0, 0),
                     byrow = TRUE,
                     nrow = 8)

# Adjacency matrix for m1_iv with 5 intermediate confounding variables
am_m1_iv_5 <- matrix(c(0, 1, 0, 0, 0, 0, 0, 0,
                       0, 0, 1, 1, 1, 1, 1, 1,
                       0, 0, 0, 0, 0, 0, 0, 0,
                       0, 0, 1, 0, 0, 0, 0, 0,
                       0, 0, 1, 0, 0, 0, 0, 0,
                       0, 0, 1, 0, 0, 0, 0, 0,
                       0, 0, 1, 0, 0, 0, 0, 0,
                       0, 0, 1, 0, 0, 0, 0, 0),
                     byrow = TRUE,
                     nrow = 8)

# Initialize the vectors to full length

#################################################
# ss = 0.2
#################################################

bay_m1_cp_5_200_02 <- vector(mode = 'list',
                             length = M)

bay_m1_cc_5_200_02 <- vector(mode = 'list',
                             length = M)

bay_m1_iv_5_200_02 <- vector(mode = 'list',
                             length = M)

#################################################
# ss = 0.5
#################################################

bay_m1_cp_5_200_05 <- vector(mode = 'list',
                             length = M)

bay_m1_cc_5_200_05 <- vector(mode = 'list',
                             length = M)

bay_m1_iv_5_200_05 <- vector(mode = 'list',
                             length = M)

#################################################
# ss = 1
#################################################

bay_m1_cp_5_200_1 <- vector(mode = 'list',
                            length = M)

bay_m1_cc_5_200_1 <- vector(mode = 'list',
                            length = M)

bay_m1_iv_5_200_1 <- vector(mode = 'list',
                            length = M)

set.seed(11)

for (e in 1:M) {

  #################################################
  # ss = 0.2
  #################################################

  # Run baycn on m1_cp with 2 confounding variables
  bay_m1_cp_5_200_02[[e]] <- mhEdge(adjMatrix = am_m1_cp_5,
                                    burnIn = 0.2,
                                    data = data_m1_cp_5_200_02[[e]],
                                    iterations = 30000,
                                    nGV = 1,
                                    pmr = TRUE,
                                    prior = c(0.05,
                                              0.05,
                                              0.9),
                                    thinTo = 200)

  # Run baycn on m1_cc with 2 confounding variables
  bay_m1_cc_5_200_02[[e]] <- mhEdge(adjMatrix = am_m1_cc_5,
                                    burnIn = 0.2,
                                    data = data_m1_cc_5_200_02[[e]],
                                    iterations = 30000,
                                    nGV = 1,
                                    pmr = TRUE,
                                    prior = c(0.05,
                                              0.05,
                                              0.9),
                                    thinTo = 200)

  # Run baycn on m1_iv with 2 confounding variables
  bay_m1_iv_5_200_02[[e]] <- mhEdge(adjMatrix = am_m1_iv_5,
                                    burnIn = 0.2,
                                    data = data_m1_iv_5_200_02[[e]],
                                    iterations = 30000,
                                    nGV = 1,
                                    pmr = TRUE,
                                    prior = c(0.05,
                                              0.05,
                                              0.9),
                                    thinTo = 200)

  #################################################
  # ss = 0.5
  #################################################

  # Run baycn on m1_cp with 2 confounding variables
  bay_m1_cp_5_200_05[[e]] <- mhEdge(adjMatrix = am_m1_cp_5,
                                    burnIn = 0.2,
                                    data = data_m1_cp_5_200_05[[e]],
                                    iterations = 30000,
                                    nGV = 1,
                                    pmr = TRUE,
                                    prior = c(0.05,
                                              0.05,
                                              0.9),
                                    thinTo = 200)

  # Run baycn on m1_cc with 2 confounding variables
  bay_m1_cc_5_200_05[[e]] <- mhEdge(adjMatrix = am_m1_cc_5,
                                    burnIn = 0.2,
                                    data = data_m1_cc_5_200_05[[e]],
                                    iterations = 30000,
                                    nGV = 1,
                                    pmr = TRUE,
                                    prior = c(0.05,
                                              0.05,
                                              0.9),
                                    thinTo = 200)

  # Run baycn on m1_iv with 2 confounding variables
  bay_m1_iv_5_200_05[[e]] <- mhEdge(adjMatrix = am_m1_iv_5,
                                    burnIn = 0.2,
                                    data = data_m1_iv_5_200_05[[e]],
                                    iterations = 30000,
                                    nGV = 1,
                                    pmr = TRUE,
                                    prior = c(0.05,
                                              0.05,
                                              0.9),
                                    thinTo = 200)

  #################################################
  # ss = 1
  #################################################

  # Run baycn on m1_cp with 2 confounding variables
  bay_m1_cp_5_200_1[[e]] <- mhEdge(adjMatrix = am_m1_cp_5,
                                   burnIn = 0.2,
                                   data = data_m1_cp_5_200_1[[e]],
                                   iterations = 30000,
                                   nGV = 1,
                                   pmr = TRUE,
                                   prior = c(0.05,
                                             0.05,
                                             0.9),
                                   thinTo = 200)

  # Run baycn on m1_cc with 2 confounding variables
  bay_m1_cc_5_200_1[[e]] <- mhEdge(adjMatrix = am_m1_cc_5,
                                   burnIn = 0.2,
                                   data = data_m1_cc_5_200_1[[e]],
                                   iterations = 30000,
                                   nGV = 1,
                                   pmr = TRUE,
                                   prior = c(0.05,
                                             0.05,
                                             0.9),
                                   thinTo = 200)

  # Run baycn on m1_iv with 2 confounding variables
  bay_m1_iv_5_200_1[[e]] <- mhEdge(adjMatrix = am_m1_iv_5,
                                   burnIn = 0.2,
                                   data = data_m1_iv_5_200_1[[e]],
                                   iterations = 30000,
                                   nGV = 1,
                                   pmr = TRUE,
                                   prior = c(0.05,
                                             0.05,
                                             0.9),
                                   thinTo = 200)

  print(e)
  print(Sys.time())

  save.image('/mnt/lfs2/mart9986/baycn/bay_gv_nc_5_N_200.RData')

}
