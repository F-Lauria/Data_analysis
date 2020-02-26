# Data Analysis - R

Data analysis in R with data from Wave 6 of the World Values Survey. Official data can be found [here](https://bit.ly/2VoPO8L). However, for this project a specific Data Processing has been done: [here](/data) the processed data.

## Tablet of Contents
* [General info](#general-info)
* [Tasks and report](#task-and-report)
* [Code](#code)
* [Technologies](#technologies)
* [Setup](#setup)

## General info
This is a university project from the course of [Statistics and Methodology](https://bit.ly/3a48pLh). The overall goal is to choose a set of variables (5) among hundreds of them in the World Values Survey and use these variables in a Multiple Linear Regression (MLR) method for both, inference and prediction. In the first case, the goal is to look for significance effect on *heppiness* while for prediction, the goal is to predict *FinStat*, that is, financial situation.

## Tasks and report
The full description of the project can be found [here](/docs/Description.pdf). As previously mentioned, there are two main tasks for this project: inference and prediction with MLR. In addition to that, a [report](/docs/Report.pdf) has been done. In the report you can find all the solutions and main insights.   

## Code
* [Data Cleaning](/code/Data_cleaning.R)
* [Exploratory Data Analysis](/code/EDA.R)
* [Multiple Linear Regression](/code/Multiple_linear_regression.R)
* [Predictive Modelling](/code/Predictive_modelling.R)

If you want to run everything, [here](/code/All.R) you can find all the code.

## Technologies
All the project was created with:
* R

## Setup
For running this code you need:
* MASS library
* MLmetrics library

On top of that, other custum [functions](/code/studentFunctions.R) were used.

