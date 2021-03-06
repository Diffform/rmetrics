\name{gig-distribution}
\alias{dgig}
\alias{pgig}
\alias{qgig}
\alias{ESgig}
\alias{rgig}
\alias{Egig}
% <---------------------------------------------------------------------->
\title{The Generalized Inverse Gaussian Distribution}
% <---------------------------------------------------------------------->
\description{

  Density, distribution function, quantile function, random generation,
  expected shortfall and expected value and variance for the generalized
  inverse gaussian distribution.

}
% <---------------------------------------------------------------------->
\usage{
dgig(x, lambda = 1, chi = 1, psi = 1, logvalue = FALSE)

pgig(q, lambda = 1, chi = 1, psi = 1, ...)

qgig(p, lambda = 1, chi = 1, psi = 1, method = c("integration", "splines"),
     spline.points = 200, subdivisions = 200,
     root.tol = .Machine$double.eps^0.5,
     rel.tol = root.tol^1.5, abs.tol = rel.tol, ...)

rgig(n = 10, lambda = 1, chi = 1, psi = 1)

ESgig(alpha, lambda = 1, chi = 1, psi = 1, distr = c("return", "loss"), ...)

Egig(lambda, chi, psi, func = c("x", "logx", "1/x", "var"), check.pars = TRUE)

}
% <---------------------------------------------------------------------->
\arguments{
  \item{x}{A vector of quantiles.}
  \item{q}{A vector of quantiles.}
  \item{p}{A vector of probabilities.}
  \item{alpha}{A vector of confidence levels.}
  \item{n}{Number of observations.}
  \item{lambda}{A shape and scale and parameter.}
  \item{chi, psi}{Shape and scale parameters. Must be positive.}
  \item{logvalue}{If \code{TRUE} the logarithm of the density will be returned.}
  \item{distr}{Whether the ghyp-object specifies a return or a loss-distribution (see \bold{Details}).}
  \item{subdivisions}{The number of subdivisions passed to \code{\link{integrate}} when computing
                      the the distribution function \code{pgig}.}
  \item{rel.tol}{The relative accuracy requested from  \code{\link{integrate}}.}
  \item{abs.tol}{The absolute accuracy requested from  \code{\link{integrate}}.}
  \item{method}{Determines which method is used when calculating quantiles.}
  \item{spline.points}{The number of support points when computing the quantiles with the method
                       \dQuote{splines} instead of \dQuote{integration}.}
  \item{root.tol}{The tolerance of \code{\link{uniroot}}.}
  \item{func}{The transformation function when computing the expected value.
             \code{x} is the expected value (default), \code{log x} returns the
             expected value of the logarithm of \code{x}, \code{1/x} returns the
             expected value of the inverse of \code{x} and \code{var} returns the
             variance.}
  \item{check.pars}{If \code{TRUE} the parameters are checked first.}
  \item{\dots}{Arguments passed form \code{ESgig} to \code{qgig}.}
}
% <---------------------------------------------------------------------->
\details{

   \code{qgig} computes the quantiles either by using the
   \dQuote{integration} method where the root of the distribution
   function is solved or via \dQuote{splines} which interpolates the
   distribution function and solves it with \code{\link{uniroot}}
   afterwards. The \dQuote{integration} method is recommended when few
   quantiles are required. If more than approximately 20 quantiles are
   needed to be calculated the \dQuote{splines} method becomes faster.
   The accuracy can be controlled with an adequate setting of the
   parameters \code{rel.tol}, \code{abs.tol}, \code{root.tol} and
   \code{spline.points}. \cr

   \code{rgig} relies on the C function with the same name kindly
   provided by Ester Pantaleo and Robert B. Gramacy. \cr

   \code{Egig} with \code{func = "log x"} uses
   \code{\link[numDeriv]{grad}} from the \R package \emph{numDeriv}. See
   the package vignette for details regarding the expectation of GIG
   random variables.

}
% <---------------------------------------------------------------------->
\value{
  \code{dgig} gives the density, \cr
  \code{pgig} gives the distribution function, \cr
  \code{qgig} gives the quantile function, \cr
  \code{ESgig} gives the expected shortfall,  \cr
  \code{rgig} generates random deviates and \cr
  \code{Egig} gives the expected value
  of either \code{x}, \code{1/x}, \code{log(x)} or the variance if \code{func} equals \code{var}.
}
% <---------------------------------------------------------------------->
\references{

  Dagpunar, J.S. (1989). \emph{An easily implemented generalised inverse
  Gaussian generator.} Commun. Statist. -Simula., \bold{18}, 703--710.

  Michael, J. R, Schucany, W. R, Haas, R, W. (1976).  \emph{Generating
  random variates using transformations with multiple roots}, The
  American Statistican, \bold{30}, 88--90.

}
% <---------------------------------------------------------------------->
\author{David Luethi and Ester Pantaleo}
% <---------------------------------------------------------------------->
\seealso{\code{\link{fit.ghypuv}}, \code{\link{fit.ghypmv}}, \code{\link{integrate}},
         \code{\link{uniroot}}, \code{\link{spline}}}
% <---------------------------------------------------------------------->
\examples{
dgig(1:40, lambda = 10, chi = 1, psi = 1)
qgig(1e-5, lambda = 10, chi = 1, psi = 1)

ESgig(c(0.19,0.3), lambda = 10, chi = 1, psi = 1, distr = "loss")
ESgig(alpha=c(0.19,0.3), lambda = 10, chi = 1, psi = 1, distr = "ret")

Egig(lambda = 10, chi = 1, psi = 1, func = "x")
Egig(lambda = 10, chi = 1, psi = 1, func = "var")
Egig(lambda = 10, chi = 1, psi = 1, func = "1/x")
}
% <---------------------------------------------------------------------->
\keyword{distribution}
\keyword{datagen}
