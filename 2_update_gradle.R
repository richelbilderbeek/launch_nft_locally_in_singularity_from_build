#
#
# From https://stackoverflow.com/a/64637310
target_zipfilename <- "gradle-6.3-all.zip"

if (basename(getwd()) != "run_nft_locally_in_singularity_from_build") {
  stop(
    "Please run '2_update_gradle.sh' or '2_update_gradle.R' ",
    "in the 'run_nft_locally_in_singularity_from_build' folder"
  )
}

filename <- list.files(
  pattern = "gradle-wrapper.properties",
  recursive = TRUE,
  full.names = TRUE
)
if (length(filename) == 0) {
  stop("Cannot find file 'gradle-wrapper.properties' in ", getwd())
}

text <- readLines(filename)
line_number <- stringr::str_which(text, "gradle-.....-all.zip")
if (length(line_number) == 1) {
  text[line_number] <- stringr::str_replace(text[line_number], "gradle-.....-all.zip", target_zipfilename)
  writeLines(text, filename)
}

# Confirm it worked
text <- readLines(filename)
testthat::expect_equal(0, length(stringr::str_which(text, "gradle-.....-all.zip")))
testthat::expect_equal(1, length(stringr::str_which(text, target_zipfilename)))
