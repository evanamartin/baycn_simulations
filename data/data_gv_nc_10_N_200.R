library (baycn,
         lib = '/mnt/lfs2/mart9986/Rpackages/')

set.seed(33)

# The number of data sets to simulate.
M <- 25

# Set the parameters for the simdata function
b0 <- 0; N <- 200; s <- 1
p <- 0.45; ssc <- 0.2
nC <- 10

#################################################
# ss = 0.2
#################################################

ss <- 0.2

data_m1_cp_10_200_02 <- vector(mode = 'list',
                               length = M)

data_m1_cc_10_200_02 <- vector(mode = 'list',
                               length = M)

data_m1_iv_10_200_02 <- vector(mode = 'list',
                               length = M)

for (e in 1:M) {

  data_m1_cp_10_200_02[[e]] <- simdata(b0 = b0,
                                       N = N,
                                       s = s,
                                       ss = ss,
                                       graph = 'm1_cp',
                                       p = p,
                                       ssc = ssc,
                                       nConfounding = nC)

  data_m1_cc_10_200_02[[e]] <- simdata(b0 = b0,
                                       N = N,
                                       s = s,
                                       ss = ss,
                                       graph = 'm1_cc',
                                       p = p,
                                       ssc = ssc,
                                       nConfounding = nC)

  data_m1_iv_10_200_02[[e]] <- simdata(b0 = b0,
                                       N = N,
                                       s = s,
                                       ss = ss,
                                       graph = 'm1_iv',
                                       p = p,
                                       ssc = ssc,
                                       nConfounding = nC)

}

#################################################
# ss = 0.5
#################################################

ss <- 0.5

data_m1_cp_10_200_05 <- vector(mode = 'list',
                               length = M)

data_m1_cc_10_200_05 <- vector(mode = 'list',
                               length = M)

data_m1_iv_10_200_05 <- vector(mode = 'list',
                               length = M)

for (e in 1:M) {

  data_m1_cp_10_200_05[[e]] <- simdata(b0 = b0,
                                       N = N,
                                       s = s,
                                       ss = ss,
                                       graph = 'm1_cp',
                                       p = p,
                                       ssc = ssc,
                                       nConfounding = nC)

  data_m1_cc_10_200_05[[e]] <- simdata(b0 = b0,
                                       N = N,
                                       s = s,
                                       ss = ss,
                                       graph = 'm1_cc',
                                       p = p,
                                       ssc = ssc,
                                       nConfounding = nC)

  data_m1_iv_10_200_05[[e]] <- simdata(b0 = b0,
                                       N = N,
                                       s = s,
                                       ss = ss,
                                       graph = 'm1_iv',
                                       p = p,
                                       ssc = ssc,
                                       nConfounding = nC)

}

#################################################
# ss = 1
#################################################

ss <- 1

data_m1_cp_10_200_1 <- vector(mode = 'list',
                              length = M)

data_m1_cc_10_200_1 <- vector(mode = 'list',
                              length = M)

data_m1_iv_10_200_1 <- vector(mode = 'list',
                              length = M)

for (e in 1:M) {

  data_m1_cp_10_200_1[[e]] <- simdata(b0 = b0,
                                      N = N,
                                      s = s,
                                      ss = ss,
                                      graph = 'm1_cp',
                                      p = p,
                                      ssc = ssc,
                                      nConfounding = nC)

  data_m1_cc_10_200_1[[e]] <- simdata(b0 = b0,
                                      N = N,
                                      s = s,
                                      ss = ss,
                                      graph = 'm1_cc',
                                      p = p,
                                      ssc = ssc,
                                      nConfounding = nC)

  data_m1_iv_10_200_1[[e]] <- simdata(b0 = b0,
                                      N = N,
                                      s = s,
                                      ss = ss,
                                      graph = 'm1_iv',
                                      p = p,
                                      ssc = ssc,
                                      nConfounding = nC)

}

#save.image('/mnt/lfs2/mart9986/baycn/data_gv_nc_10_N_200.RData')
