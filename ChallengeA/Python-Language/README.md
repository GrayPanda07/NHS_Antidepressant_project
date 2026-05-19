# NHS Step Up Challenge A – R Analysis

This folder contains the R implementation of the NHS Step Up Challenge A project.

The project focuses on analysing NHS antidepressant prescribing data using R for data cleaning, aggregation, exploratory analysis, and visualisation.

---

# Project Overview

The analysis investigates prescribing trends across NHS regions, focusing on:

- Prescription volumes
- Drug costs
- Regional prescribing differences
- Most prescribed antidepressants
- Cost analysis by region and drug type

The project demonstrates core data analytics workflows commonly used in healthcare and pharmaceutical analysis.

---

# File Information

## Main Script
`NHS_ChallengeA_R.R`

## Language
R

## Project Type
Healthcare Data Analysis

---

# Analysis Tasks Completed

The R script performs:

## Data Import
- Reads Excel datasets using `readxl`

## Data Inspection
- Dataset structure checks
- Summary statistics
- Missing value analysis
- Unique value exploration

## Data Cleaning
- Removes duplicate records
- Removes missing values
- Converts numerical columns to correct data types

## Data Aggregation
- Top prescribed antidepressants
- National cost calculations
- Regional prescribing analysis
- Total prescription calculations

## Data Visualisation
- Bar charts
- Regional comparisons
- Cost visualisations
- Prescription trend graphics

---

# Libraries Used

```r
library(readxl)
library(tidyverse)
library(scales)
```

---

# Required Packages

Install required packages before running the script:

```r
install.packages("readxl")
install.packages("tidyverse")
install.packages("scales")
```

---

# Dataset Used

The script uses:

```text
Step Up Excel Data Dec 2024.xlsx
```

The dataset contains NHS antidepressant prescribing information including:

- Drug names
- Prescription item counts
- Actual prescribing costs
- NHS regional information
- ICB data

---

# Key Features of the Analysis

## Prescribing Analysis
- Identifies the most prescribed antidepressants
- Compares prescribing volumes across NHS regions

## Cost Analysis
- Calculates national and regional medication costs
- Investigates prescribing expenditure patterns

## Data Visualisation
- Produces professional healthcare-focused charts using ggplot2
- Applies NHS-inspired colour palettes

---

# Example Questions Answered

The analysis explores questions such as:

- Which antidepressants are prescribed most frequently?
- What is the national cost of Mirtazapine?
- How much is spent on Sertraline in different NHS regions?
- Which regions have the highest prescribing activity?

---

# Visualisation Features

The project includes:

- Horizontal bar charts
- Regional cost comparisons
- Prescription frequency charts
- NHS-style colour themes

NHS-inspired colour palette used:

- NHS Blue
- NHS Dark Blue
- NHS Light Blue
- NHS Aqua
- NHS Grey

---

# Technologies Used

- R
- RStudio
- tidyverse
- ggplot2
- readxl
- scales

---

# Skills Demonstrated

- Data cleaning
- Exploratory data analysis
- Healthcare analytics
- Data visualisation
- Statistical summarisation
- R programming
- Data wrangling using tidyverse
- Professional reporting workflows

---

# How To Run

1. Open the `.R` file in RStudio
2. Ensure the Excel dataset is in the same folder
3. Install required packages
4. Run the script section-by-section or run all

---

# Data Disclaimer

This project was completed for educational and portfolio purposes.

The dataset was provided as part of the NHS Step Up Challenge and should not be redistributed without permission from the original providers.

---

# Author

## Alexandria Noikovitch

Mathematics Graduate  
Data Analytics & Data Science Portfolio

Technical Skills:
- R
- Python
- SQL
- Excel
- Power BI
- ggplot2
- tidyverse

LinkedIn:
https://www.linkedin.com/in/alexandria-noikovitch/

---

# Notes

This repository demonstrates healthcare data analysis workflows using R and tidyverse tools.

The project was designed to showcase practical analytical skills relevant to healthcare analytics, pharmaceutical analytics, and business intelligence roles.
