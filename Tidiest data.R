# Tidies data 
# Day 2
# Serge
# 11 April 2019

# loading libraries
library(tidyverse)
library(lubridate)

# load the data from a .RData file
load("data/SACTNmonthly_v4.0.RData")

# Copy the data as a dataframe with a shorter name
SACTN <- SACTNmonthly_v4.0

# Remove the original
rm(SACTNmonthly_v4.0)

# group_by function
# Group by depth
SACTN_depth <- SACTN %>%
  group_by(depth)

# Calculate mean temperature by depth
SACTN_depth_mean <- SACTN_depth %>%
  summarise(mean_temp = mean(temp, na.rm = TRUE),
            count = n()
  )
# Visualise the results
SACTN_depth_mean

SACTN_depth_mean_2 <- SACTN %>% # Choose a base dataframe
  group_by(depth) %>% # Group by thedepth column
  summarise(mean_temp = mean(temp, na.rm = TRUE), # Calculate means
            count = n()) # Count observations # Safety measure

# Exploring all tidyverse function in one chunk of code
SACTN_tidy <- SACTN %>%
  filter(site == "Paternoster" | site == "Oudekraal") %>%
  group_by(site, src) %>%
  summarise(mean_temp = mean(temp, na.rm = TRUE),
            sd_temp = sd(temp, na.rm = TRUE))

# Working with multiple sites but not all the sites in the dataset
# First create a character vector containing the desired sites
selected_sites <- c("Paternoster", "Oudekraal", "Muizenberg", "Humewood")

# Then calculate the statistics
SACTN_select <- SACTN %>%
  filter(site %in% selected_sites) %>%
  group_by(site, src) %>%
  summarise(mean_temp = mean(temp, na.rm = TRUE),
            sd_temp = sd(temp, na.rm = TRUE))

