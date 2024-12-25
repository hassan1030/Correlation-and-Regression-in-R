#Clearing the environment before running the code
cat("\014") #Clears the console
rm(list = ls()) #Clears the global environment 
try(dev.off(dev.list()["R Studio"]), silent = TRUE) #Clears the plots
try(p_unload(p_loaded(), character.only = TRUE), silent = TRUE) #Clears package
options(scipen = 100) #disables scientific notation for entire R session

library(ggplot2)
library(tidyverse)
library("psych")
library(readr)
library(dplyr)
library(broom)

#Part 1
kc_house_data <- read.csv("/Users/muhammadhassanzahoor/Desktop/ALY 6010/Module 5 Practice/kc_house_data.csv")

#Understadning the data
str(kc_house_data)
head(kc_house_data)
summary(kc_house_data)
describe_data <- describe(kc_house_data)
describe_data

#Selecting the relevant 5 variables
selected_columns <- kc_house_data[, c("price", "bedrooms", "bathrooms", "sqft_living", "floors") ]

#Compute the correlation matrix
cor_matrix <- cor(selected_columns)
cor_matrix

# Transform the correlation matrix into a long format
long_cor_matrix <- as.data.frame(as.table(cor_matrix))
long_cor_matrix

#Renaming the columns for better clarity
names(long_cor_matrix) <- c ("Variable1", "Variable2", "Correlation")

# Plotting the correlation heatmap
ggplot(data = long_cor_matrix, aes(Variable1, Variable2, fill = Correlation)) + 
  geom_tile() +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson\nCorrelation") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, size = 12, hjust = 1),
        axis.text.y = element_text(size = 12)) +
  coord_fixed()

#Part 2

#I am using price as the outcome variable and the other variables like bedrooms and bathrooms are predictors

model1 <- lm(price ~ sqft_living + bedrooms + bathrooms + floors, data = kc_house_data)
table1 <- tidy(model1)
table1

model2 <- lm(price ~ bathrooms + floors, data = kc_house_data)
table2 <- tidy(model2)
table2

model3 <- lm(price ~ bedrooms + bathrooms, data = kc_house_data)
table3 <- tidy(model3)
table3

# Visualization 1: Price vs. Square Footage of Living Area
ggplot(kc_house_data, aes(x = sqft_living, y = price)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", color = "blue") +
  labs(title = "Price vs. Square Footage of Living Area",
       x = "Square Footage of Living Area",
       y = "Price")

# Visualization 2: Price vs. Number of Bedrooms
ggplot(kc_house_data, aes(x = bedrooms, y = price)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "Price vs. Number of Bedrooms",
       x = "Number of Bedrooms",
       y = "Price")
