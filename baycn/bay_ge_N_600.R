# This file contains the code for the analysis at the beginning of the aim 1
# manuscript when we are evaluating the performance of baycn. We simulated 25
# data sets for g2, h2, m1, m2, mp, nc11, and pc. We will later calcualte the
# MSE of each edge for each data set and report the mean and standard deviation
# of the MSE instead of the posterior probability of each edge.

library (baycn,
         lib = '/mnt/lfs2/mart9986/Rpackages/')
library (doParallel,
         lib = '/mnt/lfs2/mart9986/Rpackages/')

# Specify the number of cores to be used
registerDoParallel(cores = 25)

load('/mnt/lfs2/mart9986/data/data_ge_N_600.RData')

# Adjacency matrices for the topologies being analyzed by baycn
adjMatrix_g2 <- matrix(c(0, 1, 1, 0,
                         0, 0, 0, 1,
                         0, 0, 0, 0,
                         0, 0, 1, 0),
                       byrow = TRUE,
                       nrow = 4)

adjMatrix_h2 <- matrix(c(0, 1, 1, 0, 0,
                         0, 0, 0, 1, 0,
                         0, 0, 0, 0, 1,
                         0, 0, 0, 0, 1,
                         0, 0, 0, 0, 0),
                       byrow = TRUE,
                       nrow = 5)

adjMatrix_m1 <- matrix(c(0, 1, 0,
                         0, 0, 1,
                         0, 0, 0),
                       byrow = TRUE,
                       nrow = 3)

adjMatrix_m2 <- matrix(c(0, 1, 0,
                         0, 0, 0,
                         0, 1, 0),
                       byrow = TRUE,
                       nrow = 3)

adjMatrix_mp <- matrix(c(0, 0, 0, 1,
                         0, 0, 0, 1,
                         0, 0, 0, 1,
                         0, 0, 0, 0),
                       byrow = TRUE,
                       nrow = 4)

adjMatrix_nc11 <- matrix(c(0,  1,  0,  0,  0,  0,  0,  0,  0,   0,   0,
                           1,  0,  1,  0,  0,  0,  0,  0,  0,   0,   0,
                           0,  1,  0,  1,  0,  0,  0,  0,  0,   0,   0,
                           0,  0,  1,  0,  1,  0,  0,  0,  0,   0,   0,
                           0,  0,  0,  1,  0,  1,  0,  0,  0,   0,   0,
                           0,  0,  0,  0,  0,  0,  0,  0,  0,   0,   0,
                           0,  0,  0,  0,  0,  1,  0,  1,  0,   0,   0,
                           0,  0,  0,  0,  0,  0,  1,  0,  1,   0,   0,
                           0,  0,  0,  0,  0,  0,  0,  1,  0,   1,   0,
                           0,  0,  0,  0,  0,  0,  0,  0,  1,   0,   1,
                           0,  0,  0,  0,  0,  0,  0,  0,  0,   1,   0),
                         byrow = TRUE,
                         nrow = 11)

adjMatrix_pc <- matrix(c(0, 1, 0, 0, 0, 1, 0, 1,
                         0, 0, 1, 0, 1, 0, 0, 0,
                         0, 0, 0, 0, 0, 0, 0, 0,
                         0, 0, 0, 0, 0, 0, 0, 0,
                         0, 0, 0, 0, 0, 1, 0, 1,
                         0, 0, 0, 0, 0, 0, 1, 0,
                         0, 0, 0, 0, 0, 0, 0, 0,
                         0, 0, 0, 0, 0, 0, 0, 0),
                       byrow = TRUE,
                       nrow = 8)

# ss = 0.2. --------------------------------------------------------------------

# G2
# 100
# 0.2

bay_g2_600_02 <- foreach(e = 1:M) %dopar% {

  mhEdge(adjMatrix = adjMatrix_g2,
         data = data_g2_600_02[[e]],
         iterations = 30000,
         nGV = 0,
         pmr = FALSE,
         prior = c(0.05,
                   0.05,
                   0.9),
         burnIn = 0.2,
         thinTo = 200)

}

# H2
# 100
# 0.2

