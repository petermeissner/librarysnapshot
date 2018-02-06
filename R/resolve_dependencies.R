#' session_dependencies
#'
#' @param exclude_base should base and recommended packages be excluded from dependencies?
#'
#' @export
#'
session_dependencies <-
  function(exclude_base = TRUE ){
    # initial retrieval of packages
    packages_in_path <- utils::sessionInfo()
    packages_other   <- names(packages_in_path$otherPkgs)
    packages_loaded  <- names(packages_in_path$loadedOnly)
    packages_base    <- packages_in_path$basePkgs

    if( exclude_base == TRUE ){
      packages_session <- sort(unique(c(packages_other, packages_loaded)))
    }else{
      packages_session <- sort(unique(c(packages_other, packages_loaded, packages_base)))
    }

    package_names <-
      sort(
        unique(
          c(
            packages_session,
            unlist(
              lapply(
                X   = packages_session,
                FUN = package_dependencies
              )
            )
          )
        )
      )

    packages_df <-
      as.data.frame(
        utils::installed.packages(),
        stringsAsFactors = FALSE
      )

    iffer <-
      if( exclude_base == TRUE ){
        rownames(packages_df) %in% package_names &
          is.na(packages_df$Priority)
      }else{
        rownames(packages_df) %in% package_names
      }

    packages_df[iffer, ]
  }
