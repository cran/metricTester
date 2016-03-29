#' Run defined spatial simulations
#'
#' Given a prepared simulations.input object, will run all simulations defined in 
#' defineSimulations, and return a list of randomized CDMs.
#'
#' @param simulations.input A prepared simulations.input object, as generated by 
#' prepSimulations.
#' @param simulations Optional list of named spatial simulation functions to use. These
#' must be defined in the defineSimulations function. If invoked, this option will likely
#' be used to run a subset of the defined spatial simulations.
#' 
#' @details Currently we are running 3 spatial simulations. This function
#' first confirms that the input is of class simulations.input and, if so, then
#' confirms that the simulations are in a named list (via checkSimulations),
#' then lapplies all spatial simulation functions to the input object.
#'
#' @return A list of lists of simulation results, where each of the first-order elements
#' in the list relates to a unique simulation as defined in defineSimulations.
#'
#' @references Miller, E. T., D. R. Farine, and C. H. Trisos. 2015. Phylogenetic community
#' structure metrics and null models: a review with new methods and software.
#' bioRxiv 025726.
#'
#' @export
#'
#' @examples
#' tree <- geiger::sim.bdtree(b=0.1, d=0, stop="taxa", n=50)
#'
#' prepped <- prepSimulations(tree, arena.length=300, mean.log.individuals=2, 
#' length.parameter=5000, sd.parameter=50, max.distance=20, proportion.killed=0.2,
#' competition.iterations=3)
#'
#' #not run
#' results <- runSimulations(prepped)

runSimulations <- function(simulations.input, simulations)
{
	if(!inherits(simulations.input, "simulations.input"))
	{
		stop("Input needs to be of class 'simulations.input'")
	}

	#if a list of named simulations is not passed in, assign simulations to be NULL, in
	#which case all simulations will be run	
	if(missing(simulations))
	{
		simulations <- NULL
	}	
	
	simulations <- checkSimulations(simulations)
		
	results <- lapply(simulations, function(x) x(simulations.input))
	
	results
}