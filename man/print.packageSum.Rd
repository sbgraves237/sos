\name{print.packageSum}
\alias{print.packageSum}
\title{
  print a packageSum object
}
\description{
  Print a \code{packageSum} object to a file and 
  pass it to a web browser
}
\usage{
\method{print}{packageSum}(x, where, title, 
    openBrowser = TRUE, template, ...)
}
\arguments{
  \item{x}{
    An object of class \code{packageSum}
  }
  \item{where}{
    a character vector interpreted as follows:

    If \code{length(where)==1}, it must be either
    'HTML' or 'console' or the name of a column of
    \code{x} or the name of a file to hold the file
    created to be displayed in a web browser.

    If \code{length(where)>1}, it must be the names 
    of columns of 
    \code{x} to be displayed on the console.  If 
    \code{where} is a vector of names of columns of 
    \code{x}, those columns will be printed to the 
    console, and there will be no display in a web
    browser.
    If \code{where} == 'console', the following
    columns of
    \code{x} are displayed:  
    \code{c('Count', 'maxScore', 'totalScore', 'Package', 'Date')}.
  }
  \item{title}{
    An optional title to give the HTML file. 
    Default is to use the original query string.
  }
  \item{openBrowser}{
    logical; if \code{TRUE} and \code{where} is 
    missing or 'HTML', launch default browser 
    after building table
  }
  \item{template}{
    Template file used by \code{brew}
  }
  \item{\dots}{ignored}
}
%\details{ more later}
\value{
  The full path and name of the file created is
  returned invisibly.
}
\author{
  Spencer Graves
}
\seealso{
  \code{\link{print.findFn}}
  \code{\link{packageSum}}
  \code{\link{findFn}},
  \code{\link[utils]{RSiteSearch}},
  \code{\link[utils]{browseURL}}
  \code{\link[brew]{brew}}
}
\examples{
splineHelp <- try(findFn("spline", maxPages = 2))

if(!inherits(splineHelp, 'try-error')){
splinePkgs <- packageSum(splineHelp)
if(!CRAN()){
  print(splinePkgs, 'console')
  splinePkgs # all columns in a browser

  des1 <- try(findFn('differential equations', 1))
  de1 <- try(findFn('differential equation', 1))
# each retrieves 1 page of 20 hits
# but not the same 20

  if(!(inherits(des1, 'try-error') ||
       inherits(de1, 'try-error'))){
  de.s <- unionFindFn(des1, de1)
  de.s
# Other example:  
  webScr <- try(findFn('web scraping'))
  if(!inherits(webScr, 'try-error')){
  pS <- packageSum(webScr)
  print(pS)
}
}
}
}
}
\keyword{print}
\keyword{methods}

