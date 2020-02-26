### ---------------------------------------------------------------------------------------------------------- ###
### 3. Multiple Linear Regression ---------------------------------------------------------------------------- ###
### ---------------------------------------------------------------------------------------------------------- ###

### --- Question 1 to Question 3 ----------------------------------------------------------------------------- ###
# Insert a new column for Country Name
dat1$Country_name <- factor(dat1$V2, levels = c(840, 276, 643,156,356), labels = c("USA", "Germany", "Russia","China","India"))
# Multiple Linear Regression for Country on the Feeling of Happiness (V10)
out1 <- lm(V10 ~ Country_name -1, data = dat1)
summary.cellMeans(out1)


### --- Question 4 to Question 7 ----------------------------------------------------------------------------- ###
# Multiple Linear Regression for Country after controling for Health (V11) on the Feeling of Happiness (V10)
out2 <- lm(V10 ~ Country_name + V11 -1, data = dat1)
summary.cellMeans(out2)
