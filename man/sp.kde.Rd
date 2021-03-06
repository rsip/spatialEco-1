% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sp.kde.R
\name{sp.kde}
\alias{sp.kde}
\title{Spatial kernel density estimate}
\usage{
sp.kde(x, y, bw, newdata, n, standardize = FALSE, scale.factor)
}
\arguments{
\item{x}{sp SpatialPointsDataFrame object}

\item{y}{Optional values, associated with x coordinates, to be used as weights}

\item{bw}{Distance bandwidth of Gaussian Kernel, must be units of projection}

\item{newdata}{A Rasterlayer, any sp class object or c[xmin,xmax,ymin,ymax] vector to estimate the kde extent}

\item{n}{Number of cells used in creating grid. If not defined a value based on extent or existing raster will be used}

\item{standardize}{Standardize results to 0-1 (FALSE/TRUE)}

\item{scale.factor}{Optional numeric scaling factor for the KDE (eg., 10000), to account for small estimate values}
}
\value{
Raster class object containing kernel density estimate
}
\description{
A weighted or unweighted Gaussian Kernel Density estimate for spatial data
}
\examples{
\dontrun{ 
 library(sp)
   data(meuse)
   coordinates(meuse) <- ~x+y
 
 # Weighted KDE using cadmium and spatial locations 
 cadmium.kde <- sp.kde(x = meuse, y = meuse$cadmium, bw = 1000, n = 5000, 
                       standardize = TRUE, scale.factor = 10000  )
 				
 # Unweighted KDE (spatial locations only)				
 pt.kde <- sp.kde(x = meuse, bw = 1000, standardize = TRUE, n = 5000, 
                  scale.factor = 10000  )
 
 # Plot results
 par(mfrow=c(1,2))
   plot(cadmium.kde, main="weighted kde")
     points(meuse, pch=20, col="red")
   plot(pt.kde, main="Unweighted kde")
     points(meuse, pch=20, col="red") 
 
 # Using existing raster
 library(raster)
 data(meuse.grid)
 coordinates(meuse.grid) = ~x+y
 proj4string(meuse.grid) <- CRS("+init=epsg:28992")
 gridded(meuse.grid) = TRUE
 meuse.grid <- raster(meuse.grid)
 
 cadmium.kde <- sp.kde(x = meuse, y = meuse$cadmium, newdata = meuse.grid, bw = 1000, 
                       standardize = TRUE, scale.factor = 10000  )
   plot(cadmium.kde, main="weighted kde")
     points(meuse, pch=20, cex=0.5, col="red")
}

}
\author{
Jeffrey S. Evans  <jeffrey_evans@tnc.org>
}
