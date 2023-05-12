#
#
if (basename(getwd()) != "nextflow_tower_builder") {
  stop(
    "Please run '3_update_gradle_build.sh' or '3_update_gradle_build.R' ",
    "in the 'nextflow_tower_builder' folder, e.g. from\n",
    "\n",
    "  /home/username/nextflow_tower_builder"
  )
}

filename <- list.files(
  pattern = "Dockerfile.bak",
  recursive = TRUE,
  full.names = TRUE
)
if (length(filename) == 0) {
  stop("Cannot find file 'Dockerfile.bak' in ", getwd())
}

text <- readLines(filename)
line_number <- stringr::str_which(text, "FROM openjdk:8-alpine")
if (length(line_number) != 0) {
  text[line_number] <- stringr::str_replace(text[line_number], "FROM openjdk:8-alpine", "FROM adoptopenjdk/openjdk8:alpine")
  writeLines(text, filename)
}

# Confirm it worked
text <- readLines(filename)
testthat::expect_equal(0, length(stringr::str_which(text, "FROM openjdk:8-alpine")))
testthat::expect_equal(1, length(stringr::str_which(text, "adoptopenjdk/openjdk8:alpine")))
