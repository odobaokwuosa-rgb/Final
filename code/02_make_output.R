here::i_am(
  "code/02_make_output.R"
)

#Load packages
library(gtsummary)
library(dplyr)
library(ggplot2)

#read dataset
finaldataset <- readRDS("data/dataset.rds")

# Table One
table_one <- finaldataset |>
  filter(year == "2000") |> 
  select("region", "income_level") |>
  tbl_summary(by = region,
              label =  list(
                "income_level" ~ "Income Level"
              )) |>
  modify_spanning_header(c("stat_1", "stat_2") ~ "**Distribution of Income Level by Region in the year 2000**") |>
  add_overall()

#Figure One
figure1 <- finaldataset %>% 
  filter(year == 2000) %>% 
  group_by(region)%>%
  summarise(mean_le = mean(life_expectancy, na.rm = TRUE)) %>%
  ggplot(aes(x = reorder(region, mean_le), y = mean_le, fill = region)) +
  geom_col() +
  labs(x = "WHO Region",
       y = "Mean Life Expectancy (years)",
       title = "Mean Life Expectancy by Region in the year 2000")+ 
  geom_text(aes(label = round(mean_le, 0)), vjust = -0.3) +
  theme_minimal()+
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank())

# Save table and figure
saveRDS(
  table_one,
  file = here::here("output", "table_one.rds")
)

saveRDS(
  figure1,
  file = here::here("output", "figure1.rds")
)

