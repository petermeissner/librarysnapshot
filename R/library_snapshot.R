#' library_snapshot
#'
#' Make a local copy of the currently used packages within the session
#' from the currently used library.
#'
#' @param path path to which to copy packages to; if NULL
#'
#' @return Returns the paths from which packages were copied
#' @export
#'
#' @examples
#' \dontrun{
#'
#'
#' library_snapshot()
#'
#' library_snapshot(path = tempdir())
#'
#'
#' }
#'
#'
library_snapshot <- function( path = NULL){

  # resolve dependencies
  packages <- session_dependencies()

  # copy packages
  if( !is.null(path) ){

    dir.create(path = path, showWarnings = FALSE, recursive = TRUE)
    package_paths <-
      mapply(
        FUN       =
          function(pkg_name, path){
            cat(".")
            package_path_from <- system.file(package = pkg_name)
            file.copy(
              from      = package_path_from,
              to        = path,
              recursive = TRUE
            )
            return(package_path_from)
          },
        pkg_name  = packages$Package,
        path      = path,
        USE.NAMES = FALSE,
        SIMPLIFY  = FALSE
      )

    # store additional inforamtion in packages data.frame
    packages$path_from <- unlist(package_paths)
    packages$path_to   <- paste(path, basename(unlist(package_paths)), sep="/")

  }else{

    packages$path_from <- rep(NA, nrow(packages))
    packages$path_to   <- rep(NA, nrow(packages))

  }

  # return
  return(packages)
}
