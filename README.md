# King County Housing Market Analysis

## Introduction
This project analyzes the housing market in King County, USA, using data from the "House Sales in King County, USA" dataset available on Kaggle ([link](https://www.kaggle.com/datasets/harlfoxem/housesalesprediction)). The dataset includes properties sold between May 2014 and May 2015 and contains information like price, bedrooms, bathrooms, square footage of living space, and the number of floors.

## Analysis
The analysis involves:
1. **Descriptive Statistics**:
   - Summary statistics for variables like price, bedrooms, bathrooms, square footage, and floors.
   - Example: The average house price is $540,088, with a significant range indicating market diversity.

2. **Correlation Analysis**:
   - Evaluates relationships between variables such as price and square footage, showing strong positive correlations.
   - A heatmap visually represents these relationships.

3. **Regression Modeling**:
   - Predicting house prices using multiple regression models with variables like square footage, bedrooms, and bathrooms.
   - Example findings:
     - Each additional square foot increases price by ~$314.
     - Additional bathrooms significantly increase property value.

4. **Visualizations**:
   - Scatter plots with regression lines for price vs. square footage and price vs. number of bedrooms.

## Conclusion
The analysis highlights key drivers of house prices in King County:
- Strong positive impact of square footage and bathrooms on price.
- Moderate influence of bedrooms and floors.
While the selected features provide meaningful insights, factors like location and market conditions are excluded, which could improve predictions.

## Dataset
- Source: [Kaggle](https://www.kaggle.com/datasets/harlfoxem/housesalesprediction).
- Dataset file: `kc_house_data.csv`.

## How to Run
1. Open the `Module5.R` script in RStudio.
2. Ensure all required libraries are installed (see the script for details).
3. Run the script to generate analysis and visualizations.
