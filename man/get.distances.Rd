\name{get.distances}
\alias{get.distances}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Extract Distances From Mutual Cluster}
\description{Extract the within-cluster distances for each mutual cluster
}
\usage{
get.distances(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{An object of class \sQuote{mutualCluster}, returned by the
\sQuote{mutualCluster} function.}
}
\value{
  A list of distances.  For mutual custers of size 2, the corresponding
element is a 1x1 matrix.  For larger mutual custers, the corresponding
element is an object of type \sQuote{dist}.
}
\seealso{mutualCluster,print.mutualCluster}
\examples{
x <- cbind(c(-1.4806,1.5772,-0.9567,-0.92,-1.9976,-0.2723,-0.3153),
           c(-0.6283,-0.1065,0.428,-0.7777,-1.2939,-0.7796,0.012))
mc1 <- mutualCluster(x)
get.distances(mc1)
}
\keyword{cluster}% at least one, from doc/KEYWORDS
