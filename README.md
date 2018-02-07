
## Library Snapshots for Current Packages in Use

**Status**

*lines of R code:* 121, *lines of test code:* 19

<a href="https://travis-ci.org/petermeissner/librarysnapshot">
<img src="https://api.travis-ci.org/petermeissner/librarysnapshot.svg?branch=master">
<a/> <a href="https://cran.r-project.org/package=librarysnapshot">
<img src="http://www.r-pkg.org/badges/version/librarysnapshot">
</a><a href="https://codecov.io/gh/petermeissner/librarysnapshot">
<img src="https://codecov.io/gh/petermeissner/librarysnapshot/branch/master/graph/badge.svg" alt="Codecov" />
</a>
<img src="http://cranlogs.r-pkg.org/badges/grand-total/librarysnapshot">
<img src="http://cranlogs.r-pkg.org/badges/librarysnapshot">

**Development version**

0.1.0 - 2018-02-07 / 19:45:52

**Description**

Generate a local library copy with relevant packages. All packages
currently found within the search path - except base packages - will be
copied to the directory provided and can be used later on with the
‘.libPaths()’ function.

**License**

MIT + file LICENSE <br>Peter Meissner \[aut, cre\]

**Citation**

``` r
citation("librarysnapshot")
```

**BibTex for citing**

``` r
toBibtex(citation("librarysnapshot"))
```

**Contribution - AKA The-Think-Twice-Be-Nice-Rule**

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms:

> As contributors and maintainers of this project, we pledge to respect
> all people who contribute through reporting issues, posting feature
> requests, updating documentation, submitting pull requests or patches,
> and other activities.
> 
> We are committed to making participation in this project a
> harassment-free experience for everyone, regardless of level of
> experience, gender, gender identity and expression, sexual
> orientation, disability, personal appearance, body size, race,
> ethnicity, age, or religion.
> 
> Examples of unacceptable behavior by participants include the use of
> sexual language or imagery, derogatory comments or personal attacks,
> trolling, public or private harassment, insults, or other
> unprofessional conduct.
> 
> Project maintainers have the right and responsibility to remove, edit,
> or reject comments, commits, code, wiki edits, issues, and other
> contributions that are not aligned to this Code of Conduct. Project
> maintainers who do not follow the Code of Conduct may be removed from
> the project team.
> 
> Instances of abusive, harassing, or otherwise unacceptable behavior
> may be reported by opening an issue or contacting one or more of the
> project maintainers.
> 
> This Code of Conduct is adapted from the Contributor Covenant
> (<http://contributor-covenant.org>), version 1.0.0, available at
> <http://contributor-covenant.org/version/1/0/0/>

## Installation

**Installation and start - stable version**

``` r
install.packages("librarysnapshot")
library(librarysnapshot)
```

**Installation and start - development version**

``` r
devtools::install_github("petermeissner/librarysnapshot")
library(librarysnapshot)
```

## Example Usage

``` r
library(librarysnapshot)

sessionInfo()
## R version 3.4.3 (2017-11-30)
## Platform: x86_64-w64-mingw32/x64 (64-bit)
## Running under: Windows 10 x64 (build 16299)
## 
## Matrix products: default
## 
## locale:
## [1] LC_COLLATE=German_Germany.1252  LC_CTYPE=German_Germany.1252    LC_MONETARY=German_Germany.1252
## [4] LC_NUMERIC=C                    LC_TIME=German_Germany.1252    
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
## [1] librarysnapshot_0.1.0
## 
## loaded via a namespace (and not attached):
##  [1] compiler_3.4.3  backports_1.1.2 magrittr_1.5    rprojroot_1.3-2 tools_3.4.3     htmltools_0.3.6
##  [7] yaml_2.1.16     Rcpp_0.12.15    stringi_1.1.6   rmarkdown_1.8   knitr_1.19      stringr_1.2.0  
## [13] digest_0.6.15   evaluate_0.10.1

path     <- paste(tempdir(), "rlib", sep="/")
snapshot <- library_snapshot(path = path)
## ..................

snapshot[, c("Package", "Version", "Depends", "Imports")]
##                         Package Version       Depends
## backports             backports   1.1.2  R (>= 3.0.0)
## base64enc             base64enc   0.1-3  R (>= 2.9.0)
## digest                   digest  0.6.15  R (>= 2.4.1)
## evaluate               evaluate  0.10.1  R (>= 3.0.2)
## highr                     highr     0.6  R (>= 3.0.2)
## htmltools             htmltools   0.3.6 R (>= 2.14.1)
## jsonlite               jsonlite     1.5       methods
## knitr                     knitr    1.19  R (>= 3.1.0)
## librarysnapshot librarysnapshot   0.1.0          <NA>
## magrittr               magrittr     1.5          <NA>
## markdown               markdown     0.8 R (>= 2.11.1)
## mime                       mime     0.5          <NA>
## Rcpp                       Rcpp 0.12.15  R (>= 3.0.0)
## rmarkdown             rmarkdown     1.8    R (>= 3.0)
## rprojroot             rprojroot   1.3-2  R (>= 3.0.0)
## stringi                 stringi   1.1.6   R (>= 2.14)
## stringr                 stringr   1.2.0   R (>= 2.14)
## yaml                       yaml  2.1.16          <NA>
##                                                                                                                                                                      Imports
## backports                                                                                                                                                              utils
## base64enc                                                                                                                                                               <NA>
## digest                                                                                                                                                                  <NA>
## evaluate                                                                                                                                         methods, stringr (>= 0.6.2)
## highr                                                                                                                                                                   <NA>
## htmltools                                                                                                                                                utils, digest, Rcpp
## jsonlite                                                                                                                                                                <NA>
## knitr                                                                                           evaluate (>= 0.10), highr, markdown, stringr (>= 0.6), yaml,\nmethods, tools
## librarysnapshot                                                                                                                                                        utils
## magrittr                                                                                                                                                                <NA>
## markdown                                                                                                                                                utils, mime (>= 0.3)
## mime                                                                                                                                                                   tools
## Rcpp                                                                                                                                                          methods, utils
## rmarkdown       tools, utils, knitr (>= 1.14), yaml (>= 2.1.5), htmltools (>=\n0.3.5), evaluate (>= 0.8), base64enc, jsonlite, rprojroot,\nmime, methods, stringr (>= 1.2.0)
## rprojroot                                                                                                                                                          backports
## stringi                                                                                                                                                tools,\nutils,\nstats
## stringr                                                                                                                                         stringi (>= 0.4.1), magrittr
## yaml                                                                                                                                                                    <NA>

list.files(path)
##  [1] "backports"       "base64enc"       "digest"          "evaluate"        "highr"          
##  [6] "htmltools"       "jsonlite"        "knitr"           "librarysnapshot" "magrittr"       
## [11] "markdown"        "mime"            "Rcpp"            "rmarkdown"       "rprojroot"      
## [16] "stringi"         "stringr"         "yaml"
```
