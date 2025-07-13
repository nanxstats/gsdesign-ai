library(curl)
library(Rd2roxygen)

rd2llmstxt <- function(url, pkg) {
  if (!dir.exists("tmp")) dir.create("tmp")
  curl_download(url, "tmp/pkg.tar.gz")
  untar("tmp/pkg.tar.gz", exdir = "tmp/")
  pkg_dir <- file.path("tmp", pkg, "man")
  pkg_rd <- list.files(pkg_dir, pattern = ".Rd", full.names = TRUE)

  function_names <- gsub(".Rd", x = basename(pkg_rd), replacement = "")
  doc_vec <- rep(NA, length(function_names))

  for (i in seq_along(function_names)) {
    x <- Rd2roxygen::parse_file(pkg_rd[i])
    doc_vec[i] <- paste0(
      paste("FUNCTION:", function_names[i], "\n"),
      paste("TITLE:", x$title, "\n"),
      paste("DESCRIPTION:", x$desc, "\n"),
      paste("ARGUMENTS:", paste0(x$params, collapse = "\n"), "\n"),
      paste("EXAMPLE:", x$examples, "\n"),
      collapse = "\n"
    )
  }

  doc <- paste0(doc_vec, collapse = "\n\n")

  writeLines(text = doc, con = file.path("content", "packages", tolower(pkg), "llms.txt"))
}

rd2llmstxt("https://cran.r-project.org/src/contrib/gsDesign_3.6.9.tar.gz", "gsDesign")
rd2llmstxt("https://cran.r-project.org/src/contrib/gsDesign2_1.1.5.tar.gz", "gsDesign2")
rd2llmstxt("https://cran.r-project.org/src/contrib/simtrial_1.0.0.tar.gz", "simtrial")
