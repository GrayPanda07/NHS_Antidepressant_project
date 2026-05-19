# ==========================================
# NHS STEP UP CHALLENGE A - R VERSION
# Antidepressant Prescribing Analysis
# ==========================================

# ------------------------------------------
# 1. INSTALL PACKAGES
# ------------------------------------------

install.packages("readxl")
install.packages("tidyverse")
install.packages("scales")

# ------------------------------------------
# 2. LOAD LIBRARIES
# ------------------------------------------

library(readxl)
library(tidyverse)
library(scales)

# ------------------------------------------
# 3. IMPORT DATASET
# ------------------------------------------

df <- read_excel("Step Up Excel Data Dec 2024.xlsx")

# View first rows
head(df)

# ------------------------------------------
# 4. INSPECT DATA
# ------------------------------------------

str(df)

summary(df)

colnames(df)

dim(df)

# Missing values
colSums(is.na(df))

# Unique drugs
n_distinct(df$DRUG)

# Unique regions
n_distinct(df$REGIONAL_OFFICE_NAME)

# ------------------------------------------
# 5. CLEAN DATA
# ------------------------------------------

df <- df %>%
  distinct() %>%
  drop_na()

df$ITEMS <- as.numeric(df$ITEMS)
df$ACTUAL_COST <- as.numeric(df$ACTUAL_COST)

# Final structure check
str(df)

# ------------------------------------------
# 6. NHS COLOURS
# ------------------------------------------

nhs_blue <- "#005EB8"
nhs_dark_blue <- "#003087"
nhs_light_blue <- "#41B6E6"
nhs_aqua <- "#00A9CE"
nhs_grey <- "#768692"

# ==========================================
# EXERCISE 1 - AGGREGATING DATA
# ==========================================

# ------------------------------------------
# QUESTION 1
# TOP 10 PRESCRIBED ANTIDEPRESSANTS
# ------------------------------------------

top_10_drugs <- df %>%
  group_by(DRUG) %>%
  summarise(Total_Items = sum(ITEMS)) %>%
  arrange(desc(Total_Items)) %>%
  slice(1:10)

top_10_drugs

# ------------------------------------------
# QUESTION 2
# NATIONAL COST OF MIRTAZAPINE
# ------------------------------------------

mirtazapine_cost <- df %>%
  filter(str_detect(DRUG, "Mirtazapine")) %>%
  summarise(Total_Cost = sum(ACTUAL_COST))

mirtazapine_cost

# ------------------------------------------
# QUESTION 3
# SERTRALINE COST IN MIDLANDS
# ------------------------------------------

midlands_sertraline <- df %>%
  filter(
    str_detect(REGIONAL_OFFICE_NAME, "MIDLANDS"),
    str_detect(DRUG, "Sertraline")
  ) %>%
  summarise(Total_Cost = sum(ACTUAL_COST))

midlands_sertraline

# ------------------------------------------
# QUESTION 4
# TOTAL ANTIDEPRESSANT ITEMS
# ------------------------------------------

total_items <- sum(df$ITEMS)

total_items

# ==========================================
# EXERCISE 2 - VISUALISATIONS
# ==========================================

# ------------------------------------------
# CHART 1
# TOP 5 MOST PRESCRIBED DRUGS
# ------------------------------------------

top_5 <- df %>%
  group_by(DRUG) %>%
  summarise(Total_Items = sum(ITEMS)) %>%
  arrange(desc(Total_Items)) %>%
  slice(1:5)

ggplot(top_5,
       aes(x = reorder(DRUG, Total_Items),
           y = Total_Items)) +
  
  geom_col(fill = nhs_blue) +
  
  coord_flip() +
  
  scale_y_continuous(
    labels = comma
  ) +
  
  labs(
    title = "Top 5 Most Prescribed Antidepressants",
    x = "Drug",
    y = "Items Prescribed"
  ) +
  
  theme_minimal()

# ------------------------------------------
# CHART 2
# SERTRALINE COST IN NORTH EAST
# ------------------------------------------

sertraline_ne <- df %>%
  filter(
    str_detect(REGIONAL_OFFICE_NAME, "NORTH EAST"),
    str_detect(DRUG, "Sertraline")
  ) %>%
  group_by(ICB_NAME) %>%
  summarise(Total_Cost = sum(ACTUAL_COST)) %>%
  arrange(desc(Total_Cost))

ggplot(sertraline_ne,
       aes(x = reorder(ICB_NAME, Total_Cost),
           y = Total_Cost)) +
  
  geom_col(fill = nhs_dark_blue) +
  
  coord_flip() +
  
  scale_y_continuous(
    labels = label_number(scale = 1e-6, suffix = "M")
  ) +
  
  labs(
    title = "Sertraline Prescribing Cost in North East",
    x = "ICB",
    y = "Cost (£)"
  ) +
  
  theme_minimal()

# ------------------------------------------
# CHART 3A
# ITEMS BY DRUG
# ------------------------------------------

