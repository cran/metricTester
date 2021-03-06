% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pscCorr.R
\name{pscCorr}
\alias{pscCorr}
\title{Calculate corrected PSC}
\usage{
pscCorr(samp, tree)
}
\arguments{
\item{samp}{A picante-style community data matrix with sites as rows, and
species as columns}

\item{tree}{Phylo object}
}
\value{
A data frame of correctly calculated PSC values, with associated species
richness and name of all communities in input cdm
}
\description{
Given a phylo object and a picante-style community data matrix (sites are rows,
species are columns), calculated corrected phylogenetic species clustering
}
\details{
Returns the inverse of psc as defined in picante
}
\examples{
#simulate tree with birth-death process
tree <- geiger::sim.bdtree(b=0.1, d=0, stop="taxa", n=50)

sim.abundances <- round(rlnorm(5000, meanlog=2, sdlog=1)) + 1

cdm <- simulateComm(tree, richness.vector=10:25, abundances=sim.abundances)

results <- pscCorr(samp=cdm, tree=tree)
}
\references{
Helmus, M.R., T.J. Bland, C.K. Williams, & A.R. Ives. 2007. Phylogenetic
measures of biodiversity. The American Naturalist. 169:E69-E83.
}
