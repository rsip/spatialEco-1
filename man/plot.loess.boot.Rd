% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot.loess.boot.R
\name{plot.loess.boot}
\alias{plot.loess.boot}
\title{Plot Loess Bootstrap}
\usage{
\method{plot}{loess.boot}(x, ...)
}
\arguments{
\item{x}{A loess.boot object}

\item{...}{Additional arguments passed to plot}
}
\description{
Plot function for loess.boot object
}
\examples{
 n=1000
 x <- seq(0, 4, length.out=n)	 
 y <- sin(2*x)+ 0.5*x + rnorm(n, sd=0.5)
 sb <- loess.boot(x, y, nreps = 99, confidence = 0.90, span = 0.40)
 plot(sb)
                   
}
\references{
Cleveland, WS, (1979) Robust Locally Weighted Regression and Smoothing Plots Journal of the American Statistical Association 74:829-836

Efron, B., and R. Tibshirani (1993) An Introduction to the Bootstrap Chapman and Hall, New York

Hardle, W., (1989) Applied Nonparametric Regression Cambridge University Press, NY.

Tibshirani, R. (1988) Variance stabilization and the bootstrap. Biometrika 75(3):433-44.
}
\author{
Jeffrey S. Evans  <jeffrey_evans@tnc.org>
}
