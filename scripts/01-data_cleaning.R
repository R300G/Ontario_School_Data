#### Preamble ####
# Purpose: Clean the data downloaded from https://data.ontario.ca/dataset/school-information-and-student-demographics
# Author: Charles Lu
# Data: 27 April 2022
# Contact: charlesjiahong.lu@mail.utoronto.ca
# License: MIT
# Pre-requisites:
# - raw data is public and already included in the inputs/data folder



#### Workspace setup ####
# Use R Projects, not setwd().
library(haven)
library(tidyverse)
library(readxl)
# Read in the raw data.
raw_data <- read_excel("inputs/data/new_sif_data_table_2019_20prelim_en_march2022.xlsx")

#$ clean the data
reduced_data <-
  raw_data %>%
  filter(`School Level` == "Secondary") %>%
  select(`School Type`,`Board Name`, `Percentage of Students That Passed the Grade 10 OSSLT on Their First Attempt`,`Percentage of Students Whose First Language Is Not English`, `Percentage of Students Receiving Special Education Services`, `Percentage of Students Receiving Special Education Services`, `Percentage of Students Identified as Gifted`, `Percentage of School-Aged Children Who Live in Low-Income Households`, `Percentage of Students Whose Parents Have No Degree, Diploma or Certificate`) %>%
  janitor::clean_names() %>%
  na.exclude() %>%
  filter_all(all_vars(. != "NA" & . != "SP" & . != "N/P" & . != "N/D" & . != "N/R")) %>%
  mutate(percentage_of_students_that_passed_the_grade_10_osslt_on_their_first_attempt = gsub("%", "", percentage_of_students_that_passed_the_grade_10_osslt_on_their_first_attempt)) %>%
  mutate(across(where(is.character), tolower))%>% 
  mutate(school_type = factor(school_type)) %>%
  rename(esl_students = percentage_of_students_whose_first_language_is_not_english, osslt_passes = percentage_of_students_that_passed_the_grade_10_osslt_on_their_first_attempt, se_students = percentage_of_students_receiving_special_education_services, gifted_students = percentage_of_students_identified_as_gifted, low_income_household = percentage_of_school_aged_children_who_live_in_low_income_households, no_degree_parents = percentage_of_students_whose_parents_have_no_degree_diploma_or_certificate)

rm(reduced_data, raw_data)

## save data_final to ‘outputs/data/cleaned_data.csv’.
write.csv(reduced_data, "outputs/data/cleaned_data.csv", row.names = FALSE) 
