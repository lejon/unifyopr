
# unifyopr
A unify operator for R

# Docs
The unifiy operator (%<->%) is a convenience operator for unifying a left hand side (LHS) with a right hand side (RHS). This is sometimes very convenient for reducing the amount of code needed for extracting items from vectors and lists. It emulates the MATLAB paradigm '[V,L] = eig(A);' where V and L are directly assigned the values of the resulting entries in the RHS. Strictly speaking it does not 'unify' since it follows the standard R paradigm with copy-on-modify.

# Examples

Extracting from vectors variables.
```r
tst <- c(10,11,12)

c(h,i,j) %<->% tst

cat("h is: ", h, "\n")
h is:  10 
cat("i is: ", i, "\n")
i is:  11 
cat("j is: ", j, "\n")
j is:  12 
```

Extracting from named lists.
```r
cat1 <- list(d1="hej", d2="hopp", d3="lingon")
c(k,l,m) %<->% cat1

cat("k is: ", k, "\n")
k is:  hej 
cat("l is: ", l, "\n")
l is:  hopp 
cat("m is: ", m, "\n")
m is:  lingon 
```

Extracting directly from vectors.
```r
c(a,b,c) %<->% c(10,11,12)

cat("a is: ", a, "\n")
a is:  10 
cat("b is: ", b, "\n")
b is:  11 
cat("c is: ", c, "\n")
c is:  12 
```

Extracting variables from data.frame.
```r
ll <- c(a,b,c) %<->% mtcars

> a
 [1] 21.0 21.0 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 17.8 16.4 17.3 15.2 10.4 10.4 14.7
[18] 32.4 30.4 33.9 21.5 15.5 15.2 13.3 19.2 27.3 26.0 30.4 15.8 19.7 15.0 21.4
> b
 [1] 6 6 4 6 8 6 8 4 4 6 6 8 8 8 8 8 8 4 4 4 4 8 8 8 8 4 4 4 8 6 8 4
> c
 [1] 160.0 160.0 108.0 258.0 360.0 225.0 360.0 146.7 140.8 167.6 167.6 275.8 275.8 275.8
[15] 472.0 460.0 440.0  78.7  75.7  71.1 120.1 318.0 304.0 350.0 400.0  79.0 120.3  95.1
[29] 351.0 145.0 301.0 121.0

> ll
 [1]  21.0  21.0  22.8  21.4  18.7  18.1  14.3  24.4  22.8  19.2  17.8  16.4  17.3  15.2
[15]  10.4  10.4  14.7  32.4  30.4  33.9  21.5  15.5  15.2  13.3  19.2  27.3  26.0  30.4
[29]  15.8  19.7  15.0  21.4   6.0   6.0   4.0   6.0   8.0   6.0   8.0   4.0   4.0   6.0
[43]   6.0   8.0   8.0   8.0   8.0   8.0   8.0   4.0   4.0   4.0   4.0   8.0   8.0   8.0
[57]   8.0   4.0   4.0   4.0   8.0   6.0   8.0   4.0 160.0 160.0 108.0 258.0 360.0 225.0
[71] 360.0 146.7 140.8 167.6 167.6 275.8 275.8 275.8 472.0 460.0 440.0  78.7  75.7  71.1
[85] 120.1 318.0 304.0 350.0 400.0  79.0 120.3  95.1 351.0 145.0 301.0 121.0
```

Extracting variables from expressions.
```r
A = matrix(c(6, 2, 0, 2, 6, 0, 0, 0, 36), nrow = 3)
c(L,V) %<->% eigen(A, symmetric=T)

cat("V is:\n")
str(V)
V is: 
 num [1:3, 1:3] 0 0 1 0.707 0.707 ...
cat("L is: ", L, "\n")
L is: 
 num [1:3] 36 8 4

BB = V %*% diag(L) %*% t(V)
str(BB)
BB: 6 2 0 2 6 0 0 0 36
```

Extracting data.frames from list.
```r
ds <- list(e1=mtcars, e2=iris)
c(crs, irs) %<->% ds

# crs now contains the mtcars dataset 
# irs now contains the iris dataset
plot(irs$Petal.Length, irs$Petal.Width, pch=21,bg=c("red","green3","blue")[unclass(iris$Species)], main="Edgar Anderson's Iris Data")
```

