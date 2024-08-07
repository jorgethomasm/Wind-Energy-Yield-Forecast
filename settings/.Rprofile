#' Source:
#' https://github.com/REditorSupport/vscode-R/wiki/Plot-viewer#svg-in-httpgd-webpage

if (interactive() && Sys.getenv("TERM_PROGRAM") == "vscode") {
  if ("httpgd" %in% .packages(all.available = TRUE)) {
    options(vsc.plot = FALSE)
    options(device = function(...) {
      httpgd::hgd(silent = TRUE)
      .vsc.browser(httpgd::hgd_url(history = FALSE), viewer = "Beside")
    })
  }
}

# Set CRAN Mirror

local({
  r <- getOption("repos")
  r["CRAN"] <- Sys.getenv("CRAN_MIRROR")
  options(repos = r)
})
