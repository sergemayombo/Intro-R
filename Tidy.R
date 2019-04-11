# Working with tidy data
# Long is better than wide data
# Mainly focus on tidyverse
# 11 April 2019
# Serge Mayombo

# loading libraries
library(tidyverse)

# loading data
load("data/SACTN_mangled.RData")

# Plotting the data
ggplot(data = SACTN1, aes(x = date, y = temp)) +
  geom_line(aes(colour = site, group = paste0(site, src))) +
  labs(x = "", y = "Temperature (°C)", colour = "Site") +
  theme_bw()

# Gather function in R
# Part of tidyverse package
# ctrl shift m %>% 
SACTN2_tidy <- SACTN2 %>% # loading he dataset
  gather(DEA, KZNSB, SAWS, key = "src", value = "temp") # Gathering the three variables and creating a new column 
# The created column is called "src" variable name
# We will have the various sources/src : src are (DEA, KZNSB, SAWS)
# Title of column is "temp" = temperature collected by each source

# remove missing values
SACTN2_tidy <- SACTN2 %>% # loading he dataset
  gather(DEA, KZNSB, SAWS, key = "src", value = "temp") %>% 
  na.omit() # Remove all the NA/ another function to do that is drop_na

# preading
SACTN3_tidy <- SACTN3 %>%
  spread(key = var, value = val)

# separating and uniting
SACTN4a_tidy <- SACTN4a %>%
  separate(col = index, into = c("site", "src"), sep = "/ ")

# Unite 
SACTN4b_tidy <- SACTN4b %>%
  unite(year, month, day, col = "date", sep = "-")

# Joining
SACTN4_tidy <- left_join(SACTN4a_tidy, SACTN4b_tidy)

SACTN4_tidy <- left_join(SACTN4a_tidy, SACTN4b_tidy, by = c("site", "src", "date"))
