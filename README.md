# Instructions

The current repository contains steps to complete Coursera Exploratory Data Analysis Week 1 exercise. It assumes that you have unpacked the original data set in the current directory as file **household_power_consumption.txt**. Following files have been provided:

* *read_dataset.R* : R script which will read the original dataset and produce needed dataset subset for the plotting exercise
* *plot1.R* : R script to create plot1
* *plot2.R* : R script to create plot2
* *plot3.R* : R script to create plot3
* *plot4.R* : R script to create plot4

Before sourcing various plotting R scripts as instructed for the exercise, you need to first source R script *read_dataset.R*. The script only needs to read once. The script does not actually parse the data set but only defines the infrastructure needed later on when the data is actually needed. Various plotting scripts will access the infrastructure and would read the dataset. Once the dataset is in memory subsequent calls to plotting functions will access the in memory data.
