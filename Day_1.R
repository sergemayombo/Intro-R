# Day 1
# UWC
# Serge
# 10 April 2019

apples <- c(5.3, 7.8, 19.4, 1)
mean(apples)
sd(apples)
dim(apples) # dimensuisn: Null? Not a dataframe
length(apples)
range(apples)
median(apples)
max(apples)
min(apples)

# Libraries

library(tidyverse)

# Reading a dataset into R 

laminaria <- read.csv("data/laminaria.csv") # Using the laminaria data found in the laminaria folder

dim(laminaria) # 140 rows & 12 columns # cannot use the mean function for a dataframe
mean(laminaria)

# calculate the mean of:
# Blade weight and blade length
# %>% = pipe function, ctrl + shift + m

lam_sum <- laminaria %>% # specify the dataset
  summarise(mean_wt = mean(blade_weight), # calculate mean of the blade weight
            mean_bl = mean(blade_length)) # calculate the mean of the blade length
lam_sum

## Explore data - laminaria dataset

head(laminaria) # shows the first 6 rows of the dataset
tail(laminaria) # shows the last 6 rows of the dataset
head(laminaria, n=2) # shows the first 2 rows
tail(laminaria, n=2) # shows the last 2 rows

names(laminaria) # Variables
colnames(laminaria)

nrow(laminaria) #number of rows
ncol(laminaria) #number of columns

lam2 <- laminaria %>% #create a new dataset by selecting blade_weight, blade_length and site
  select(blade_weight, blade_length, site)
lam2

lam3 <- laminaria %>% # specify the dataset
  filter(site == "Sea Point") %>% # specify one particular site
  summarise(mean_wt = mean(blade_weight), # mean BW of the one site
            mean_bl = mean(blade_length), # mean BL of the one site
            sd_bl = sd(blade_length)) # standaed deviation of BL

# FUnction tidyverse called: slice

lam_slice <- laminaria %>% 
  slice(6:13)
lam_slice

# Working with missing values

lam_miss <- laminaria %>%  # specify the dataset
  summarise(mean_sn = mean(stipe_mass, na.rm = TRUE)) # mean stipe mass
lam_miss

laminaria %>% # Select 'laminaria'
  group_by(site) %>% # Group the dataframe by site
  summarise(var_bl = var(blade_length), # Calculate variance
            n_bl = n()) %>% # Count number of values
  mutate(se_bl = sqrt(var_bl / n_bl)) # Calculate se