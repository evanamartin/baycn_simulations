library (kableExtra)

################################################################################
# Function that accepts three lists of baycn output (e.g., the output from one
# topology with three different signal strength values) and outputs a matrix
# containing the mean and standard deviation of the MSE for each edge across all
# M data sets.
# mh1, mh2, and mh3: baycn output for three different runs on the same topology
# ep: the expected probability of each edge state for each edge
# M: the nubmer of data sets run through baycn
################################################################################
emse <- function (pp1, pp2, pp3, ep, M) {

  # Calculate the squared error of each edge state for each edge.
  se1 <- lapply(pp1,
                function (x) (ep - x@posteriorES[, 2:4])^2)
  se2 <- lapply(pp2,
                function (x) (ep - x@posteriorES[, 2:4])^2)
  se3 <- lapply(pp3,
                function (x) (ep - x@posteriorES[, 2:4])^2)

  # Extract the number of edges in the network
  nEdges <- dim(ep)[1]

  # Each list below will have a sub list of M elements (the MSE across the edge
  # states for each of the M data sets).
  edgeMean1 <- vector(mode = 'list',
                      length = nEdges)
  edgeMean2 <- vector(mode = 'list',
                      length = nEdges)
  edgeMean3 <- vector(mode = 'list',
                      length = nEdges)

  # Vectors for the MSE and sd of the MSE for each edge.
  mse1_m <- vector(mode = 'numeric',
                   length = nEdges)
  mse2_m <- vector(mode = 'numeric',
                   length = nEdges)
  mse3_m <- vector(mode = 'numeric',
                   length = nEdges)
  mse1_sd <- vector(mode = 'numeric',
                    length = nEdges)
  mse2_sd <- vector(mode = 'numeric',
                    length = nEdges)
  mse3_sd <- vector(mode = 'numeric',
                    length = nEdges)

  # This for loop calculates the mean of the three edge states for each edge and
  # for each of the M data sets. Then it takes the mean and standard deviation
  # across all M data sets giving a mean and standard deviation of the MSE for
  # each edge.
  for (e in 1:nEdges) {

    # Take the mean of the squared error of the three edge states for each edge.
    edgeMean1[[e]] <- lapply(se1,
                             function (x) mean(as.numeric(x[e, ])))
    edgeMean2[[e]] <- lapply(se2,
                             function (x) mean(as.numeric(x[e, ])))
    edgeMean3[[e]] <- lapply(se3,
                             function (x) mean(as.numeric(x[e, ])))

    # Calculate the MSE and the standard deviation of the MSE for each edge.
    mse1_m[[e]] <- mean(unlist(edgeMean1[[e]]))
    mse1_sd[[e]] <- sd(unlist(edgeMean1[[e]]))
    mse2_m[[e]] <- mean(unlist(edgeMean2[[e]]))
    mse2_sd[[e]] <- sd(unlist(edgeMean2[[e]]))
    mse3_m[[e]] <- mean(unlist(edgeMean3[[e]]))
    mse3_sd[[e]] <- sd(unlist(edgeMean3[[e]]))

  }

  return (cbind(mse1_m, mse1_sd,
                mse2_m, mse2_sd,
                mse3_m, mse3_sd))

}

################################################################################
# Create the expected probability matrices for the edge-wise MSE calculation.
################################################################################

# The expected probabilities for M1 with 2 common parent confounding variables.
ep_m1_cp_2 <- matrix(c(1, 0, 0,
                       1, 0, 0,
                       0, 1, 0,
                       0, 1, 0,
                       0, 1, 0,
                       0, 1, 0),
                     byrow = TRUE,
                     ncol = 3)

# The expected probabilities for M1 with 2 common child confounding variables.
ep_m1_cc_2 <- matrix(c(1, 0, 0,
                       1, 0, 0,
                       1, 0, 0,
                       1, 0, 0,
                       1, 0, 0,
                       1, 0, 0),
                     byrow = TRUE,
                     ncol = 3)

# The expected probabilities for M1 with 2 intermediate confounding variables.
ep_m1_iv_2 <- matrix(c(1, 0, 0,
                       1, 0, 0,
                       1, 0, 0,
                       1, 0, 0,
                       0, 1, 0,
                       0, 1, 0),
                     byrow = TRUE,
                     ncol = 3)

################################################################################
# Run the emse function on the data for M1 with 2 confounding variables for
# N = 200, 500
################################################################################

#################################################
# Common parent confounding variables
# N = 200, 500
# ss = 0.2, 0.5, 1
#################################################

emse_m1_cp_2_200 <- emse(pp1 = bay_m1_cp_2_200_02,
                         pp2 = bay_m1_cp_2_200_05,
                         pp3 = bay_m1_cp_2_200_1,
                         ep = ep_m1_cp_2,
                         M = M)

kable(format = 'latex',
      booktabs = TRUE,
      cbind(rep('', 6),
            rep('', 6),
            1:6,
            round(emse_m1_cp_2_200, 4)))

emse_m1_cp_2_500 <- emse(pp1 = bay_m1_cp_2_500_02,
                         pp2 = bay_m1_cp_2_500_05,
                         pp3 = bay_m1_cp_2_500_1,
                         ep = ep_m1_cp_2,
                         M = M)

kable(format = 'latex',
      booktabs = TRUE,
      cbind(rep('', 6),
            rep('', 6),
            1:6,
            round(emse_m1_cp_2_500, 4)))

#################################################
# Common child confounding variables
# N = 200, 500
# ss = 0.2, 0.5, 1
#################################################

emse_m1_cc_2_200 <- emse(pp1 = bay_m1_cc_2_200_02,
                         pp2 = bay_m1_cc_2_200_05,
                         pp3 = bay_m1_cc_2_200_1,
                         ep = ep_m1_cc_2,
                         M = M)

kable(format = 'latex',
      booktabs = TRUE,
      cbind(rep('', 6),
            rep('', 6),
            1:6,
            round(emse_m1_cc_2_200, 4)))

emse_m1_cc_2_500 <- emse(pp1 = bay_m1_cc_2_500_02,
                         pp2 = bay_m1_cc_2_500_05,
                         pp3 = bay_m1_cc_2_500_1,
                         ep = ep_m1_cc_2,
                         M = M)

kable(format = 'latex',
      booktabs = TRUE,
      cbind(rep('', 6),
            rep('', 6),
            1:6,
            round(emse_m1_cc_2_500, 4)))

#################################################
# Intermediate confounding variables
# N = 200, 500
# ss = 0.2, 0.5, 1
#################################################

emse_m1_iv_2_200 <- emse(pp1 = bay_m1_iv_2_200_02,
                         pp2 = bay_m1_iv_2_200_05,
                         pp3 = bay_m1_iv_2_200_1,
                         ep = ep_m1_iv_2,
                         M = M)

kable(format = 'latex',
      booktabs = TRUE,
      cbind(rep('', 6),
            rep('', 6),
            1:6,
            round(emse_m1_iv_2_200, 4)))

emse_m1_iv_2_500 <- emse(pp1 = bay_m1_iv_2_500_02,
                         pp2 = bay_m1_iv_2_500_05,
                         pp3 = bay_m1_iv_2_500_1,
                         ep = ep_m1_iv_2,
                         M = M)

kable(format = 'latex',
      booktabs = TRUE,
      cbind(rep('', 6),
            rep('', 6),
            1:6,
            round(emse_m1_iv_2_500, 4)))
