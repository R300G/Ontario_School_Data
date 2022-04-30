# Key Demographics of High School Students that passes the Mandatory Ontario Secondary School Literacy Test (OSSLT) on First Attempt

- Author: Charles Lu
- Date: April 29th, 2022
- E-mail: charlesjiahong.lu@utoronto.ca

## Overview of the paper

This repository explores the Ontario school information and student demographic data to better understand Ontario Secondary School Literacy Test (OSSLT) pass rate on various school and student's demographic backgrounds.

## Obtaining data

The data is available on https://data.ontario.ca/dataset/school-information-and-student-demographics

It is also included in this repository, in the directory "inputs/data/new_sif_data_table_2019_20prelim_en_march2022.xlsx"

## cleaning data

In the script "01-data_cleaning.R", located in "scripts" folder, contains all the code that is necessary to clean and tidy the data and save the file as csvfile in the directory "outputs/data/cleaned_data.csv". 


## Building the Report

There is a RMarkDown document located in "outputs/paper/paper.Rmd". This file is used to produce the report "Key Demographics of High School Students that passes the Mandatory Ontario Secondary School Literacy Test (OSSLT) on First Attempt". It contains the R code to produce the graphs and the report format code. The reference used are also located in "outputs/paper/references.bib".


## File Structure

1. Inputs
- In the data folder, you will find Ontario School information and Student demographics.

2. Outputs
- In the paper folder you will find a reference file, RMarkdown file, and a pdf document of the report.
- In the data folder you will find one cleaned data file.

3. Scripts
- This folder contains R-Scripts that simulates the data, and clean the data.

4. Licence
- Typical MIT licence for reusability

