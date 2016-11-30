# unifyopr
A unify operator for R

# Docs
The unifiy operator (%<->%) is a convenience operator for unifying a left hand side (LHS) with a right hand side (RHS). This is sometimes very convenient for reducing the amount of code needed for extracting items from vectors and lists. It emulates the MATLAB paradigm '[V,L] = eig(A);' where V and L are directly assigned the values of the resulting entries in the RHS. Strictly speaking it does not 'unify' since it follows the standard R paradigm with copy-on-modify.
