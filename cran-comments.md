2021-03-29
## sos 2.1-4 
## Test environments:
* local macOS 11.6.5, R 4.1.3: no errors, warning, notes
* GitHub Actions
*- windows, macOS, ubuntu (release): Check
*- ubuntu (devel): no package called ‘rcmdcheck’: 
* ---> Isn't this a problem with ubuntu (devel), not with sos? 
* R-hub builder: OK


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
