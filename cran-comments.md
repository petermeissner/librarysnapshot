## This is a re-submission



**Your comments:**

Thanks, we see your code has

  # copy packages
  if ( dir.exists(path) ){
    unlink(path, recursive = TRUE)
  }

and hence you delete the whole directory tree a user specifies which is really dangerous.

POlease only delete files if the user sets some specific argument to TRUE explicitly which defaults to FALSE.

Even in the sinple example of applying the function with default settings, the whole content of the tempdir() will be deleted which may not be nice in a running R session.




**my actions taken**

Thanks, these seem to be very reasonable suggestions ...

I have removed any kind deleting files or folders from the functions - this is left to the user.

Furthermore, the library_snapshot() function now defaults to no writing to disk unless
the user explicitly specifies the path parameter, which - as documented - will than write to this path. 

This should prevent any accidents. 





## Test environments
* local Win10 install, R 3.4.3
* ubuntu 14.04 (on travis-ci), R 3.4.3
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.


## Reverse dependencies

This is a new release, so there are no reverse dependencies.


