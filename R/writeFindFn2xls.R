findFn2xls <- function(x,
    file. = paste(deparse(substitute(x)), 'xls', sep = '.'),
           csv, ...) {
  writeFindFn2xls(x, file. = file., csv = csv, ...)
}

writeFindFn2xls <- function(x,
    file. = paste(deparse(substitute(x)), 'xls', sep = '.'),
            csv, ...) {
##
## 1.  x not null?
##
  if(nrow(x) < 1) {
    cat('No matches;  nothing written.\n')
    return(invisible(''))
  }
##
## 2.  exists(file.)?
##
  if(file.exists(file.)) {
    file.remove(file.)
  }
##
## 3.  Prepare to write
##
  sum2 <- PackageSum2(x)
  sum2$Date <- as.character(as.Date(sum2$Date))
  cl <- data.frame(call=as.character(attr(x, 'call')),
                   stringsAsFactors=FALSE)
  x2 <- lapply(x, function(x)
               if(is.numeric(x)) x else as.character(x))
  x2. <- as.data.frame(x2, stringsAsFactors=FALSE)

#  df2x <- FALSE # not used ...??
#  WX <- FALSE
#  OB <- FALSE
##
## Don't write a file for CRAN 
##
  if(CRAN()){
    cat('write nothing on CRAN')
  } else {
##
## 4.  Will WriteXLS work?
##
      if(requireNamespace('WriteXLS', quietly=TRUE)){
        WX <- TRUE
        if(tP <- WriteXLS::testPerl()){
          WXo <- try(WriteXLS::WriteXLS(c('sum2', 'x2.', 'cl'),
                 ExcelFileName=file.,
                 SheetNames=c('PackageSum2', 'findFn', 'call') ))
          if(!inherits(WXo, 'try-error'))return(invisible(file.))
        }
      }
##
## 5.  How about RODBC?
##
     if(requireNamespace('RODBC', quietly=TRUE)){
        RO <- TRUE
        xlsFile <- try(RODBC::odbcConnectExcel(file., readOnly=FALSE))
        if(!inherits(xlsFile, 'try-error')){
          on.exit(try(RODBC::odbcClose(xlsFile))) 
#   Create the sheets
          sum2. <- try(RODBC::sqlSave(xlsFile, sum2, tablename='PackageSum2'))
          if(!inherits(sum2., 'try-error')){
            x. <- try(RODBC::sqlSave(xlsFile, as.data.frame(x2),
                                   tablename='findFn'))
#
            if(!inherits(x., 'try-error')){
              cl. <- try(RODBC::sqlSave(xlsFile, cl, tablename='call'))
              if(!inherits(cl., 'try=error'))return(invisible(file.))
            }
          }
        }
      }
##
## 6.  XLConnect?
##
## R 3.0.1:  works for 32-bit but not 64
#  if(require(XLConnect)){
# ** require(XLConnect) generated an error with 64-bit R 3.0.1
#    and I didn't test the rest of this code.
#    wb <- try(loadWorkbook(file.))
#    if(class(wb)!='try-error'){
#      cS1 <- try(createSheet(wb, 'PackageSum2'))
#      if(class(cS1)!='try-error'){
#        wW1 <- try(writeWorksheet(wb, sum2, 'PackageSum2'))
#        if(class(wW1)!='try-error'){
#          cS2 <- createSheet(wb, 'findFn')
#          wW2 <- writeWorksheet(wb, x2., 'findFn')
#          cS3 <- createSheet(wb, 'call')
#          wW3 <- writeWorksheet(wb, cl, 'call')
#          saveWorkbook(wb)
#          return(invisible(file.))
#        } else {
#          warning('created sheet using XLConnect but could not write to it')
#        }
#      } else {
#        warning(
#  'created workbook using XLConnect but could not create a sheet')
#      }
#    }
#  }
##
## 7.  Will dataframes2xls work?
##     -> DO NOT USE
##     This puts quotes around all the character strings
##
#  if(missing(csv) || !csv){
#    if(require(dataframes2xls)){
#      df2x <- TRUE
##      df.names <- 'sum2:::x2.:::cl'
## copy dataframe2xls namespace contents here
##      & reset environment of write.xls
#      here <- environment()
#      ns <- asNamespace("dataframes2xls")
#      for(nm in ls(ns)) here[[nm]] <- ns[[nm]]
##      wx <- write.xls
#      environment(write.xls) <- here
## dataframes2xls
## refuses to write \n
## and puts things in the wrong columns with ','
#      Sum2 <- lapply(x, function(x)
#                 if(is.numeric(x)) x else
#                 gsub('\n|,', ' ', as.character(x)))
#      Sum2. <- as.data.frame(Sum2, stringsAsFactors=FALSE)
#      x23 <- quote(c(Sum2., x2., cl))
#      DF2 <- do.call("write.xls", list(x23, file.,
#                 sh.names='PackageSum2:::findFn:::call') )
##      print(class(DF2))
#      if((class(DF2)!='try-error') &&
#         (file. %in% dir()))return(invisible(file.))
#    }
##
## 8.  Write warnings re. can't create xls file
##
    # dataframe2xls error msg
#    if(WX)if(tP)print(WXo)
 #   if(RO){
  #      if(class(xlsFile)!='try-error'){
   #       print(xlsClose)
    #    } else print(xlsFile)
    #}
    warning('\n*** UNABLE TO WRITE xls FILE;  writing 3 csv files instead.')
    xName <- deparse(substitute(x))
    assign(xName, x)
    file0 <- sub('\\.xls$', '', file.)
    saveFile <- paste(file0, 'rda', sep='.')
    do.call(save, list(list=xName, file=saveFile))
    cat('NOTE:  x = ', xName, ' saved to ', saveFile,
      '\nin case you want to try in, e.g., Rgui i386;\n',
      '> load(\"', saveFile, '\"); findFn2xls(', xName, ')\n',
      sep='')
#  }
##
## 9.  Write 3 csv files
##
   f.xls <- regexpr('\\.xls', file.)
   if(f.xls>0)file. <- substring(file., 1, f.xls-1)
#
   file3 <- paste(file., c('-sum.csv', '.csv', '-call.csv'), sep='')
   utils::write.csv(sum2, file3[1], ...)
#    utils::write.csv(x, file3[2], ...)
# On 2024-06-28:     
# Error in `[<-.data.frame`(`*tmp*`, needconv, 
#    value = list(Count = c("83",  : 
#    replacement element 1 has 526 rows, need 5264
# SG analysis: This appears to be a new bug in write.csv
# reported to r-devel with a couple of simple examples   
# The following seems to work   
    utils::write.csv(x2., file3[2], ...)
    utils::write.csv(cl, file3[3], ...)
  }
  return(invisible(file.))
}