items_by_drug <- df %>%
  group_by(DRUG) %>%
  summarise(Total_Items = sum(ITEMS)) %>%
  arrange(desc(Total_Items))

ggplot(items_by_drug,
       aes(x = reorder(DRUG, Total_Items),
           y = Total_Items)) +
  
  geom_col(fill = nhs_light_blue) +
  
  coord_flip() +
  
  scale_y_continuous(
    labels = comma
  ) +
  
  labs(
    title = "Total Antidepressant Prescribing Items by Drug",
    x = "Drug",
    y = "Items Prescribed"
  ) +
  
  theme_minimal()

# ------------------------------------------
# CHART 3B
# COST BY DRUG
# ------------------------------------------

cost_by_drug <- df %>%
  group_by(DRUG) %>%
  summarise(Total_Cost = sum(ACTUAL_COST)) %>%
  arrange(desc(Total_Cost))

ggplot(cost_by_drug,
       aes(x = reorder(DRUG, Total_Cost),
           y = Total_Cost)) +
  
  geom_col(fill = nhs_aqua) +
  
  coord_flip() +
  
  scale_y_continuous(
    labels = label_number(scale = 1e-6, suffix = "M")
  ) +
  
  labs(
    title = "Total Antidepressant Prescribing Cost by Drug",
    x = "Drug",
    y = "Cost (£)"
  ) +
  
  theme_minimal()

# ------------------------------------------
# CHART 4A
# TOP 10 DRUGS BY ITEMS
# ------------------------------------------

ggplot(top_10_drugs,
       aes(x = reorder(DRUG, Total_Items),
           y = Total_Items)) +
  
  geom_col(fill = nhs_blue) +
  
  coord_flip() +
  
  scale_y_continuous(
    labels = comma
  ) +
  
  labs(
    title = "Top 10 Antidepressants by Prescribed Items",
    x = "Drug",
    y = "Items Prescribed"
  ) +
  
  theme_minimal()

# ------------------------------------------
# CHART 4B
# TOP 10 DRUGS BY COST
# ------------------------------------------

top_10_cost <- cost_by_drug %>%
  slice(1:10)

ggplot(top_10_cost,
       aes(x = reorder(DRUG, Total_Cost),
           y = Total_Cost)) +
  
  geom_col(fill = nhs_aqua) +
  
  coord_flip() +
  
  scale_y_continuous(
    labels = label_number(scale = 1e-6, suffix = "M")
  ) +
  
  labs(
    title = "Top 10 Antidepressants by Prescribing Cost",
    x = "Drug",
    y = "Cost (£)"
  ) +
  
  theme_minimal()

# ==========================================
# EXERCISE 3 - REGIONAL ANALYSIS
# ==========================================

# ------------------------------------------
# ITEMS BY REGION
# ------------------------------------------

items_by_region <- df %>%
  group_by(REGIONAL_OFFICE_NAME) %>%
  summarise(Total_Items = sum(ITEMS)) %>%
  arrange(desc(Total_Items))

items_by_region

# ------------------------------------------
# COST BY REGION
# ------------------------------------------

cost_by_region <- df %>%
  group_by(REGIONAL_OFFICE_NAME) %>%
  summarise(Total_Cost = sum(ACTUAL_COST)) %>%
  arrange(desc(Total_Cost))

cost_by_region

# ------------------------------------------
# REGIONAL ITEMS CHART
# ------------------------------------------

ggplot(items_by_region,
       aes(x = reorder(REGIONAL_OFFICE_NAME, Total_Items),
           y = Total_Items)) +
  
  geom_col(fill = nhs_light_blue) +
  
  coord_flip() +
  
  scale_y_continuous(
    labels = comma
  ) +
  
  labs(
    title = "Total Antidepressant Items by Region",
    x = "Region",
    y = "Items Prescribed"
  ) +
  
  theme_minimal()

# ------------------------------------------
# REGIONAL COST CHART
# ------------------------------------------

ggplot(cost_by_region,
       aes(x = reorder(REGIONAL_OFFICE_NAME, Total_Cost),
           y = Total_Cost)) +
  
  geom_col(fill = nhs_dark_blue) +
  
  coord_flip() +
  
  scale_y_continuous(
    labels = label_number(scale = 1e-6, suffix = "M")
  ) +
  
  labs(
    title = "Total Antidepressant Cost by Region",
    x = "Region",
    y = "Cost (£)"
  ) +
  
  theme_minimal()

# ==========================================
# SAVE CHARTS
# ==========================================

ggsave("top_5_antidepressants.png", width = 10, height = 6)

ggsave("cost_by_region.png", width = 10, height = 6)

# ==========================================
# KEY FINDINGS
# ==========================================

cat("Most prescribed antidepressant:",
    top_10_drugs$DRUG[1], "\n")

cat("Highest cost antidepressant:",
    top_10_cost$DRUG[1], "\n")

cat("Highest prescribing volume region:",
    items_by_region$REGIONAL_OFFICE_NAME[1], "\n")

cat("Highest prescribing cost region:",
    cost_by_region$REGIONAL_OFFICE_NAME[1], "\n")

