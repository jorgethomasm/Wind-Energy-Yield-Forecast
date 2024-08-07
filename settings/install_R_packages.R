#' R packages needed
#' @jorgethomasm

repo <- "https://cloud.r-project.org"

r_packages <- c("BH",
                "languageserver",
                "httpgd",
                "rmarkdown",
                "knitr",
                "reticulate",
                "dplyr",
                "tibble",
                "ggplot2",
                "plotly",
                "lubridate",
                "xts",
                "kableExtra",
                "devtools",
                "gt")

for (package in r_packages) {

install.packages(package, repos = c(CRAN = repo))

}

# remotes::install_github('rstudio/renv')
