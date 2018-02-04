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
library_snapshot <- function(path = "rlib"){

  # get packages
  packages <- utils::sessionInfo()
  packages_other  <- names(packages$otherPkgs)
  packages_loaded <- names(packages$loadedOnly)

  # copy packages
  dir.create(path = path, showWarnings = FALSE, recursive = TRUE)
  package_paths <-
    vapply(
      X         = c(packages_other, packages_loaded),
      FUN       =
        function(pkg_name, path){
          package_path_from <- system.file(package = pkg_name)
          file.copy(
            from      = package_path_from,
            to        = path,
            recursive = TRUE
          )
          return(package_path_from)
        },
      FUN.VALUE = character(1),
      path      = path,
      USE.NAMES = FALSE
    )

  # return
  return(package_paths)
}
