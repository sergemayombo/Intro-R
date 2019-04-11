# Tidier data
# Day 2
# 11 April 2019
# Chapter 11

# loding libraries
library(tidyverse)
library(lubridate)

# Load the data from a .RData file
load("data/SACTNmonthly_v4.0.RData") # loading data from the data folder
SACTN <- SACTNmonthly_v4.0 # assign a name to the dataset
rm(SACTNmonthly_v4.0) # rm - remove function

# Tidy data
# filter, mutate, goup_by, select, arrange: are function most used in the tidyverse package

# FIlter
SACTN_1 <- SACTN %>%
  filter(site == "Port Nolloth") # Only extract Port Nolloth data

# Filtering and restricting for certain moths
SACTN %>%
  filter(site == "Pollock Beach", month(date) == 12 | month(date) == 1) # Here we specify a month 
# The lubricate function allows for R to detect a specific month in dated data

SACTN_ARR <- SACTN %>%
  arrange(depth, temp) # Arrange function places the lower value to the top of the dataset

# Descending order
SACTN_2 <- SACTN %>%
  arrange(desc(temp)) # Highest temperature to the top ofthe dataset

# Filter for specific dates/years
SACTN_Hume <- SACTN %>% # selecting the dataset
  filter(site == "Humewood", year(date) == 1990) # filtering only the year 1990

# Filtering for more than 1 year
humewood_90s <- SACTN %>%
  filter(site == "Humewood", year(date) %in% seq(1990, 1999))


PN_SACTN <- SACTN %>%
  filter(site == "Port Nolloth", # First give the site to filter
         src == "DEA", # Then specify the source
         temp <= 11 | # Temperatures at or below 11°C OR
           is.na(temp)) # Include missing values

# Selet function (Tidyverse)  

SACTN_Select <- SACTN %>% 
  select(site, src, temp)

SACTN_organised <- SACTN %>% 
  select (temp, src, site) # Arranged the selected variables into a specific order

SACTN_every <- SACTN %>% 
  select(type, src, everything())

# Exploring the mutate function which create a new column
SACTN_mutated <- SACTN %>%
  mutate(kelvin = temp + 273.15) # Add a new column 
# You should give a name to the new column that you're creating

# summarise function
SACTN_summary <- SACTN %>%
  summarise(mean_temp = mean(temp, na.rm = TRUE),
            sd_temp = sd(temp, na.rm = TRUE),
            min_temp = min(temp, na.rm = TRUE),
            max_temp = max(temp, na.rm = TRUE))
