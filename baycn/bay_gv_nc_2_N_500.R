library (baycn,
         lib = '/mnt/lfs2/mart9986/Rpackages/')

load('/mnt/lfs2/mart9986/baycn/data_gv_nc_2_N_500.RData')

# adjacency matrix for m1_cp with 2 confounding variables
am_m1_cp_2 <- matrix(c(0, 1, 0, 0, 0,
                       0, 0, 1, 0, 0,
                       0, 0, 0, 0, 0,
                       0, 1, 1, 0, 0,
                       0, 1, 1, 0, 0),
                     byrow = TRUE,
                     nrow = 5)

# Adjacency matrix for m1_cc with 2 confounding variables
am_m1_cc_2 <- matrix(c(0, 1, 0, 0, 0,
                       0, 0, 1, 1, 1,
                       0, 0, 0, 1, 1,
                       0, 0, 0, 0, 0,
                       0, 0, 0, 0, 0),
                     byrow = TRUE,
                     nrow = 5)

# Adjacency matrix for m1_iv with 2 confounding variables
am_m1_iv_2 <- matrix(c(0, 1, 0, 0, 0,
                       0, 0, 1, 1, 1,
                       0, 0, 0, 0, 0,
                       0, 0, 1, 0, 0,
                       0, 0, 1, 0, 0),
                     byrow = TRUE,
                     nrow = 5)

# Initialize the vectors to full length

#################################################
# ss = 0.2
#################################################

bay_m1_cp_2_500_02 <- vector(mode = 'list',
                             length = M)

bay_m1_cc_2_500_02 <- vector(mode = 'list',
                             length = M)

bay_m1_iv_2_500_02 <- vector(mode = 'list',
                             length = M)

#################################################
# ss = 0.5
#################################################

bay_m1_cp_2_500_05 <- vector(mode = 'list',
                             length = M)

bay_m1_cc_2_500_05 <- vector(mode = 'list',
                             length = M)

bay_m1_iv_2_500_05 <- vector(mode = 'list',
                             length = M)

#################################################
# ss = 1
#################################################

bay_m1_cp_2_500_1 <- vector(mode = 'list',
                            length = M)

bay_m1_cc_2_500_1 <- vector(mode = 'list',
                            length = M)

bay_m1_iv_2_500_1 <- vector(mode = 'list',
                            length = M)

set.seed(37)

for (e in 1:M) {

  #################################################
  # ss = 0.2
  #################################################

  # Run baycn on m1_cp with 2 confounding variables
  bay_m1_cp_2_500_02[[e]] <- mhEdge(adjMatrix = am_m1_cp_2,
                                    burnIn = 0.2,
                                    data = data_m1_cp_2_500_02[[e]],
                                    iterations = 30000,
                                    nGV = 1,
                                    pmr = TRUE,
                                    prior = c(0.05,
                                              0.05,
                                              0.9),
                                    thinTo = 200)

  # Run baycn on m1_cc with 2 confounding variables
  bay_m1_cc_2_500_02[[e]] <- mhEdge(adjMatrix = am_m1_cc_2,
                                    burnIn = 0.2,
                                    data = data_m1_cc_2_500_02[[e]],
                                    iterations = 30000,
                                    nGV = 1,
                                    pmr = TRUE,
                                    prior = c(0.05,
                                              0.05,
                                              0.9),
                                    thinTo = 200)

  # Run baycn on m1_iv with 2 confounding variables
  bay_m1_iv_2_500_02[[e]] <- mhEdge(adjMatrix = am_m1_iv_2,
                                    burnIn = 0.2,
                                    data = data_m1_iv_2_500_02[[e]],
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
  bay_m1_cp_2_500_05[[e]] <- mhEdge(adjMatrix = am_m1_cp_2,
                                    burnIn = 0.2,
                                    data = data_m1_cp_2_500_05[[e]],
                                    iterations = 30000,
                                    nGV = 1,
                                    pmr = TRUE,
                                    prior = c(0.05,
                                              0.05,
                                              0.9),
                                    thinTo = 200)

  # Run baycn on m1_cc with 2 confounding variables
  bay_m1_cc_2_500_05[[e]] <- mhEdge(adjMatrix = am_m1_cc_2,
                                    burnIn = 0.2,
                                    data = data_m1_cc_2_500_05[[e]],
                                    iterations = 30000,
                                    nGV = 1,
                                    pmr = TRUE,
                                    prior = c(0.05,
                                              0.05,
                                              0.9),
                                    thinTo = 200)

  # Run baycn on m1_iv with 2 confounding variables
  bay_m1_iv_2_500_05[[e]] <- mhEdge(adjMatrix = am_m1_iv_2,
                                    burnIn = 0.2,
                                    data = data_m1_iv_2_500_05[[e]],
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
  bay_m1_cp_2_500_1[[e]] <- mhEdge(adjMatrix = am_m1_cp_2,
                                   burnIn = 0.2,
                                   data = data_m1_cp_2_500_1[[e]],
                                   iterations = 30000,
                                   nGV = 1,
                                   pmr = TRUE,
                                   prior = c(0.05,
                                             0.05,
                                             0.9),
                                   thinTo = 200)

  # Run baycn on m1_cc with 2 confounding variables
  bay_m1_cc_2_500_1[[e]] <- mhEdge(adjMatrix = am_m1_cc_2,
                                   burnIn = 0.2,
                                   data = data_m1_cc_2_500_1[[e]],
                                   iterations = 30000,
                                   nGV = 1,
                                   pmr = TRUE,
                                   prior = c(0.05,
                                             0.05,
                                             0.9),
                                   thinTo = 200)

  # Run baycn on m1_iv with 2 confounding variables
  bay_m1_iv_2_500_1[[e]] <- mhEdge(adjMatrix = am_m1_iv_2,
                                   burnIn = 0.2,
                                   data = data_m1_iv_2_500_1[[e]],
                                   iterations = 30000,
                                   nGV = 1,
                                   pmr = TRUE,
                                   prior = c(0.05,
                                             0.05,
                                             0.9),
                                   thinTo = 200)

  print(e)
  print(Sys.time())

  save.image('/mnt/lfs2/mart9986/baycn/bay_gv_nc_2_N_500.RData')

}
