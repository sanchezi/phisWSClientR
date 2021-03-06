% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getEnvironmentData.R
\name{getEnvironmentData}
\alias{getEnvironmentData}
\title{getEnvironmentData}
\usage{
getEnvironmentData(token, variable = "", startDate = "",
  endDate = "", sensor = "", page = NULL, pageSize = NULL,
  dateSortAsc = TRUE, verbose = FALSE)
}
\arguments{
\item{token}{character, a token from \code{\link{getToken}} function}

\item{variable}{character, search by the uri of a variable. You can access the list of variables through the \code{\link{getVariables2}} function.}

\item{startDate}{character, search from start date (optional)}

\item{endDate}{character, search to end date (optional)}

\item{sensor}{character, search by the uri of a sensor (optional). You can access the list of sensors through the \code{\link{getSensors}} function.}

\item{page}{numeric, displayed page (pagination Plant Breeding API)}

\item{pageSize}{numeric, number of elements by page (pagination Plant Breeding API)}

\item{dateSortAsc}{logical, sort date in ascending order if TRUE}

\item{verbose}{logical, FALSE by default, if TRUE display information about the progress}
}
\value{
WSResponse object
}
\description{
retrieves the environmental data from a variable or a sensor
}
\details{
You have to execute the \code{\link{getToken}} function first to have access to the web
service
}
\examples{
\donttest{
 initializeClientConnection(apiID="ws_private", url = "www.opensilex.org/openSilexAPI/rest/")
 aToken = getToken("guest@opensilex.org","guest")
 # Retrieve the number of available data
 mycount <- getEnvironmentData(token=aToken$data, 
      variable = "http://www.opensilex.org/demo/id/variables/v004")$totalCount
 # Retrieve the environmental data
 myenvir <- getEnvironmentData(token=aToken$data, pageSize=mycount,
         variable = "http://www.opensilex.org/demo/id/variables/v004")
 myenvir <- getEnvironmentData(token=aToken$data,
  pageSize=mycount,
  variable = "http://www.opensilex.org/demo/id/variables/v004", 
 startDate="2017-06-15T10:51:00+0200",
 endDate="2017-06-17T10:51:00+0200")
 str(myenvir$data)
 head(myenvir$data)
}
}
\seealso{
http://docs.brapi.apiary.io/#introduction/url-structure
}
