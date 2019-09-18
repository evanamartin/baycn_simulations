library (baycn,
         lib = '/mnt/lfs2/mart9986/Rpackages/')

set.seed(68)

# The number of data sets to simulate.
M <- 25

# Set the parameters for the simdata function
b0 <- 0; N <- 200; s <- 1
p <- 0.45; ssc <- 0.2
nC <- 2

#################################################
# ss = 0.2
#################################################

ss <- 0.2

data_m2_cp_2_200_02 <- vector(mode = 'list',
                              length = M)

data_m2_cc_2_200_02 <- vector(mode = 'list',
                              length = M)

data_m2_iv_2_200_02 <- vector(mode = 'list',
                              length = M)

for (e in 1:M) {

  data_m2_cp_2_200_02[[e]] <- simdata(b0 = b0,
                                      N = N,
                                      s = s,
                                      ss = ss,
                                      graph = 'm2_cp',
                                      p = p,
                                      ssc = ssc,
                                      nConfounding = nC)

  data_m2_cc_2_200_02[[e]] <- simdata(b0 = b0,
                                      N = N,
                                      s = s,
                                      ss = ss,
                                      graph = 'm2_cc',
                                      p = p,
                                      ssc = ssc,
                                      nConfounding = nC)

  data_m2_iv_2_200_02[[e]] <- simdata(b0 = b0,
                                      N = N,
                                      s = s,
                                      ss = ss,
                                      graph = 'm2_iv',
                                      p = p,
                                      ssc = ssc,
                                      nConfounding = nC)

}

#################################################
# ss = 0.5
#################################################

ss <- 0.5

data_m2_cp_2_200_05 <- vector(mode = 'list',
                              length = M)

data_m2_cc_2_200_05 <- vector(mode = 'list',
                              length = M)

data_m2_iv_2_200_05 <- vector(mode = 'list',
                              length = M)

for (e in 1:M) {

  data_m2_cp_2_200_05[[e]] <- simdata(b0 = b0,
                                      N = N,
                                      s = s,
                                      ss = ss,
                                      graph = 'm2_cp',
                                      p = p,
                                      ssc = ssc,
                                      nConfounding = nC)

  data_m2_cc_2_200_05[[e]] <- simdata(b0 = b0,
                                      N = N,
                                      s = s,
                                      ss = ss,
                                      graph = 'm2_cc',
                                      p = p,
                                      ssc = ssc,
                                      nConfounding = nC)

  data_m2_iv_2_200_05[[e]] <- simdata(b0 = b0,
                                      N = N,
                                      s = s,
                                      ss = ss,
                                      graph = 'm2_iv',
                                      p = p,
                                      ssc = ssc,
                                      nConfounding = nC)

}

#################################################
# ss = 1
#################################################

ss <- 1

data_m2_cp_2_200_1 <- vector(mode = 'list',
                             length = M)

data_m2_cc_2_200_1 <- vector(mode = 'list',
                             length = M)

data_m2_iv_2_200_1 <- vector(mode = 'list',
                             length = M)

for (e in 1:M) {

  data_m2_cp_2_200_1[[e]] <- simdata(b0 = b0,
                                     N = N,
                                     s = s,
                                     ss = ss,
                                     graph = 'm2_cp',
                                     p = p,
                                     ssc = ssc,
                                     nConfounding = nC)

  data_m2_cc_2_200_1[[e]] <- simdata(b0 = b0,
                                     N = N,
                                     s = s,
                                     ss = ss,
                                     graph = 'm2_cc',
                                     p = p,
                                     ssc = ssc,
                                     nConfounding = nC)

  data_m2_iv_2_200_1[[e]] <- simdata(b0 = b0,
                                     N = N,
                                     s = s,
                                     ss = ss,
                                     graph = 'm2_iv',
                                     p = p,
                                     ssc = ssc,
                                     nConfounding = nC)

}

save.image('/mnt/lfs2/mart9986/baycn/data_gv_m2_nc_2_N_200.RData')
