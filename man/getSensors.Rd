% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getSensors.R
\name{getSensors}
\alias{getSensors}
\title{getSensors}
\usage{
getSensors(token, uri = "", rdfType = "", label = "", brand = "",
  serialNumber = "", inServiceDate = "", dateOfPurchase = "",
  dateOfLastCalibration = "", personInCharge = "", page = NULL,
  pageSize = NULL, verbose = FALSE)
}
\arguments{
\item{token}{character, a token from \code{\link{getToken}} function}

\item{uri}{character, search by the uri of a sensor (optional)}

\item{rdfType}{character, search by the rdf type of a sensor (optional)}

\item{label}{character, search by the label of the measure (optional)}

\item{brand}{character, search by the brand of a sensor (optional)}

\item{serialNumber}{character, search by serialNumber of a sensor (optional)}

\item{inServiceDate}{character, search by the inServiceDate of a sensor (optional)}

\item{dateOfPurchase}{character, search by the date of purchase of a sensor (optional)}

\item{dateOfLastCalibration}{character, search by the date of last calibration of a sensor (optional)}

\item{personInCharge}{character, search by the person in charge of a sensor (optional)}

\item{page}{numeric, displayed page (pagination Plant Breeding API)}

\item{pageSize}{numeric, number of elements by page (pagination Plant Breeding API)}

\item{verbose}{logical, FALSE by default, if TRUE display information about the progress}
}
\value{
WSResponse object
}
\description{
Retrieves the sensors based on search criterion
}
\details{
You have to execute the \code{\link{getToken}} function first to have access to the web
service
}
\examples{
\donttest{
initializeClientConnection(apiID="ws_private", url = "www.opensilex.org/openSilexAPI/rest/")
aToken = getToken("guest@opensilex.org","guest")
sensors <- getSensors(aToken$data,
 uri = "http://www.opensilex.org/demo/2018/s18001")
sensors <- getSensors(aToken$data, brand = "Cimel")
sensors$data
}
}
\seealso{
http://docs.brapi.apiary.io/#introduction/url-structure
}