bay_h2_600_02 <- foreach(e = 1:M) %dopar% {

  mhEdge(adjMatrix = adjMatrix_h2,
         data = data_h2_600_02[[e]],
         iterations = 30000,
         nGV = 0,
         pmr = FALSE,
         prior = c(0.05,
                   0.05,
                   0.9),
         burnIn = 0.2,
         thinTo = 200)

}

# M1
# 100
# 0.2

bay_m1_600_02 <- foreach(e = 1:M) %dopar% {

  mhEdge(adjMatrix = adjMatrix_m1,
         data = data_m1_600_02[[e]],
         iterations = 30000,
         nGV = 0,
         pmr = FALSE,
         prior = c(0.05,
                   0.05,
                   0.9),
         burnIn = 0.2,
         thinTo = 200)

}

# M2
# 100
# 0.2

bay_m2_600_02 <- foreach(e = 1:M) %dopar% {

  mhEdge(adjMatrix = adjMatrix_m2,
         data = data_m2_600_02[[e]],
         iterations = 30000,
         nGV = 0,
         pmr = FALSE,
         prior = c(0.05,
                   0.05,
                   0.9),
         burnIn = 0.2,
         thinTo = 200)

}

# MP
# 100
# 0.2

bay_mp_600_02 <- foreach(e = 1:M) %dopar% {

  mhEdge(adjMatrix = adjMatrix_mp,
         data = data_mp_600_02[[e]],
         iterations = 30000,
         nGV = 0,
         pmr = FALSE,
         prior = c(0.05,
                   0.05,
                   0.9),
         burnIn = 0.2,
         thinTo = 200)

}

# NC11
# 100
# 0.2

bay_nc11_600_02 <- foreach(e = 1:M) %dopar% {

  mhEdge(adjMatrix = adjMatrix_nc11,
         data = data_nc11_600_02[[e]],
         iterations = 50000,
         nGV = 0,
         pmr = FALSE,
         prior = c(0.05,
                   0.05,
                   0.9),
         burnIn = 0.2,
         thinTo = 200)

}

# PC
# 100
# 0.2

bay_pc_600_02 <- foreach(e = 1:M) %dopar% {

  mhEdge(adjMatrix = adjMatrix_pc,
         data = data_pc_600_02[[e]],
         iterations = 50000,
         nGV = 0,
         pmr = FALSE,
         prior = c(0.05,
                   0.05,
                   0.9),
         burnIn = 0.2,
         thinTo = 200)

}

save.image('/mnt/lfs2/mart9986/baycn/bay_ge_N_600.RData')

# ss = 0.5 ---------------------------------------------------------------------

# G2
# 100
# 0.5

bay_g2_600_05 <- foreach(e = 1:M) %dopar% {

  mhEdge(adjMatrix = adjMatrix_g2,
         data = data_g2_600_05[[e]],
         iterations = 30000,
         nGV = 0,
         pmr = FALSE,
         prior = c(0.05,
                   0.05,
                   0.9),
         burnIn = 0.2,
         thinTo = 200)

}

# H2
# 100
# 0.5

bay_h2_600_05 <- foreach(e = 1:M) %dopar% {

  mhEdge(adjMatrix = adjMatrix_h2,
         data = data_h2_600_05[[e]],
         iterations = 30000,
         nGV = 0,
         pmr = FALSE,
         prior = c(0.05,
                   0.05,
                   0.9),
         burnIn = 0.2,
         thinTo = 200)

}

# M1
# 100
# 0.5

bay_m1_600_05 <- foreach(e = 1:M) %dopar% {

  mhEdge(adjMatrix = adjMatrix_m1,
         data = data_m1_600_05[[e]],
         iterations = 30000,
         nGV = 0,
         pmr = FALSE,
         prior = c(0.05,
                   0.05,
                   0.9),
         burnIn = 0.2,
         thinTo = 200)

}

# M2
# 100
# 0.5

bay_m2_600_05 <- foreach(e = 1:M) %dopar% {

  mhEdge(adjMatrix = adjMatrix_m2,
         data = data_m2_600_05[[e]],
         iterations = 30000,
         nGV = 0,
         pmr = FALSE,
         prior = c(0.05,
                   0.05,
                   0.9),
         burnIn = 0.2,
         thinTo = 200)

}

# MP
# 100
# 0.5

