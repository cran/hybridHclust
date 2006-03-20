\name{eisenCluster}
\alias{eisenCluster}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{An implementation of Eisen's hierarchical clustering}
\description{
  Bottom-up clustering in which each cluster is represented by the mean vector for observations in the cluster.  
}
\usage{ eisenCluster(x, method, compatible = TRUE, verbose = FALSE) }
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{Data matrix, whose rows we wish to cluster}
  \item{method}{How should distance between points (and centres) be calculated?
Choices include \dQuote{euclidean},\dQuote{squared.euclidean},
\dQuote{correlation},\dQuote{uncentered.correlation}.  For
\dQuote{euclidean} and \dQuote{squared.euclidean}, unexpected behaviour can
result, since data points are replaced by their cluster centres, the 
overall variance in the data will decrease.}

  \item{compatible}{Flag for whether cluster merging should be done as in
Eisen's cluster algorithm.  If \code{compatible=TRUE}, then when two
clusters are merged, a weighted average of the mean vectors for each of
the two clusters is used.  If \code{compatible=F}, then the original
data are averaged to obtain the new centre.  When \code{x} does not
contain missing values, these two options generate the same result.
If there are missing values, they will differ.  Using the original data
makes more sense when there are missing values, since the weights won't
account for the missing value pattern.
}
  \item{verbose}{Prints iteration number if TRUE}
}
\details{
The main difference between this algorithm and
\code{hclust(...,method='centroid')} is the manner in which missing
values are handled.  Here, original rows are merged at each
step, taking means after omitting missing observations.

Missing values are permitted, and can be handled in the same manner as in
Eisen's package.  This is perhaps the main reason the current
implementation might be used: to reproduce the clusterings found from
Eisen's code when there are missing values.  When two clusters are
merged, missing values can be handled
in two ways (controlled by the \code{compatible} flag): (1) new cluster
centres can be calculated using means of all original observations in the
clusters, or (2) new cluster centres can be calculated using a weighted
average of the means of the two clusters being joined.  Although Eisen's
cluster software uses (2), it seems less desirable 
in situations where observations are missing in some
dimensions only, since the presence of missing values will cause the wrong
weights to be used when updating centres.
Subsequent averaging of clusters centres will ignore the missingness
patterns in the cluster means.  Option (2) is included to enable clusters
identical to Eisen's to be produced.
}
\value{
 A \code{hclust} object.  The definition of distance between 2 clusters as
the distance between their means can result in a non-monotone dendrogram
(e.g., if A, B, C are vertices of an equilateral triangle with side lengths
1, A joins B at distance 1, then C joins AB at distance 0.866).
Non-monotone distances are coerced to be monotone before the object is
returned.  This can yeild dendrograms which seem to join more than 2 points
at one height.

The \dQuote{trueheight} component contains actual heights before they were
forced to be monotone.
}
\author{Hugh Chipman}
\keyword{cluster}
\examples{
set.seed(101)
x <- matrix(rnorm(500),5,100)
x <- rbind(x,x[rep(1,4),]+matrix(rnorm(400),4,100))
x <- rbind(x,x[2:5,]+matrix(rnorm(400),4,100))
par(mfrow=c(1,2))
image(1-cor(t(x)),main='correlation distances',zlim=c(0,2),col=gray(1:100/101))
e1 <- eisenCluster(x,'correlation')
plot(e1)
}
