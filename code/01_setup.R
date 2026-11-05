here::i_am(
  "code/01_setup.R"
)

dataset <- read.csv("data/health_indicators.csv")

saveRDS(
  dataset,
  file = here::here("data", "dataset.rds")
)
