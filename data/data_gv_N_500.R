set.seed(13)

# The number of data sets to simulate.
M <- 25

# Set the sample size to 500 and the reference allele frequency to 0.45
N <- 500
p <- 0.45


################################################################################
# M1, M2, layer, multi-parent, star
# sample size = 500
# signal strength = 0.2
################################################################################

ss <- 0.2

data_m1_500_02 <- vector(mode = 'list',
                         length = M)

data_m2_500_02 <- vector(mode = 'list',
                         length = M)

data_mp_500_02 <- vector(mode = 'list',
                         length = M)

data_layer_500_02 <- vector(mode = 'list',
                            length = M)

data_star_500_02 <- vector(mode = 'list',
                           length = M)

for (e in 1:M) {

  data_m1_500_02[[e]] <- m1gv(N = N,
                              p = p,
                              ss = ss)

  data_m2_500_02[[e]] <- m2gv(N = N,
                              p = p,
                              ss = ss)

  data_mp_500_02[[e]] <- mpgv(N = N,
                              p = p,
                              ss = ss)

  data_layer_500_02[[e]] <- layer(N = N,
                                  p = p,
                                  ss = ss)

  data_star_500_02[[e]] <- star(N = N,
                                p = p,
                                ss = ss)

}

################################################################################
# M1, M2, layer, multi-parent, star
# sample size = 500
# signal strength = 0.5
################################################################################

ss <- 0.5

data_m1_500_05 <- vector(mode = 'list',
                         length = M)

data_m2_500_05 <- vector(mode = 'list',
                         length = M)

data_mp_500_05 <- vector(mode = 'list',
                         length = M)

data_layer_500_05 <- vector(mode = 'list',
                            length = M)

data_star_500_05 <- vector(mode = 'list',
                           length = M)

for (e in 1:M) {

  data_m1_500_05[[e]] <- m1gv(N = N,
                              p = p,
                              ss = ss)

  data_m2_500_05[[e]] <- m2gv(N = N,
                              p = p,
                              ss = ss)

  data_mp_500_05[[e]] <- mpgv(N = N,
                              p = p,
                              ss = ss)

  data_layer_500_05[[e]] <- layer(N = N,
                                  p = p,
                                  ss = ss)

  data_star_500_05[[e]] <- star(N = N,
                                p = p,
                                ss = ss)

}

################################################################################
# M1, M2, layer, multi-parent, star
# sample size = 500
# signal strength = 1
################################################################################

ss <- 1

data_m1_500_1 <- vector(mode = 'list',
                        length = M)

data_m2_500_1 <- vector(mode = 'list',
                        length = M)

data_mp_500_1 <- vector(mode = 'list',
                        length = M)

data_layer_500_1 <- vector(mode = 'list',
                           length = M)

data_star_500_1 <- vector(mode = 'list',
                          length = M)

for (e in 1:M) {

  data_m1_500_1[[e]] <- m1gv(N = N,
                             p = p,
                             ss = ss)

  data_m2_500_1[[e]] <- m2gv(N = N,
                             p = p,
                             ss = ss)

  data_mp_500_1[[e]] <- mpgv(N = N,
                             p = p,
                             ss = ss)

  data_layer_500_1[[e]] <- layer(N = N,
                                 p = p,
                                 ss = ss)

  data_star_500_1[[e]] <- star(N = N,
                               p = p,
                               ss = ss)

}

# save.image("~/Sync/Evan/classesUofI/BCB600/baycn/simulations/
# data_gv_N_500.RData")
