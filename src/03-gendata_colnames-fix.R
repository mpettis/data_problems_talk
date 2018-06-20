# Generate data with column names that may be problematic.
#   - non-alphanumeric characters in names
#   - Duplicate column names

# Setup ------------------------------------------------------------------------

library(tidyverse)
library(purrrlyr)
library(lubridate)
library(rprojroot)

# Get project root directory
dir_proj <- find_root(has_file("PROJECT_ROOT"))



# Create data ------------------------------------------------------------------
set.seed(123)
dat <- tibble(
    cat = sample(c("red", "green", "blue"), 22, replace = TRUE)
  , val = sin(2 * pi * seq_along(cat) / 20) + rnorm(length(dt), sd = 0.05)
  , val2 = sin(2 * pi * seq_along(cat) / 20) + rnorm(length(dt), sd = 0.05)
)

# Make names that are problematic
names_prob <- c(
  "Acceleration-group\n(kg-m/s^2)"
  , "Bayes % prob\t[breaking confidence #]"
  , "Bayes % prob\t[breaking confidence #]"
)

# Put those names on the dataframe
# dat <- set_names(dat, names_prob)
dat <- setNames(dat, names_prob)

# Write it out
file_out <- file.path(dir_proj, "dat", "dat_03", "problem-headers.csv")
if(!dir.exists(dirname(file_out))) dir.create(dirname(file_out), recursive = TRUE)
write_csv(dat, file_out)










# Test: Read data back in, fix names -------------------------------------------
library(janitor)

# Note: as of this writing, read_csv has a bug that doesn't allow it to deal well
#   with newlines in the header row.
#   https://github.com/tidyverse/readr/issues/784
#   We will use a hack to make this work

# Pull out first row as header row
colnames_input <- read_csv(file_out, col_types = cols(), col_names = FALSE, n_max = 1) %>%
  as.character()

# Read data
# skip = 2 because it counts number of newlines in headers, and that dictates the total
# rows to skip
dat <- read_csv(file_out, col_types = cols(), col_names = FALSE, skip = 2)

# Put headers back on dat
dat <- set_names(dat, colnames_input)


# Clean the names
dat <- dat %>%
  clean_names()

# Save original headers for reference
colnames_input <- set_names(colnames_input, names(dat))

# Access old name via new name, example
colnames_input["bayes_percent_prob_breaking_confidence_number_2"]
