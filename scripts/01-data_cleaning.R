#### Preamble ####
# Purpose: Clean the survey data downloaded from [...UPDATE ME!!!!!]
# Author: Rohan Alexander [CHANGE THIS TO YOUR NAME!!!!]
# Data: 3 January 2021
# Contact: rohan.alexander@utoronto.ca [PROBABLY CHANGE THIS ALSO!!!!]
# License: MIT
# Pre-requisites:
# - Need to have downloaded the ACS data and saved it to inputs/data
# - Don't forget to gitignore it!
# - Change these to yours
# Any other information needed?


#### Workspace setup ####
# Use R Projects, not setwd().
library(haven)
library(tidyverse)
library(readxl)
# Read in the raw data.
raw_data <- read_excel("inputs/data/new_sif_data_table_2019_20prelim_en_march2022.xlsx")


reduced_data <-
  raw_data %>%
  filter(`School Level` == "Secondary") %>%
  select(`School Number`, `School Type`, City, `Percentage of Students Whose First Language Is Not English`, `Percentage of Students That Passed the Grade 10 OSSLT on Their First Attempt`, `Percentage of Students Receiving Special Education Services`, `Percentage of Students Receiving Special Education Services`, `Percentage of Students Identified as Gifted`, `Percentage of School-Aged Children Who Live in Low-Income Households`, `Percentage of Students Whose Parents Have No Degree, Diploma or Certificate`) %>%
  janitor::clean_names() %>%
  na.exclude() %>%
  filter_all(all_vars(. != "NA" & . != "SP" & . != "N/P" & . != "N/D" & . != "N/R")) %>%
  mutate(percentage_of_students_that_passed_the_grade_10_osslt_on_their_first_attempt = gsub("%", "", percentage_of_students_that_passed_the_grade_10_osslt_on_their_first_attempt)) %>%
  mutate(across(where(is.character), tolower))%>% 
  mutate(school_type = factor(school_type))


## save data_final to ‘inputs/data/cleaned_data.csv’.
write.csv(reduced_data, "inputs/data/cleaned_data.csv", row.names = FALSE) 
