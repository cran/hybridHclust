\name{tsvq}
\alias{tsvq}
\alias{tsvq2hclust}
\title{Tree Structured Vector Quantization}
\description{Construct a top-down hierarchical clustering, recursively
using k-means with k=2 (kmeans is also known as \dQuote{vector quantization}).}
\usage{
tsvq(x, K=nrow(x), row.labs=1:nrow(x),ntry=20,verbose=FALSE,as.hclust=TRUE,trace=FALSE)
tsvq2hclust(obj)
}
\arguments{
 \item{x}{A data matrix whose rows (i.e., observations) are to be clustered}
 \item{K}{The number of terminal nodes that the tree should have.  This
must be less than or equal the number of rows of x.  If the number of rows
of x is used, then the resultant tree will have one data point in each
terminal node of the tree.}
 \item{row.labs}{Observation labels.  Must be numeric in \code{tsvq} for \code{tsvq2hclust} to function.}
 \item{ntry}{The number of attempts of 2-means used to subdivide each node
into two children.  For each attempt, two data points are randomly
selected as initial centres.  Since 2-means cannot guarantee a globally
optimal partition into 2 clusters, multiple tries often will improve the
quality of the clustering.}
 \item{verbose}{Should details of the growing be printed?}
 \item{as.hclust}{Should the tree be returned as a \code{hclust} object?
This option is provided because the \code{hybridHclust} function needs the
tsvq output in raw form at an intermediate step.}
 \item{obj}{an object created by \code{tsvq}}
 \item{trace}{Flag indicating brief iteration count should be printed.
Useful for large problems to indicate status.}
}
\details{
To construct a top-down hierarchical clustering, the data must be
recursively subdivided into two clusters.  2-means is used to find a "good"
(but seldom optimal) subdivision.  Multiple restarts of kmeans tend to
increase the quality of the clustering.  Because random seeds are used to
select initial centres, two different runs of tsvq are not guaranteed to
produce an identical clustering.

The use of k-means implies that the top-down clustering is trying to
minimize with-cluster sums of squared Euclidean distances.

}
\value{If \code{as.hclust=FALSE}, then \code{tsvq} will return a list
that recursively represents the tree structure.  If \code{as.hclust=TRUE},
an object compatible with \code{hclust} is returned.  Methods such as 
\code{plot} and \code{cutree} can be applied to hclust objects.

The helper function 
\code{tsvq2hclust} will convert a tsvq object to hclust format.
}
\keyword{cluster}
\author{Hugh Chipman;  Trevor Hastie wrote the original tsvq code}
\seealso{hybridHclust}
\examples{
x <- cbind(c(-1.4806,1.5772,-0.9567,-0.92,-1.9976,-0.2723,-0.3153),
c( -0.6283,-0.1065,0.428,-0.7777,-1.2939,-0.7796,0.012))
t1 <- tsvq(x)
par(mfrow=c(1,2))
plot(x,pch=as.character(1:nrow(x)),asp=1)
plot(t1)
cbind(x,cutree(t1,2))
# below also works although you don't need to do it this way.
t2 <- tsvq(x,as.hclust=FALSE)
t2 <- tsvq2hclust(t2)
}
