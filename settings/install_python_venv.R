#'Source:
#'https://rstudio.github.io/reticulate/articles/python_packages.html

reticulate::virtualenv_create("r-reticulate")

# reticulate::virtualenv_list()

reticulate::py_install(packages = c("openmeteo_requests",
                                    "requests_cache",
                                    "retry_requests",
                                    "pandas",
                                    "radian"),
                       method = "virtualenv")