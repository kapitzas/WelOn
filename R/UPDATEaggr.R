#' Update sequence statitistics using Welford's Online algorithm
#'
#' This function updates n, mean and M2 when a new value is added to the sequence.
#' @param aggr A matrix containing the existing aggregate statistics. Usually output of \code{INIaggr}: \code{n}, \code{mean}, \code{M2}.
#' @return A matrix with \code{nrow(aggr)} rows and 3 columns: Current size \code{n}, current mean \code{mean} and current M2, \code{M2}, which is the average distance previous values to \code{mean}.
#' @examples
#' seq <- matrix(sample(1:100, 100), ncol = 5)
#' m <- INIaggr(seq[1,])
#' for (i in 2:20){
#' m <- UPDATEaggr(m, seq[i,])
#' }
#' @references Welford, B P. “Note on a Method for Calculating Corrected Sums of Squares and Products.” Technometrics 4, no. 3 (1962): 419–20.
#' @author Simon Kapitza \email{kapitzas@student.unimelb.edu.au}
#' @export

UPDATEaggr <- function(aggr, newvalue){
  v <- aggr
  nv <- newvalue
  v[,1] <- v[,1] + 1 #new n
  d <- nv - v[,2]
  v[,2] <- v[,2] + d / v[,1] #new mean
  d2 <- nv - v[,2]
  v[,3] <- v[,3] + d * d2 #new M2
  return(v)
}
