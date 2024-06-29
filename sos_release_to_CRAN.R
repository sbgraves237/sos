# File > "Open Project..." > [parent of Package file]

# https://r-pkgs.org/release.html

# First open project in this package directory
# Then open this file. 

library(usethis)
#usethis::use_release_issue()
use_release_issue()
# I cannot make this work.  
# Reported to Jenny Bryan, 2023-06-16.  

#20.1.  Pick a version number:  
#       in DESCRIPTION: must be later than any version on CRAN
#20.3.  The submission process
#       Store submission comments in cran-comments.md
#20.3.1.  Test environments
# devtools::check_win_*()
dir()

devtools::check()

devtools::check_win_devel()
devtools::check_win_release()
devtools::check_win_oldrelease()

devtools::check_rhub()

#20.3.3.  Reverse dependencies

# install.packages("revdepcheck")
#devtools::install_github('r-lib/revdepcheck')

revdepcheck::revdep_reset(Pkg)

revdepcheck::revdep_check(Pkg, num_workers = 4)

#20.4.  Update README.md and NEWS.md 

#20.5.  Submit to CRAN

library(devtools)
spell_check(Pkg)

release(Pkg)

#20.6.  Update the version number for the future 
#20.7.  Publicise
 
#20.1.  Pick a version number:  in DESCRIPTION > what's on CRAN

#20.2.  Run & document R CMD check 
# 2.1-0 because this is to match the move of 
# the database maintenance to wu.ut.at

#20.3.  Check CRAN policies
#20.4.  Update README.md and NEWS.md 
#20.5.  Submit to CRAN
#20.6.  Update the version number for the future 
#20.7.  Publicise

#After the package has been accepted, I should DELETE 
# CRAN-SUBMISSION 
# UNLESS I USE 
# usethis::use_github_release(), 
# because then IT is supposed to delete this temporary file.
# 
# usethis::use_github_release() creates release notes 
# from the NEWS bullets relevant to the current release. 
# Note that usethis::use_github_release() depends crucially 
# on the CRAN-SUBMISSION file that was written by 
# devtools::submit_cran(): that’s how it knows which SHA to tag. 
# After the successful creation of the GitHub release, 
# use_github_release() deletes this temporary file.
