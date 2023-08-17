#
#
if (basename(getwd()) != "run_nft_locally_in_singularity_from_build") {
  stop(
    "Please run '3_update_gradle_build.sh' or '3_update_gradle_build.R' ",
    "in the 'run_nft_locally_in_singularity_from_build'"
  )
}

filenames <- list.files(
  pattern = "build.gradle",
  recursive = TRUE,
  full.names = TRUE
)
if (length(filenames) == 0) {
  stop("Cannot find file 'gradle-wrapper.properties' in ", getwd())
}

# From https://stackoverflow.com/questions/23796404/could-not-find-method-compile-for-arguments-gradle


for (filename in filenames) {
  text <- readLines(filename)
  line_numbers <- stringr::str_which(text, " compile ")
  if (length(line_numbers) != 0) {
    text[line_numbers] <- stringr::str_replace(text[line_numbers], " compile ", " implementation ")
    writeLines(text, filename)
  }
  # Confirm it worked
  text <- readLines(filename)
  testthat::expect_equal(0, length(stringr::str_which(text, " compile ")))
  testthat::expect_true(length(stringr::str_which(text, " implementation ")) >= 0)
}

for (filename in filenames) {
  text <- readLines(filename)
  line_numbers <- stringr::str_which(text, " runtime ")
  if (length(line_numbers) != 0) {
    text[line_numbers] <- stringr::str_replace(text[line_numbers], " runtime ", " runtimeOnly ")
    writeLines(text, filename)
  }
  # Confirm it worked
  text <- readLines(filename)
  testthat::expect_equal(0, length(stringr::str_which(text, " runtime ")))
  testthat::expect_true(length(stringr::str_which(text, " runtimeOnly ")) >= 0)
}

for (filename in filenames) {
  text <- readLines(filename)
  line_numbers <- stringr::str_which(text, " testCompile\\(")
  if (length(line_numbers) != 0) {
    text[line_numbers] <- stringr::str_replace(text[line_numbers], " testCompile\\(", " testImplementation(")
    writeLines(text, filename)
  }
  # Confirm it worked
  text <- readLines(filename)
  testthat::expect_equal(0, length(stringr::str_which(text, " testCompile\\(")))
  testthat::expect_true(length(stringr::str_which(text, " testImplementation\\(")) >= 0)
}

for (filename in filenames) {
  text <- readLines(filename)
  line_numbers <- stringr::str_which(text, " testRuntime ")
  if (length(line_numbers) != 0) {
    text[line_numbers] <- stringr::str_replace(text[line_numbers], " testRuntime ", " testRuntimeOnly ")
    writeLines(text, filename)
  }
  # Confirm it worked
  text <- readLines(filename)
  testthat::expect_equal(0, length(stringr::str_which(text, " testRuntime ")))
  testthat::expect_true(length(stringr::str_which(text, " testRuntimeOnly ")) >= 0)
}

