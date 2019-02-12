#' Initiate a sequence of values to be updated online.
#'
#' This function initiates the output matrix for Welford's Online algorithm.
#' @param vec A numeric value. This is the first value of a sequence.
#' @return A matrix with \code{length(vec)} rows and 3 columns: Sample size \code{n = 1}, current mean \code{mean[i] = vec[i]} and current M2, \code{M2 = 0}, which is the average distance to \code{vec[i]} to \code{mean[i]}, so initially 0.
#' @examples
#' seq <- matrix(sample(1:100, 100), ncol = 5)
#' m <- INIaggr(seq[1,])
#' @author Simon Kapitza \email{kapitzas@student.unimelb.edu.au}
#' @export

INIaggr <- function(vec){
  v <- matrix(ncol = 3, nrow = length(vec))
  v[, 1] <- 1 #n
  v[, 2] <- vec #first mean (initially same as first value)
  v[, 3] <- 0 #first M2 (average distance to mean, initially 0)
  return(v)
}
