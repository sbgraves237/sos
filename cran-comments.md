2021-05-22:  
## sos 2.1-5
* 3 of 13 CRAN checks report a LaTeX error in the vignette sos.Rnw that has been in the package since that vignette was published in R Journal 1(2), 2009-12.  I am unable to replicate that error.  I cannot see what I should change in that vignette, and I do not want to change code outside this vignette, because doing so could break something else.  
* Another 4 CRAN checks report, "The following object is masked from 'package:utils': ?"  This has been with the package since 2009.  I don't know how to fix it.  
* I think I've fixed two other problems reported by Prof. Ripley:  
*(1) I've wrapped all Internet accesses in help files in "try", so any attempt to access the Internet should no generate an error.  
*(2) I think I removed 'options(repos=c(CRAN="http://cran.cnr.berkeley.edu"))'.  I cannot find it now with grep.  If it's still there, I may need help finding it.  


2021-03-29 / 31:
## sos 2.1-4 
## Test environments:
* local macOS 11.6.5, R 4.1.3: no errors, warning, notes
* GitHub Actions
*- windows, macOS, ubuntu (release): Check
*- ubuntu (devel): no package called ‘rcmdcheck’: 
* ---> Isn't this a problem with ubuntu (devel), not with sos? 
* R-hub builder: OK
* Winbuilder on R-release, R-oldrelease, and R-devel all OK
* revdepcheck checked 4 dependencies, all 4 OK. 

2021-09-06 
## Test environments
* local macOS 11.5.2, R 4.1.1 

???
* All 4 GitHub Actions:  
*    R 4.1.0 on Win10, Mac & Ubuntu 20.04 
*    plus R-devel on Ubuntu 20.04
* Winbuilder:  R-release, R-devel, R-oldrelease
* R-hub: Windows Server 2008 R2 SP1, R-devel, 32/64 bit: 

2021-06-14
## Test environments
* local macOS 11.4, R 4.1.0 
* All 4 GitHub Actions:  
*    R 4.1.0 on Win10, Mac & Ubuntu 20.04 
*    plus R-devel on Ubuntu 20.04
* Winbuilder:  R-release, R-devel, R-oldrelease
* R-hub: Windows Server 2008 R2 SP1, R-devel, 32/64 bit: 

##  NO ERRORS OR WARNINGS.  

* R-hub: 
*    Debian Linux, R-devel, GCC, 
*    Ubuntu Linux 20.04.1 LTS, R-release, GCC
*    Fedora Linux, R-devel, clang, gfortran
## NOTE: Package unavailable to check Rd xrefs: ‘testthat’

## revdepcheck: 0 new problems
## checked 3 of 4 reverse dependencies; 
## Failed to check RcmdrPlugin.sos (NA)
