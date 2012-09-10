\name{pnmtrem1.sim.data1}
\alias{pnmtrem1.sim.data1}
\docType{data}
\title{
A portion of a simulated dataset, for the baseline time point (t=1), from a first-order Probit-Normal Marginalized Transition Random Effects Models for 500 subjects with 4 follow-ups
}
\description{
The dataset includes randomly generated bivariate longitudinal binary responses and an associated covariate which has a standard uniform distribution, U(0,1). The assumed parameters to generate the data are: \eqn{\beta^*=(\beta_0^*, \beta_1^*) = (-1, 1.9)}, \eqn{\lambda_j^=(\lambda_1^*, \lambda_2^*)=(1, 1.07)} and \eqn{b_{i1} \sim N(0,\sigma_1^2)}, \eqn{\sigma_1=0.7}. It is assumed that there are 500 subjects. The data include no missing value.
}
\usage{data(pnmtrem1.sim.data1)}
\format{
  A data frame with 1000 observations on the following 6 variables.
  \describe{
    \item{\code{time}}{a numeric vector for the time information at which data is available}
    \item{\code{response}}{a numeric vector with the response information for which data is available}
    \item{\code{subject}}{a numeric vector for subject id}
    \item{\code{y}}{a numeric vector for bivariate longitudinal binary responses}
    \item{\code{ones}}{a numeric vector for which all the elements are 1}
    \item{\code{x}}{a numeric vector for the covariate}
  }
}
\details{
When one carefully investigates the \code{time}, \code{response} and \code{subject} orders, s/he can easily understand the data structure which the model accepts. Baseline and later time points of the data may include different number of independent variables. Therefore, datasets for \eqn{t=1} and \eqn{t \geq 2} are presented in different data objects, \code{pnmtrem1.sim.data1} and \code{pnmtrem1.sim.data2}, respectively.
}
%\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
%}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\examples{
data(pnmtrem1.sim.data1)
head(pnmtrem1.sim.data1)
str(pnmtrem1.sim.data1)
}
\keyword{datasets}
