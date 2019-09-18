set.seed(8)

# The number of data sets to simulate.
M <- 25

# Set the sample size to 50 and the reference allele frequency to 0.45
N <- 50
p <- 0.45


################################################################################
# M1, M2, layer, multi-parent, star
# sample size = 50
# signal strength = 0.2
################################################################################

ss <- 0.2

data_m1_50_02 <- vector(mode = 'list',
                        length = M)

data_m2_50_02 <- vector(mode = 'list',
                        length = M)

data_mp_50_02 <- vector(mode = 'list',
                        length = M)

data_layer_50_02 <- vector(mode = 'list',
                           length = M)

data_star_50_02 <- vector(mode = 'list',
                          length = M)

for (e in 1:M) {

  data_m1_50_02[[e]] <- m1gv(N = N,
                             p = p,
                             ss = ss)

  data_m2_50_02[[e]] <- m2gv(N = N,
                             p = p,
                             ss = ss)

  data_mp_50_02[[e]] <- mpgv(N = N,
                             p = p,
                             ss = ss)

  data_layer_50_02[[e]] <- layer(N = N,
                                 p = p,
                                 ss = ss)

  data_star_50_02[[e]] <- star(N = N,
                               p = p,
                               ss = ss)

}

################################################################################
# M1, M2, layer, multi-parent, star
# sample size = 50
# signal strength = 0.5
################################################################################

ss <- 0.5

data_m1_50_05 <- vector(mode = 'list',
                        length = M)

data_m2_50_05 <- vector(mode = 'list',
                        length = M)

data_mp_50_05 <- vector(mode = 'list',
                        length = M)

data_layer_50_05 <- vector(mode = 'list',
                           length = M)

data_star_50_05 <- vector(mode = 'list',
                          length = M)

for (e in 1:M) {

  data_m1_50_05[[e]] <- m1gv(N = N,
                             p = p,
                             ss = ss)

  data_m2_50_05[[e]] <- m2gv(N = N,
                             p = p,
                             ss = ss)

  data_mp_50_05[[e]] <- mpgv(N = N,
                             p = p,
                             ss = ss)

  data_layer_50_05[[e]] <- layer(N = N,
                                 p = p,
                                 ss = ss)

  data_star_50_05[[e]] <- star(N = N,
                               p = p,
                               ss = ss)

}

################################################################################
# M1, M2, layer, multi-parent, star
# sample size = 50
# signal strength = 1
################################################################################

ss <- 1

data_m1_50_1 <- vector(mode = 'list',
                       length = M)

data_m2_50_1 <- vector(mode = 'list',
                       length = M)

data_mp_50_1 <- vector(mode = 'list',
                       length = M)

data_layer_50_1 <- vector(mode = 'list',
                          length = M)

data_star_50_1 <- vector(mode = 'list',
                         length = M)

for (e in 1:M) {

  data_m1_50_1[[e]] <- m1gv(N = N,
                            p = p,
                            ss = ss)

  data_m2_50_1[[e]] <- m2gv(N = N,
                            p = p,
                            ss = ss)

  data_mp_50_1[[e]] <- mpgv(N = N,
                            p = p,
                            ss = ss)

  data_layer_50_1[[e]] <- layer(N = N,
                                p = p,
                                ss = ss)

  data_star_50_1[[e]] <- star(N = N,
                              p = p,
                              ss = ss)

}

# save.image("~/Sync/Evan/classesUofI/BCB600/baycn/simulations/
# data_gv_N_50.RData")
