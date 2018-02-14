#' session_dependencies
#'
#' @param exclude_base should base and recommended packages be excluded from dependencies?
#'
#' @export
#'
session_dependencies <-
  function(
    exclude_base = TRUE
  ){

    # initial retrieval of package used in session
    packages_in_path <- utils::sessionInfo()
    packages_other   <- names(packages_in_path$otherPkgs)
    packages_loaded  <- names(packages_in_path$loadedOnly)
    packages_base    <- packages_in_path$basePkgs

    # handle exclude_base option
    if( exclude_base == TRUE ){
      packages_session <- unique(c(packages_loaded, packages_other))
    }else{
      packages_session <- unique(c(packages_base, packages_loaded, packages_other))
    }

    package_names <-
      unique(
        c(
          unlist(
            lapply(
              X   = packages_session,
              FUN = package_dependencies
            )
          ),
          packages_session
        )
      )

    # get data on all installed packages
    packages_df <-
      as.data.frame(
        utils::installed.packages(),
        stringsAsFactors = FALSE
      )


    # subset
    packages_df <-
      merge(
        data.frame(
          Package          = package_names,
          order            = seq_along(package_names),
          stringsAsFactors = FALSE
        ),
        packages_df
      )
    packages_df <- packages_df[order(packages_df$order), ]


    # filter out not used packages (+base packages)
    iffer <-
      if( exclude_base == TRUE ){
        rownames(packages_df) %in% package_names &
          is.na(packages_df$Priority)
      }else{
        rownames(packages_df) %in% package_names
      }

    packages_df       <- packages_df[iffer, ]

    # add order variable
    packages_df$order <- seq_len(nrow(packages_df))

    # return
    packages_df
  }
