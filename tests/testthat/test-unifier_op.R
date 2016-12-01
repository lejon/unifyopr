context('testing basics of unifier op:')

test_that("list form",{
  tmp1 <- c(10, 11, 12)
  ll <- list(h, i, j) %<->% tmp1
  expect_identical(h, tmp1[1], "Component 1 does not match")
  expect_identical(i, tmp1[2], "Component 2 does not match")
  expect_identical(j, tmp1[3], "Component 3 does not match")
  expect_identical(ll, list(10, 11, 12), "Assignment does not match")
})

test_that("vector form with assignment",{
  tmp1 <- c(10, 11, 12)
  cc <- c(h, i, j) %<->% tmp1
  expect_identical(h, tmp1[1], "Component 1 does not match")
  expect_identical(i, tmp1[2], "Component 2 does not match")
  expect_identical(j, tmp1[3], "Component 3 does not match")
  expect_identical(cc, c(10, 11, 12), "Assignment does not match")
})

test_that("unification with vector variable",{
  tmp1 <- c(10, 11, 12)
  c(h, i, j) %<->% tmp1
  expect_identical(h, tmp1[1], "Component 1 does not match")
  expect_identical(i, tmp1[2], "Component 2 does not match")
  expect_identical(j, tmp1[3], "Component 3 does not match")
})

test_that("unification with list variable",{
  tmp1 <- list(d1 = "hej", d2 = "hopp", d3 = "lingon")
  c(k, l, m) %<->% tmp1
  expect_identical(k, unlist(tmp1[[1]]), paste("Component 1 does not match: ", k , "!=", unlist(tmp1[1])))
  expect_identical(l, unlist(tmp1[[2]]), "Component 2 does not match")
  expect_identical(m, unlist(tmp1[[3]]), "Component 3 does not match")
})

test_that("unification with list data frames",{
  tmp1 <- list(d1 = data.frame(a=list(h1="hej")), d2 = data.frame(a=list(h2="hopp")))
  c(k, l) %<->% tmp1
  #str(k)
  expect_identical(k, tmp1[[1]], paste("Component 1 does not match: ", k))
  expect_identical(l, tmp1[[2]], "Component 2 does not match")
})

test_that("unification with list builtin data frames",{
  ds <- list(e1=mtcars, e2=iris)
  c(crs, irs) %<->% ds
  expect_is(crs, "data.frame")
  expect_identical(crs, mtcars, "Dataset is not mtcars")
  expect_is(irs, "data.frame")
  expect_identical(irs, iris, "Dataset is not iris")
})

test_that("unification with list variable with lists",{
  tmp1 <- list(d1 = "hej", d2 = list(e1="a", e2="a2"), d3 = "lingon")
  c(k, l, m) %<->% tmp1
  expect_identical(k, unlist(tmp1[[1]]), paste("Component 1 does not match: ", k , "!=", unlist(tmp1[1])))
  expect_equivalent(l, tmp1[[2]], "Component 2 does not match")
  expect_identical(m, unlist(tmp1[[3]]), "Component 3 does not match")
})

test_that("unification with language construct",{
  c(a, b, c) %<->% c(10, 11, 12)
  expect_identical(a, 10, "Component 1 does not match")
  expect_identical(b, 11, "Component 2 does not match")
  expect_identical(c, 12, "Component 3 does not match")
})

test_that("unification with function calls",{
  tst <- function(a1) {
    tmp1 <- c(10, 11, 12)
    c(h, i, j) %<->% tmp1
    expect_identical(h, tmp1[1], "Component 1 does not match")
    expect_identical(i, tmp1[2], "Component 2 does not match")
    expect_identical(j, tmp1[3], "Component 3 does not match")
  }

  tst("gnu")

  tst2 <- function(astr) {
    tmp1 <- list(e1=astr, e2=10)
    c(a,j) %<->% tmp1
    expect_equivalent(a, "hej", paste0("Component 1 does not match: ", a))
    expect_equivalent(j, 10, paste0("Component 2 does not match: ", j, "!=", 10))
  }

  tst2("hej")
})

test_that("unification with expression",{
  A = matrix(c(6, 2, 0, 2, 6, 0, 0, 0, 36), nrow = 3)
  eigdecomp <- eigen(A, symmetric=TRUE)
  c(V,L) %<->% eigen(A, symmetric=TRUE)

  expect_equivalent(V, c(36,8,4), "Eigenvalues does not match")

  expect_equivalent(L, eigdecomp$vectors, "Vectors does not match: ")
})
