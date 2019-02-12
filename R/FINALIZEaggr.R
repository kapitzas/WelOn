#' Finalize sequence statitistics
#'
#' This function converts \code{M2} to unbiased Variance \code{var} and exports the final statistics.
#' @param aggr A matrix containing the existing, final aggregate statistics. Should be output of \code{UPDATEaggr}: \code{n}, \code{mean}, \code{M2}.
#' @return A matrix with 1 row and 3 columns: Current size \code{n}, current mean \code{mean} and current unbiased variance, \code{var}.
#' @examples
#' #' seq <- c(1:10)
#' m <- INIrun(seq[1])
#' for (i in 2:10){
#' m <- updatestats(m, seq[i])
#' }
#'
#' mfin <- finalize(m)
#' all(mfin[1] == length(seq),
#' mfin[2] == mean(seq),
#' mfin[3] == var(seq)
#' )
#'
#' @author Simon Kapitza \email{kapitzas@student.unimelb.edu.au}
#' @export

FINALIZEaggr <- function(v){
  v <- cbind(v, v[,3]/(v[,1]-1)) #unbiased variance estimate
  return(v[,c(1,2,4)])
}
