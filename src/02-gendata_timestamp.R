# Generate data with mixed timestamps

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
    dt = seq(from=ymd_hms("2018-05-10 00:00:00"), to=ymd_hms("2018-05-12 23:00:00"), by="hour")
  , val = sin(2 * pi * seq_along(dt) / 20) + rnorm(length(dt), sd = 0.05)
)

# list of dataframes by date
lst_dat <- split(dat, as_date(dat$dt))
  
# Format some datetimes, 3 different formats
lst_dat[["2018-05-10"]] <- lst_dat[["2018-05-10"]] %>%
  mutate(dt_fmt = strftime(dt, "%F %T"))

lst_dat[["2018-05-11"]] <- lst_dat[["2018-05-11"]] %>%
  mutate(dt_fmt = strftime(dt, "%Y-%m-%d %I %p"))

lst_dat[["2018-05-12"]] <- lst_dat[["2018-05-12"]] %>%
  mutate(dt_fmt = strftime(dt, "%m/%d/%Y %T"))


# Write out the dataframes
lst_dat %>%
  iwalk( function (.df, .nm) {
    file_out <- file.path(dir_proj, "dat", "dat_02", sprintf("%s.csv", .nm))
    if(!dir.exists(dirname(file_out))) dir.create(dirname(file_out), recursive = TRUE)
    write_csv(.df %>% select(-dt), file_out)
  })

