#' library_snapshot
#'
#' Make a local copy of the currently used packeges from the currently used library.
#'
#' @param path path to which to make copy to
#'
#' @return Returns the paths from which packages were copied
#' @export
#'
#' @examples
#' \dontrun{
#'
#' library_snapshot(path = tempdir())
#'
#' }
#'
#'
library_snapshot <- function( path = tempdir() ){

  packages <- session_dependencies()

  # copy packages
  if ( dir.exists(path) ){
    unlink(path, recursive = TRUE)
  }
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

  packages$path_from <- unlist(package_paths)
  packages$path_to   <- paste(path, basename(unlist(package_paths)), sep="/")

  # return
  return(packages)
}
