
## Library Snapshots for Current Packages in Use

**Status**

*lines of R code:* 24, *lines of test code:* 0

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

0.1.0 - 2018-02-04 / 21:40:19

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
