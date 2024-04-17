library(ggplot2)
library(reshape2)

data <- read.csv("/Users/gloriafargose/Downloads/cost_of_living_usa.csv")

cost_columns <- c('Housing', 'Food', 'Transportation', 'Healthcare', 'Other.Necessities', 'Childcare', 'Taxes')

cost_data <- data[, cost_columns]

cost_data_melted <- melt(cost_data)

ggplot(cost_data_melted, aes(x=variable, y=value)) +
  geom_bar(stat="identity", fill= "steelblue") +
  labs(x = "Cost Categories", y = "Total Cost (Billions)", title = "Total Cost by Categories") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_y_continuous(labels = function(x) format(x/100000000, scientific = FALSE))

