library(purrr)

# Define the sub folders' names:
chapter_names <- paste0("Chapter ", 1:23)

# Create the sub folders:
walk(chapter_names, \(.x) {dir.create(path = paste0("exercise/", .x))})