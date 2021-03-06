#' Finalize sequence statitistics
#'
#' This function converts \code{M2} to unbiased Variance \code{var} and exports the final statistics.
#' @param aggr A matrix containing the existing, final aggregate statistics. Should be output of \code{UPDATEaggr}: \code{n}, \code{mean}, \code{M2}.
#' @return A matrix with 1 row and 3 columns: Current size \code{n}, current mean \code{mean} and current unbiased variance, \code{var}.
#' @examples
#' seq <- matrix(sample(1:100, 100), ncol = 5)
#' m <- INIaggr(seq[1,])
#' for (i in 2:20){
#' m <- UPDATEaggr(m, seq[i,])
#' }
#'
#' mfin <- FINALIZEaggr(m)
#' all(
#' all.equal(mfin[1,1], nrow(seq)),
#' all.equal(mfin[,2], colMeans(seq)),
#' all.equal(mfin[,3], apply(seq, 2, FUN = "var"))
#' )
#' @references Welford, B P. “Note on a Method for Calculating Corrected Sums of Squares and Products.” Technometrics 4, no. 3 (1962): 419–20.
#' @author Simon Kapitza \email{kapitzas@student.unimelb.edu.au}
#' @export

FINALIZEaggr <- function(v){
  v <- cbind(v, v[,3]/(v[,1]-1)) #unbiased variance estimate
  return(v[,c(1,2,4)])
}
