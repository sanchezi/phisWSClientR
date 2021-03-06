#-------------------------------------------------------------------------------
# Program: getPhenotypeData.R
# Objective: functions to get the phenotypes service from WS2
#            * getPhenotypeData
# Authors: Hollebecq Jean-Eudes
# Creation: 21/01/2019
# Update: 01/02/2019 (by J-E.Hollebecq) ; 24/01/2019 (by I.Sanchez)
#-------------------------------------------------------------------------------

##' @title getPhenotypeData
##'
##' @description Retrieves the phenotype measures data from a variable, an experiment or a sensor
##' @param token character, a token from \code{\link{getToken}} function
##' @param variable character, search by the uri of a variable (optional). You can access the list of variables through \code{\link{getVariables2}} function.
##' @param experiment character, search by the uri of an experiment (optional). You can access the list of experiments through \code{\link{getExperiments}} function.
##' @param scientificObject character, search by the uri of an scientific object (optional). You can access the list of scientific objects through \code{\link{getScientificObjects}} function.
##' @param startDate character, search from start date (optional)
##' @param endDate character, search to end date (optional)
##' @param sensor character, search by the uri of a sensor (optional). you can access the list of sensors through the \code{\link{getSensors}} function.
##' @param incertitude character, search by incertitude ???????????????????? (optional)
##' @param page numeric, displayed page (pagination Plant Breeding API)
##' @param pageSize numeric, number of elements by page (pagination Plant Breeding API)
##' @param verbose logical, FALSE by default, if TRUE display information about the progress
##' @return WSResponse object
##' @seealso http://docs.brapi.apiary.io/#introduction/url-structure
##' @details You have to execute the \code{\link{getToken}} function first to have access to the web
##' service
##' @examples
##' \donttest{
##'  initializeClientConnection(apiID="ws_private", url = "www.opensilex.org/openSilexAPI/rest/")
##'  aToken = getToken("guest@opensilex.org","guest")
##'  phenodata <- getPhenotypeData(aToken$data,
##'   variable = "http://www.opensilex.org/demo/id/variables/v001")
##'  phenodata <- getPhenotypeData(aToken$data,
##'   variable = "http://www.opensilex.org/demo/id/variables/v001",
##'    startDate="2017-06-16", endDate="2017-07-16")
##'  phenodata$data
##' }
##' @export
getPhenotypeData <- function(token,
                             variable = "",
                             experiment = "",
                             scientificObject = "",
                             startDate = "",
                             endDate = "",
                             sensor = "",
                             incertitude = "",
                             page = NULL,
                             pageSize = NULL,
                             verbose = FALSE){
  if (is.null(page)) page <- get("DEFAULT_PAGE",configWS)
  if (is.null(pageSize)) pageSize <- get("DEFAULT_PAGESIZE",configWS)
  
  attributes <- list(pageSize=pageSize,
                     page = page,
                     Authorization=token)
  if (experiment!="")        attributes <- c(attributes, experiment = experiment)
  if (variable!="")          attributes <- c(attributes, variable = variable)
  if (scientificObject!="")  attributes <- c(attributes, scientificObject = scientificObject)
  if (startDate!="")         attributes <- c(attributes, startDate = startDate)
  if (endDate!="")           attributes <- c(attributes, endDate = endDate)
  if (sensor!="")            attributes <- c(attributes, sensor = sensor)
  if (incertitude!="")       attributes <- c(attributes, incertitude = incertitude)
  
  variableResponse <- getResponseFromWS2(resource = paste0(get("DATASETS", configWS)),
                                         attributes = attributes,
                                         verbose = verbose)
  outputData <- data.frame()
  jsonData <- data.frame(variableResponse$data[[1]])
  AO=jsonData$agronomicalObject
  for(l in 1:length(jsonData$data)){
    scientificObject <- AO[l]
    tmp_dat <- jsonData$data[[l]]
    AOl <- data.frame(scientificObject=scientificObject, tmp_dat)
    outputData=rbind(outputData, AOl)
  }
  variableResponse$data <- outputData
  return(variableResponse)
}