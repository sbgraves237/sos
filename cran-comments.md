2021-05-26:  
## sos 2.1-7
* I believe I've fixed all the problems identified in CRAN checks and in emails from Prof. Ripley, EXCEPT for the NOTE that, "The following object is masked from 'package:utils': ?" This is code that Duncan Murdoch contributed to this package around 2009, and I don't know how to suppress it.  I asked R-pkg-devel.  Ben Bolker replied, "This is harmless and should be accepted by CRAN".  If you disagree, I could use guidance on how to eliminate it without eliminating the functionality for which Duncan contributed code.  
* Some checks complained incorrectly that, "there is no package called 'mgcv' ... 'survival' ... 'boot' ... 'MASS' 'lattice'".  No other errors, warnings or notes were reported on 5 GitHub Actions (R-release on Mac, Windows, Ubuntu plus R-devel and -oldrel on Ubuntu, all latest), plus my local machine (macOS 11.7.7 with R 4.3.0), Winbuilder with R-release, R-oldrel, and R-devel, and R-hub.   

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
