here::i_am("code/02maketable.R")

data_for_table <- readRDS(
  file = here::here("csv-datasets/simulated_data_for_table.RDS")
)

library(dplyr)
library(broom)
library(gt)

#Running the logistic regression of jobs
logistic_model_job <- glm(F_attendance ~ Job, 
                          family = binomial(link = "logit"), 
                          data = data_for_table)

#Running the logistic regression of interest level
logistic_model_interest <- glm(F_attendance ~ Interest_Level, 
                               family = binomial(link = "logit"), 
                               data = data_for_table)

#Updating the term names to be cleaner
logistic_model_interest$term <- gsub("Interest_LevelNeutral", "Neutral", logistic_model_interest$term)
logistic_model_interest$term <- gsub("Interest_LevelVery interested", "Very interested", logistic_model_interest$term)

# Extract results from each model
results_job <- tidy(logistic_model_job) %>% mutate(Model = "Type of Job")
results_interest <- tidy(logistic_model_interest) %>% mutate(Model = "Interest Level")

# Combine results
combined_results <- bind_rows(results_job, results_interest) %>%
  select(Model, term, estimate, std.error, p.value)

combined_results <- combined_results %>%
  group_by(Model) %>%
  mutate(Model = ifelse(row_number() == 1, Model, "")) %>%
  ungroup()

combined_results <- combined_results %>%
  mutate(term = recode(term,
                       "(Intercept)" = "Intercept",
                       "JobArchitect" = "Architect",
                       "JobEntrepreneur" = "Entrepreneur",
                       "JobFarmer" = "Farmer",
                       "JobFisherman" = "Fisherman",
                       "JobSmall business" = "Small Business",
                       "Interest_LevelNeutral" = "Neutral",
                       "Interest_LevelVery interested" = "Very Interested"))

table <- combined_results %>%
  gt() %>%
  fmt_number(columns = c(estimate, std.error, p.value), decimals = 3) %>%
  cols_label(
    Model = "Independent Variable",
    term = "Coefficient",
    estimate = "Estimate",  # Ensure Estimate is clearly labeled
    std.error = "Std. Error",
    p.value = "P-Value"
  ) %>%
  tab_header(title = "Table 1: Results of the Logistic Regression Models of Attendance by Job Type and 
             Interest Level in the Program at Baseline")

saveRDS(
  table,
  file = here::here("outputs/table.RDS")
)

