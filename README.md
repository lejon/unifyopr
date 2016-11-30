# unifyopr
A unify operator for R

# Docs
The unifiy operator (%<->%) is a convenience operator for unifying a left hand side (LHS) with a right hand side (RHS). This is sometimes very convenient for reducing the amount of code needed for extracting items from vectors and lists. It emulates the MATLAB paradigm '[V,L] = eig(A);' where V and L are directly assigned the values of the resulting entries in the RHS. Strictly speaking it does not 'unify' since it follows the standard R paradigm with copy-on-modify.

# Examples

```r
tst <- c(10,11,12)

c(h,i,j) %<->% tst

cat("h is: ", h, "\n")
cat("i is: ", i, "\n")
cat("j is: ", j, "\n")

cat1 <- list(d1="hej", d2="hopp", d3="lingon")
c(k,l,m) %<->% cat1

cat("k is: ", k, "\n")
cat("l is: ", l, "\n")
cat("m is: ", m, "\n")

c(a,b,c) %<->% c(10,11,12)

cat("a is: ", a, "\n")
cat("b is: ", b, "\n")
cat("c is: ", c, "\n")

A = matrix(c(6, 2, 0, 2, 6, 0, 0, 0, 36), nrow = 3)
c(L,V) %<->% eigen(A, symmetric=T)

cat("V is:\n")
str(V)
cat("L is: ", L, "\n")

BB = V %*% diag(L) %*% t(V)
str(BB)

ds <- list(e1=mtcars, e2=iris)
c(crs, irs) %<->% ds

crs

plot(irs$Petal.Length, irs$Petal.Width, pch=21,bg=c("red","green3","blue")[unclass(iris$Species)], main="Edgar Anderson's Iris Data")
