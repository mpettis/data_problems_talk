# Generate files for nesting zipfiles
# To unzip, use `src/unzip-inception.sh`

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
    dt = seq(from=ymd("2018-01-01"), to=ymd("2018-12-31"), by="day")
  , val = sin(2 * pi * seq_along(dt) / 20) + rnorm(length(dt), sd = 0.05)
)



# list of dataframes by month
lst_dat <- split(dat, floor_date(dat$dt, unit = "month") %>% strftime("%F"))



# Remove directory
unlink(file.path(dir_proj, "dat", "dat_01"), force = TRUE, recursive = TRUE)



# Write out files
lst_dat %>%
  iwalk( function (.df, .nm) {
    file_out <- file.path(dir_proj, "dat", "dat_01", sprintf("Q%d", quarter(.nm)), strftime(.nm, "%b"), .nm, sprintf("%s.csv", .nm))
    if(!dir.exists(dirname(file_out))) dir.create(dirname(file_out), recursive = TRUE)
    write_csv(.df, file_out)
  })



# Sequentially zip up files ----------------------------------------------------
# Date name level
list.files(file.path(dir_proj, "dat", "dat_01"), pattern=".csv", recursive = TRUE, full.names = TRUE) %>%
  walk(function(.x) {
    zip_destfile <- dirname(.x) %>% {sprintf("%s.zip", .)}
    zip(zip_destfile, .x, flags="-j9X")
    unlink(dirname(.x), force=TRUE, recursive = TRUE)
  })



# Month name level
list.files(file.path(dir_proj, "dat", "dat_01"), pattern=".zip", recursive = TRUE, full.names = TRUE) %>%
  dirname() %>%
  unique() %>%
  walk(function(.x) {
    files_tozip <- list.files(.x, pattern=".zip", recursive = TRUE, full.names = TRUE)
    zip_destfile <- sprintf("%s.zip", .x)
    zip(zip_destfile, files_tozip, flags="-j9X")
    unlink(.x, force = TRUE, recursive = TRUE)
  })



# Quarter name level
list.files(file.path(dir_proj, "dat", "dat_01"), pattern=".zip", recursive = TRUE, full.names = TRUE) %>%
  dirname() %>%
  unique() %>%
  walk(function(.x) {
    files_tozip <- list.files(.x, pattern=".zip", recursive = TRUE, full.names = TRUE)
    zip_destfile <- sprintf("%s.zip", .x)
    zip(zip_destfile, files_tozip, flags="-j9X")
    unlink(.x, force = TRUE, recursive = TRUE)
  })



# dat name level
list.files(file.path(dir_proj, "dat", "dat_01"), pattern=".zip", recursive = TRUE, full.names = TRUE) %>%
  dirname() %>%
  unique() %>%
  walk(function(.x) {
    files_tozip <- list.files(.x, pattern=".zip", recursive = TRUE, full.names = TRUE)
    zip_destfile <- sprintf("%s.zip", .x)
    zip(zip_destfile, files_tozip, flags="-j9X")
    unlink(.x, force = TRUE, recursive = TRUE)
  })
