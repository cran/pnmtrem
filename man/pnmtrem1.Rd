\name{pnmtrem1}
\alias{pnmtrem1}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Function to fit first-order Probit-Normal Marginalized Transition Random Effects Models, PNMTREM(1)
}
\description{
Fits PNMTREM(1) via maximum likelihood estimation with Fisher-Scoring Algorithm.
}
\usage{
pnmtrem1(covmat1, covmat2, respmat1, respmat2, z, nsubj, nresp, param01, 
param02, beta0, alpha0, tol1 = 1e-04, tol2 = 1e-04, maxiter1 = 50, 
maxiter2 = 50, tun1 = 1,tun2 = 1, x01 = 0, eps1 = 10^-10, x02 = 0, 
eps2 = 10^-10, silent = TRUE, delta.print = FALSE, deltastar.print = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{covmat1}{
a \eqn{(p_1+1) \times N \times k} matrix or data frame, which has the design matrix form, for the baseline time point \eqn{(t=1)}. Here, \eqn{p_1} is the number of independent variables included in the baseline model, \eqn{N} is the number of subjects and \eqn{k} is the number of multiple responses.
}
  \item{covmat2}{
a \eqn{(p_2+1) \times N \times k \times (T-1)} matrix or data frame, which has the design matrix form, for \eqn{t \geq 2}. Here, \eqn{p_2} is the number of independent variables included in the \eqn{t \geq 2} model, \eqn{N} is the number of subjects, \eqn{k} is the number of multiple responses and \eqn{T} is the number of repeated measurements per subject.

}
  \item{respmat1}{
an \eqn{(N * k) \times 1} matrix or data frame for the multiple responses at baseline. The general form of it can be depicted as \eqn{\mbox{Respmat}_{1}}=(\eqn{Y_{.11}, \ldots, Y_{.1k})^T} where \eqn{Y_{.1j}=(Y_{11j}, \ldots, Y_{N1j})}.
}
  \item{respmat2}{
an \eqn{(N * k * T) \times 1} matrix or data frame for the multiple responses for \eqn{t \geq 1}. The general form of it can be illustrated as
 
\eqn{\mbox{Respmat}_{2}=(Y_{.11}, \ldots, Y_{.1k}, \ldots, Y_{.T1}, \ldots, Y_{.Tk})^T} where \eqn{Y_{.tj}=(Y_{1tj}, \ldots, Y_{Ntj})}.
}
  \item{z}{
a \eqn{(p_3+1) \times N \times k \times (T-1)} matrix or data frame to be included in the second level of the \eqn{t \geq 2} model. \code{z} typically includes a subset of covariates.
}
  \item{nsubj}{
an integer which defines the number of subjects in the study.
}
  \item{nresp}{
an integer which defines the number of multiple binary responses.
}
  \item{param01}{
a length of \eqn{[(p_1+1)+(k-1)+1]} vector where \eqn{p_1} is the number of covariates included in the baseline model and \eqn{k} is number of multiple responses. \code{param01} is used to start the Fisher-Scoring (FS) algorithm for the baseline model. The general form of it can be given as \eqn{\mbox{param01}=(\beta^*, \lambda_j^*, c_1)}, where \eqn{j=2,\ldots,k} and \eqn{c_1}=log(\eqn{\sigma_1}).
}
  \item{param02}{
a length of \eqn{[(p_2+1)+(p_3+1)*(T-1)+(k-1)+(T-1)]} vector where \eqn{p_2} is the number of covariates included in the first level of \eqn{t \geq 2} model, \eqn{p_3} is the number of covariates included in the second level of it, \eqn{k} is the number of multiple responses and \eqn{T} is the number of repeated measurements per subject. \code{param02} is used to start the FS algorithm for the \eqn{t \geq 2} model. The general form of it can be given as \eqn{\mbox{param02}=(\beta,\alpha_{t,1},\lambda_j, c_t)}, where \eqn{\alpha_{t,1}=(\alpha_{21,1}, \ldots, \alpha_{2p3,1}, \ldots, \alpha_{T1,1}, \ldots, \alpha_{Tp3,1})} and \eqn{j=2,\ldots, k} and \eqn{t=2, \ldots, T} and \eqn{c_t=log(\sigma_t)}.
}
  \item{beta0}{
a \eqn{(p_2+1) \times 1} matrix for which all the elements are set to 0. It corresponds to the \eqn{\beta_0} component of the Implicit Function Theorem (IFT) point, \eqn{P_0}.
}
  \item{alpha0}{
a \eqn{(p_3+1) \times (T-1)} matrix for which all the elements are set to 0. It corresponds to the \eqn{\alpha_{t,10}} component of the \eqn{P_0}.
}
  \item{tol1}{
the amount of tolerance for the convergence of the FS algorithm for baseline model. The default is set to 0.0001.
}
  \item{tol2}{
the amount of tolerance for the convergence of the FS algorithm for \eqn{t \geq 2} model. The default is set to 0.0001.
}
  \item{maxiter1}{
the maximum number of iterations expected to be consumed by the FS algorithm for baseline model. The default is set to 50.
}
  \item{maxiter2}{
the maximum number of iterations expected to be consumed by the FS algorithm for \eqn{t \geq 2} model. The default is set to 50.
}
  \item{tun1}{
the tuning parameter for baseline model need to be chosen preferably as integer to decrease the FS steps in each iteration in cases where the algorithm might miss the convergence of the parameters. The default is set to 1.
}
  \item{tun2}{
the tuning parameter for \eqn{t \geq 2} model to decrease the FS steps in each iteration as in the case of \code{tun1}. The default is set to 1.
}
  \item{x01}{
an integer defined for the initial values of the Newton-Raphson (N-R) algorithm to obtain \eqn{\Delta_{i2j0}}. The default is set to 0.
}
  \item{eps1}{
the amount of tolerance for the convergence of N-R algorithm to obtain \eqn{\Delta_{i2j0}}. The default is set to \eqn{10^{-10}}.
}
  \item{x02}{
an integer defined for the initial values of the Newton-Raphson (N-R) algorithm to obtain the empirical Bayesian estimates of the individual characteristics, \eqn{\hat{z}_i}. The default is set to 0.
}
  \item{eps2}{
the tolerance defined for the convergence of N-R algorithm to obtain \eqn{\hat{z}_i}. The default is set to \eqn{10^{-10}}.
}
  \item{silent}{
a logical statement to decide whether the details of the FS algorithm details for both the baseline and t \eqn{\geq} 2 models to be printed. The default is set to TRUE which means not printing these details.
}
  \item{delta.print}{
a logical statement to decide the print of the estimates of \eqn{\Delta_{itj}} where \eqn{t=2, \ldots, T} together with the modeling outputs. The default is set to FALSE which means not printing these estimates.}
  \item{deltastar.print}{
a logical statement to decide the print of the estimates of \eqn{\Delta_{itj}^*} where \eqn{t=1, \ldots, T} together with the modeling outputs. The default is set to FALSE which means not printing these estimates.
}
}
\details{
The modeling framework assumes two different models: 1) a model for baseline time point (baseline model), a two-level one, and 2) a model for later time points (\eqn{t \geq 2} model), a three-level one. These two models are linked to each other via a marginal constraint equation. Both of them are marginalized models and capture marginal effect of independent variables on the mean responses in their first levels. While the former captures the multivariate response dependence in its second level, the latter captures this dependence in its third level. Furthermore, the \eqn{t \geq 2} model captures the serial dependence in its second level. Implicit function theorem, specifically first-order implicit differentiation was used to explicitly link first and second level of the \eqn{t \geq 2} model. All the integrals are approximated via 20-point Gauss-Hermite Qudratures. Logarithm of the standard deviation parameters of random effects distributions are modeled. A detailed example in terms of data preparation, initial obtaining and setting is provided below.
}
\value{
\code{pnmtrem1} returns the modeling output of baseline and \eqn{t \geq 2} models and the associated maximized log-likelihood values. Additionally, it automatically prints the empirical Bayesian estimates of the individual characteristics, \eqn{\hat{z}_i}. The order of these estimates are in subject order. The estimates of \eqn{\Delta_{itj}} (for \eqn{t=2,..., T}) and \eqn{\Delta_{itj}^*} (for \eqn{t=1,...,T}) are in the same order of the responses and covariates. 
}
\references{
Asar, O., Ilk, O., Sezer, A. D. (2013). A marginalized multilevel model for analyzing multivariate longitudinal binary data. Submitted.
}
\author{
Ozgur Asar, Ozlem Ilk
}
\note{
Version 1.3.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%\seealso{
%\code{\link{mmm2}}
%}
\examples{
\dontrun{
## loading a simulated bivariate longitudinal binary data with 500 subjects
## and 4 time points
data(pnmtrem1.sim.data1)
data(pnmtrem1.sim.data2)

## number of subjects, multiple responses and time points
nsubj<-500
nresp<-2
ntime<-4

## sepearating the portion of data which pnmtrem1 function will use
covmat1<-as.matrix(pnmtrem1.sim.data1[,5:6])
covmat<-as.matrix(pnmtrem1.sim.data2[,5:7])
mresp1<-as.matrix(pnmtrem1.sim.data1[,4])
mresp<-as.matrix(c(pnmtrem1.sim.data1[,4],pnmtrem1.sim.data2[,4]))

## obtaining initials for \beta^*
glm1<-glm(mresp1~-1+covmat1,family=binomial(link=probit))
bsinit<-glm1$coef;names(bsinit)<-NULL

## initials for parameters in the baseline model, i.e. \beta^*, \lambda^*, c_1
param01<-c(bsinit,1,log(0.5))

## obtaining initials of \beta
# preparing data to be analyzed by mmm2
mresp.mmm<-as.matrix(pnmtrem1.sim.data2[,4])
id<-as.matrix(rep(seq(1:nsubj),((ntime-1)*nresp)))
time<-as.matrix(c(rep(2,nsubj*nresp),rep(3,nsubj*nresp),rep(4,nsubj*nresp)))
data<-cbind(id,time,mresp.mmm,covmat)

# ordering data by subject ID
data2<-NULL
for (i in 1:nsubj){
data.id<-data[data[,1]==i,]
data2<-rbind(data2,data.id)
}
# subsetting data by response type (6th column of data2)
data.resp1<-data2[data2[,6]==1,]
data.resp2<-data2[data2[,6]==0,]
data.mmm<-cbind(data.resp1[,1],data.resp1[,3],data.resp2[,3],data.resp1[,5])
library(mmm2)
mmm2.fit<-mmm2(data=data.mmm,nresp=2,family=binomial(link=probit),
corstr = "exchangeable")
binit<-coef(mmm2.fit)

## obtaining initials of \alpha
glm3<-glm(mresp[(nsubj*nresp+1):(2*nsubj*nresp),]~-1+mresp1,family=binomial(link=probit))
glm4<-glm(mresp[(2*nsubj*nresp+1):(3*nsubj*nresp),]~-1+
mresp[(nsubj*nresp+1):(2*nsubj*nresp),],family=binomial(link=probit))
glm5<-glm(mresp[(3*nsubj*nresp+1):(4*nsubj*nresp),]~-1+
mresp[(2*nsubj*nresp+1):(3*nsubj*nresp),],family=binomial(link=probit))
alpinit<-c(glm3$coef[1],glm4$coef[1],glm5$coef[1]);names(alpinit)<-NULL

## initials for parameters in the t \geq 2 model, i.e. \beta, \alpha, \lambda, c_2, c_3, c_4
param02<-c(binit,alpinit,1,log(0.5),log(0.5),log(0.5))

## implicit function initials, \beta_0 and \alpha_0
beta0<-matrix(c(0,0,0),ncol=1)
alpha0<-matrix(c(0,0,0),ncol=1)

## covariate set to be interacted with the response history
z<-matrix(rep(1,3*nsubj*nresp),ncol=1)

fit<-pnmtrem1(covmat1=covmat1,covmat2=covmat,respmat1=mresp1,respmat2=mresp,z=z,
nsubj=500,nresp=2,param01=param01,param02=param02,beta0=beta0,alpha0=alpha0,
tol1=0.0001,tol2=0.0001,maxiter1=50,maxiter2=50,tun1=1,tun2=1,x01=0,eps1=10^-10,
x02=0,eps2=10^-10,silent=FALSE,delta.print=TRUE,deltastar.print=TRUE)

## manipulation of the output
fit
fit$output1
fit$maxloglik1
fit$output2
fit$maxloglik2
fit$delta
fit$delstar
fit$empbayes}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ multivariate longitudinal binary data }
\keyword{ marginalized models }% __ONLY ONE__ keyword per line
