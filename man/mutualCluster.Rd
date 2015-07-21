\name{mutualCluster}
\alias{mutualCluster}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Find mutual clusters}
\description{
Using bottom-up hierarchical clustering, find the set of maximal mutual clusters.
}
\usage{ mutualCluster(x, distances, method = "average", plot = FALSE) }
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{Data matrix, the rows of which we wish to cluster}
  \item{distances}{Distances between objects to be clustered.  This may be
a symmetric matrix or a object produced by \code{dist}.
Note that only one of \code{distances} and
\code{x} should be provided.}
  \item{method}{Does not affect mutual clusters returned by mutualCluster.
  Method used in hclust to join clusters.  
  Must be one of \dQuote{single}, \dQuote{complete} or \dQuote{average}.
  This option only affects the plotting, since all 3 methods give the
same mutual clusters.}
  \item{plot}{Flag indicating whether the dendrogram for bottom-up
  clustering should be displayed.}
}
\details{
  A mutual cluster is a group of points such that the largest distance
between any pair in the group is smaller than the shortest distance to 
any point outside the group.  

This function relies on the fact that
bottom-up clustering with average, single, or complete linkage cannot break
a mutual cluster.  That is, when agglomerating,
these clustering methods will never add points
outside the mutual cluster before first joining all points inside the
mutual cluster.

The function \code{mutualCluster} is primarily a wrapper that first performs a bottom-up
clustering, and then uses this information to identify the mutual clusters.
The utility functions that make up \code{mutualCluster} are listed under \dQuote{See
Also:} and can be used separately on a \code{hclust} object for finer control.  
}

\value{
    A list of mutual clusters.  Each component of the list is a vector of
observation indices corresponding to one mutual cluster.  Only the maximal
mutual clusters are returned, so if observations 1 and 2 form a MC, and
observations 1, 2, 4 also form a MC, then a vector with elements 1, 2, 4
will be returned.
}
\author{Hugh Chipman}
\references{Chipman, H. and Tibshirani, R. (2006) "Hybrid Hierarchical
Clustering with Applications to Microarray Data", Biostatistics, 7,
302-317.

}
\examples{
x <- cbind(c(-1.4806,1.5772,-0.9567,-0.92,-1.9976,-0.2723,-0.3153),
           c(-0.6283,-0.1065,0.428,-0.7777,-1.2939,-0.7796,0.012))
par(mfrow=c(1,2))
plot(x,pch=as.character(1:nrow(x)),asp=1) # show data 
dist(x) # you can verify that mc's are correct 
mutualCluster(x,plot=TRUE) # find MCs and indicate them in dendrogram plot
}
\keyword{cluster}% at least one, from doc/KEYWORDS
