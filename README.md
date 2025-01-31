# Suicide Rate Analysis & Prediction in R  

## Project Overview  
This project analyzes global suicide rates using statistical methods and machine learning techniques in R. The dataset is preprocessed, visualized, and modeled to identify trends and predict suicide rates per 100k population.  

## Dataset  
The project utilizes a CSV file (`suicidedataset.csv`) containing information on suicides across various countries, years, and demographics. The dataset includes features such as:  
- **Country, Year, and Generation**  
- **Suicide rates per 100k population**  
- **GDP per capita**  
- **Total suicide numbers and population**  

## Key Steps  

### 1. Data Preprocessing  
- Loaded the dataset and removed unnecessary columns.  
- Checked for missing values and converted categorical features into factors.  
- Created dummy variables for categorical features using the `fastDummies` package.  
- Standardized numerical variables for model training.  

### 2. Exploratory Data Analysis (EDA)  
- Computed key statistics: mean, median, mode, variance, standard deviation.  
- Visualized data using histograms and scatter plots to understand trends.  

### 3. Regression Modeling  
- Built a **linear regression model** to predict suicide rates per 100k population based on demographic and economic factors.  
- Evaluated model performance using summary statistics and **RMSE (Root Mean Square Error)**.  

### 4. Predictions & Visualization  
- Used the trained model to predict suicide rates.  
- Plotted actual vs. predicted values to assess model accuracy.  

## Results  
- The regression model provided insights into how **GDP, population, and other factors** influence suicide rates.  
- The **RMSE of 9.14** indicates the model’s predictive capability.  

## Technologies Used  
- **R** for data analysis and modeling  
- **fastDummies** for creating dummy variables  
- **ggplot2** (optional) for enhanced visualizations  
- **Base R functions** for statistical analysis and plotting  

## How to Run the Project  

### Clone the repository:  
```bash
git clone <repo-link>
```

### Open the R script and update the dataset path:  
```r
sui <- read.csv("path/to/suicidedataset.csv")
```

### Run the script to perform analysis and generate predictions.  

## Next Steps & Improvements  
- Implement **feature selection** to improve model performance.  
- Explore alternative models such as **Random Forest** or **XGBoost**.  
- Conduct deeper **time-series analysis** to identify long-term trends.  

## Disclaimer  
This project is for **educational and analytical purposes only**. The dataset may not reflect real-world suicide trends and should be interpreted with caution.  
