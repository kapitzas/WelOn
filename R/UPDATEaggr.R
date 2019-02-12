#' Update sequence statitistics
#'
#' This function updates n, mean and M2 when a new value is added to the sequence.
#' @param aggr A matrix containing the existing aggregate statistics. Usually output of \code{INIaggr}: \code{n}, \code{mean}, \code{M2}.
#' @return A matrix with 1 row and 3 columns: Current size \code{n}, current mean \code{mean} and current M2, \code{M2}, which is the average distance previous values to \code{mean}.
#' @examples
#' #' seq <- c(1:10)
#' m <- INIrun(seq[1])
#' for (i in 2:10){
#' m <- updatestats(m, seq[i])
#' }

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
