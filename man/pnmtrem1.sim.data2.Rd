\name{pnmtrem1.sim.data2}
\alias{pnmtrem1.sim.data2}
\docType{data}
\title{
A portion of a simulated dataset, for t \eqn{\geq} 2 period, from a first-order Probit-Normal Marginalized Transition Random Effects Models for 500 subjects with 4 follow-ups
}
\description{
The dataset includes bivariate longitudinal binary responses and two associated covariates. The first covariate, X1 is a time-independent one which means it takes same values at t=1, 2, 3, 4. For the details of X1, see \code{pnmtrem1.sim.data1}. The second covariate, X2 is a response type indicator variable which takes 1 for the first response, and takes 0 for the second one. The assumed parameters to generate the data are: \eqn{\beta=(\beta_0, \beta_1, \beta_2) = (-1, 2, 0.2)}, \eqn{\alpha_{t,1}=(\alpha_{21,1}, \alpha_{31,1}, \alpha_{41,1})= (0.5, 0.7, 0.9)}, \eqn{\lambda_j=(\lambda_1, \lambda_2)=(1, 1.05)} and \eqn{b_{it} \sim N(0,\sigma_t^2)}, \eqn{\sigma_t=(\sigma_2, \sigma_3, \sigma_4)=(0.66, 0.63, 0.60)}. It is assumed that there 500 subjects. The dataset has no missing value.
}
\usage{data(pnmtrem1.sim.data2)}
\format{
  A data frame with 3000 observations on the following 7 variables.
  \describe{
  \item{\code{time}}{a numeric vector for the time information at which data is available}
    \item{\code{response}}{a numeric vector with the response information for which data is available}
    \item{\code{subject}}{a numeric vector for subject id}
    \item{\code{y}}{a numeric vector for bivariate longitudinal binary responses}
    \item{\code{ones}}{a numeric vector for which all the elements are 1}
    \item{\code{x1}}{a numeric vector for the first covariate, X1}
    \item{\code{x2}}{a numeric vector for the second covariate, X2}
  }
}
\details{
When one carefully investigates the \code{time}, \code{response} and \code{subject} orders, s/he can easily understand the data structure which the model accepts. Baseline and later time points of the data may include different number of independent variables. Therefore, datasets for \eqn{t=1} and \eqn{t \geq 2} are presented in different data objects, \code{pnmtrem1.sim.data1} and \code{pnmtrem1.sim.data2}, respectively.
}
%\source{
%%  ~~ reference to a publication or URL from which the data were %obtained ~~
%}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\examples{
data(pnmtrem1.sim.data2)
head(pnmtrem1.sim.data2)
str(pnmtrem1.sim.data2)
}
\keyword{datasets}
