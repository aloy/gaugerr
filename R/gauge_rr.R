#' General Gauge R&R Analysis Function
#'
#' @param data a data frame that contains measurements, operators and parts
#' for a Gauge R&R analysis
#' @param part a column of the data frame that has the part labels for the
#' measurements
#' @param operator a column of the data frame that has the operator labels
#' for the measurements
#' @param measurement a column of the data frame that has measurements of the
#' object collected
#' @param interaction this is a binary parameter where the user can specify if
#' there is or is not interaction in the data set.
#'
#' @return a data frame with the confidence and point estimator values, for the
#' appropriate analysis (balanced/unbalanced and one factor/two factor.)
#' @export
#'
#' @import dplyr
#'
#' @examples
#' mydata <- data.frame(P=c(1,2,3,4,1,2,3,4), O=c(1,2,1,2,1,2,1,2), Y=c(2,2,2,3,3,2,3,2))
#' gauge_rr(mydata)
gauge_rr <- function(data, part=P, operator=O, measurement=Y, interaction) {
  part_var <- rlang::enquo(part)
  oper_var <- rlang::enquo(operator)
  y_var <- rlang::enquo(measurement)
  # Function to determine if it is balanced
  if (is_balanced(data, !!part_var, !!oper_var) == TRUE){
    print("balanced")
  }else{
    #check for one factor or two factors
    print("unbalanced")
  }

  # Function to check if there is interaction? not sure how to do this


  # Function to determine how many factors
  # Then run the appropriate function for the data and the gauge R&R
  # study

  # output the study results
}


is_balanced <- function(data, part=P, operator=O) {
  total <- dplyr::count(data, {{part}}, {{operator}})

  for (i in 1:length(total$n)){
    if (sum(total$n)/length(total$n) == total$n[i]){
      result <- TRUE
    }else{
      result <- FALSE
      break
    }
  }
  return(result)
  #what determines if it is balanced
}


num_factors <- function(data, part=NULL, operator=NULL){
  if (is.null(part) && is.null(operator)){
    print("two factor model")
  }else if(!is.null(part) && is.null(operator)){
    print("one factor model")
  }else if(is.null(part) && !is.null(operator)){
    print("one factor model")
  }else{
    print("error")
  }
}
