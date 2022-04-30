#### Preamble ####
# Purpose: Obtain and prepare data about men responding to questions about AIDS
# for demographics such as age and province.
# Author:  - Charles Lu
# Email: charlesjiahong.lu@mail.utoronto.ca
# Data: 27 April 2022
# License: MIT



#### Simulate data ######## Workspace set-up ####
library(janitor)
library(tidyverse)

#### Simulate data ####

## simulate 500 highschool data
simulated_school_data <-
  tibble(
    school_type = sample(c("catholic","public"), size = 500, replace = T),
    osslt_passes = round(runif(500,min = 0, max = 100),2),
    esl_students = round(runif(500,min = 0, max = 100),2),
    se_students = round(runif(500,min = 0, max = 100),2),
    gifted_students = round(runif(500,min = 0, max = 100),2),
    low_income_household = round(runif(500,min = 0, max = 100),2),
    no_degree_parents = round(runif(500,min = 0, max = 100),2)
  )

view(simulated_school_data)