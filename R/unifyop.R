
make_operator <- function(args) {
  function(lhs, rhs)
  {
    parent <- parent.frame()
    env    <- new.env(parent = parent)
    lhs   <- match.call()

    theop <- lhs[[1]]
    sym <- lhs[[2]]
    unifier <- lhs[[3]]

    if(length(sym) == 1) {
      stop("A vector or list of variables is required on its left hand side\n",
           "e.g. c(h, i, j) %<->% c(10, 11, 12)")
    }

    strtype <- toString(sym[1])
    if(!(strtype=="list"||strtype=="c")) {
      stop("unify operator (%<->%) only supports 'list' or 'c' on left hand side")
    }

    unifier <- eval(unifier,envir = parent)
    for(i in 2:length(sym)) {
      strform <- as.character(sym[[i]])
      if(is.list(unifier[i-1])) {
        # Unpack lists of length 1
        if(length(unifier[i-1]) == 1) {
          assign(strform, unifier[[i-1]], envir=parent)
        } else {
          assign(strform, unifier[i-1], envir=parent)
        }
      } else {
        assign(strform, unifier[i-1], envir=parent)
      }
    }

    # return value is left hand side, evaluated with the new
    # variables bound
    invisible(eval(sym,envir = parent))
  }
}

#' unify operator
#'
#' The unify operator takes on its left hand side a vector of variable names to be bound
#' to the corresponding values on the right hand side.
#'
#' @param lhs A vector of variables to be bound to corresponding values in right hand side
#' @param rhs A vector or list of values to be copied to the left hand side
#'
#' @export
#'
#' @examples
#' tmp1 <- c(10, 11, 12)
#' c(h, i, j) %<->% tmp1
#'
#' cat1 <- list(d1 = "hej", d2 = "hopp", d3 = "lingon")
#' c(k, l, m) %<->% cat1
#'
#' c(a, b, c) %<->% c(10, 11, 12)
`%<->%` <- make_operator()


