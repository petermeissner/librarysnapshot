#' package_dependencies
#'
#' @param pkg the package to resolve dependencies for
#' @param env an environment to store results in, is primarily used for recursion
#' @param dependency_type the dependency types to include, e.g.
#'   "depends", "imports", "linkingto", "suggests" -- will leave out suggests by
#'   default
#'
#' @export
#'
package_dependencies <-
  function(pkg, env = NULL, dependency_type = c("depends", "imports", "linkingto")){
    if ( is.null(env) ){
      env          <- new.env()
      env$packages <- character(0)
    }else{
      if ( all(pkg %in% env$pkg) ){
        return(env$packages)
      }
    }

    package_list <-
      as.data.frame(
        utils::installed.packages(),
        stringsAsFactor = FALSE
      )

    packages <-
      c(
        if( "depends" %in% dependency_type ){
          as.character(package_list[rownames(package_list) %in% pkg, ]$Depends)
        }else{
          character(0)
        },
        if( "imports" %in% dependency_type ){
          as.character(package_list[rownames(package_list) %in% pkg, ]$Imports)
        }else{
          character(0)
        },
        if( "linkingto" %in% dependency_type ){
          as.character(package_list[rownames(package_list) %in% pkg, ]$LinkingTo)
        }else{
          character(0)
        },
        if( "suggests" %in% dependency_type ){
          as.character(package_list[rownames(package_list) %in% pkg, ]$Suggests)
        }else{
          character(0)
        }
      )

    packages <-
      gsub("(\n)|(^R \\(.*?\\))|( *\\(.*?\\))", "", packages)

    packages <-
      packages[!is.na(packages) & packages!=""]

    if ( length(packages) == 0 ){
      return(env$packages)
    }

    packages <-
      unlist(strsplit(x = packages, split = " *, *"))

    env$pkg      <- sort(unique(c(pkg, env$pkg)))
    env$packages <- sort(unique(c(packages, env$packages)))
    env$packages <- env$packages[env$packages != ""]

    package_dependencies(packages, env = env)
  }