bay_mp_600_05 <- foreach(e = 1:M) %dopar% {

  mhEdge(adjMatrix = adjMatrix_mp,
         data = data_mp_600_05[[e]],
         iterations = 30000,
         nGV = 0,
         pmr = FALSE,
         prior = c(0.05,
                   0.05,
                   0.9),
         burnIn = 0.2,
         thinTo = 200)

}

# NC11
# 100
# 0.5

bay_nc11_600_05 <- foreach(e = 1:M) %dopar% {

  mhEdge(adjMatrix = adjMatrix_nc11,
         data = data_nc11_600_05[[e]],
         iterations = 50000,
         nGV = 0,
         pmr = FALSE,
         prior = c(0.05,
                   0.05,
                   0.9),
         burnIn = 0.2,
         thinTo = 200)

}

# PC
# 100
# 0.5

bay_pc_600_05 <- foreach(e = 1:M) %dopar% {

  mhEdge(adjMatrix = adjMatrix_pc,
         data = data_pc_600_05[[e]],
         iterations = 50000,
         nGV = 0,
         pmr = FALSE,
         prior = c(0.05,
                   0.05,
                   0.9),
         burnIn = 0.2,
         thinTo = 200)

}

save.image('/mnt/lfs2/mart9986/baycn/bay_ge_N_600.RData')

# ss = 1 -----------------------------------------------------------------------

# G2
# 100
# 1

bay_g2_600_1 <- foreach(e = 1:M) %dopar% {

  mhEdge(adjMatrix = adjMatrix_g2,
         data = data_g2_600_1[[e]],
         iterations = 30000,
         nGV = 0,
         pmr = FALSE,
         prior = c(0.05,
                   0.05,
                   0.9),
         burnIn = 0.2,
         thinTo = 200)

}

# H2
# 100
# 1

bay_h2_600_1 <- foreach(e = 1:M) %dopar% {

  mhEdge(adjMatrix = adjMatrix_h2,
         data = data_h2_600_1[[e]],
         iterations = 30000,
         nGV = 0,
         pmr = FALSE,
         prior = c(0.05,
                   0.05,
                   0.9),
         burnIn = 0.2,
         thinTo = 200)

}

# M1
# 100
# 1

bay_m1_600_1 <- foreach(e = 1:M) %dopar% {

  mhEdge(adjMatrix = adjMatrix_m1,
         data = data_m1_600_1[[e]],
         iterations = 30000,
         nGV = 0,
         pmr = FALSE,
         prior = c(0.05,
                   0.05,
                   0.9),
         burnIn = 0.2,
         thinTo = 200)

}

# M2
# 100
# 1

bay_m2_600_1 <- foreach(e = 1:M) %dopar% {

  mhEdge(adjMatrix = adjMatrix_m2,
         data = data_m2_600_1[[e]],
         iterations = 30000,
         nGV = 0,
         pmr = FALSE,
         prior = c(0.05,
                   0.05,
                   0.9),
         burnIn = 0.2,
         thinTo = 200)

}

# MP
# 100
# 1

bay_mp_600_1 <- foreach(e = 1:M) %dopar% {

  mhEdge(adjMatrix = adjMatrix_mp,
         data = data_mp_600_1[[e]],
         iterations = 30000,
         nGV = 0,
         pmr = FALSE,
         prior = c(0.05,
                   0.05,
                   0.9),
         burnIn = 0.2,
         thinTo = 200)

}

# NC11
# 100
# 1

bay_nc11_600_1 <- foreach(e = 1:M) %dopar% {

  mhEdge(adjMatrix = adjMatrix_nc11,
         data = data_nc11_600_1[[e]],
         iterations = 50000,
         nGV = 0,
         pmr = FALSE,
         prior = c(0.05,
                   0.05,
                   0.9),
         burnIn = 0.2,
         thinTo = 200)

}

# PC
# 100
# 1

bay_pc_600_1 <- foreach(e = 1:M) %dopar% {

  mhEdge(adjMatrix = adjMatrix_pc,
         data = data_pc_600_1[[e]],
         iterations = 50000,
         nGV = 0,
         pmr = FALSE,
         prior = c(0.05,
                   0.05,
                   0.9),
         burnIn = 0.2,
         thinTo = 200)

}

save.image('/mnt/lfs2/mart9986/baycn/bay_ge_N_600.RData')
