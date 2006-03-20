\name{print.mutualCluster}
\alias{print.mutualCluster}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Printing Mutual Cluster Objects}
\description{
Print method for mutual cluster objects.
}
\usage{
print.mutualCluster(x, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{Object of class \sQuote{mutualCluster}}
  \item{\dots}{Additional arguments to \sQuote{print} (currently
ignored).}
}
\seealso{get.distances,mutualCluster}
\examples{
x <- cbind(c(-1.4806,1.5772,-0.9567,-0.92,-1.9976,-0.2723,-0.3153),
           c(-0.6283,-0.1065,0.428,-0.7777,-1.2939,-0.7796,0.012))
mc1 <- mutualCluster(x)
print(mc1)
}
\keyword{cluster}% at least one, from doc/KEYWORDS
