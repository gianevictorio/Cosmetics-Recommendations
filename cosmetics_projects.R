# First I uploaded the cosmetics.csv I downloaded from Kaggle 
# https://www.kaggle.com/datasets/kingabzpro/cosmetics-datasets
# Then renamed it and viewed the data
cosmetics <- read.csv("cosmetics.csv")
head(cosmetics)

# I installed dplyr to remove one of the columns from the data to clean it
install.packages("dplyr")
library(dplyr)
cosmetics <- cosmetics %>% select(-Ingredients)

# Then check for missing values 
colSums(is.na(cosmetics))

# Removed any rows with no values 
cosmetics <- na.omit(cosmetics)

# Removed duplicates 
cosmetics <- unique(cosmetics)

# Once data is clean, I begun the visualizations
install.packages("ggplot2")
library(ggplot2)

# Plotted a bar chart to compare the types of cosmetics
# to the price it is sold for
ggplot(data = cosmetics) +
  geom_bar(mapping = aes(x = Label), fill='pink') + 
  labs(
    title = "Types of Cosmetics Sold",
    x = "Category",
    y = "Count"
  ) + 
  theme(plot.title = element_text(size=15, face = 'bold')
  )
  
# Plotted a scatterplot to see the relationship with price and rank
ggplot(data = cosmetics) +
  geom_point(mapping = aes(x = Price, y = Rank)) +
  labs(
    title = "Rank vs Price of Cosmetics",
    x = "Price",
    y = "Rank"
  ) + 
  theme(plot.title = element_text(size=15, face = 'bold')
  )
