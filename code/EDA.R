### ---------------------------------------------------------------------------------------------------------- ###
### 2. Exploratory Data Analysis ----------------------------------------------------------------------------- ###
### ---------------------------------------------------------------------------------------------------------- ###

### --- 2.1 Countries represented in the data ---------------------------------------------------------------- ###
# Country represented in the data:
unique(dat1$V2)


### --- 2.2 Sample sizes for each country -------------------------------------------------------------------- ###
# Sample size of each country
table(dat1$V2)


### --- 2.3 Report of means, medians, standard deviations, and ranges of each continuous variable ------------ ###
# The means, medians, standard deviations, and ranges of each continuous variable.
dat2                    <- dat1[ ,c("V10", "V11","V23", "V59", "V242", "V248")]
sd_subset               <- lapply(dat2, FUN = sd)
mean_subset             <- lapply(dat2, FUN = mean)
median_subset           <- lapply(dat2, FUN = median)
max_subset              <- lapply(dat2, FUN = max)
min_subset              <- lapply(dat2, FUN = min)

descriptives_df         <- do.call(rbind, Map(data.frame,mean=mean_subset, median=median_subset, sd=sd_subset))
descriptives_df$range   <- paste(min_subset, "-", max_subset)
View(descriptives_df)


### --- 2.4 Frequency tables of each categorical variable ---------------------------------------------------- ###
# Frequency table for Categorical Variable:
View(table(dat1$V2))    # Frequency table for Country
View(table(dat1$V57))   # Frequency table for Marital Status
View(table(dat1$V240))  # Freqeuncy table for Sex


### --- 2.5 Histograms of each variable ---------------------------------------------------------------------- ###
# Histogram for Each Variable
## Histogram for Country
dat1$Country = as.character(dat1$V2, levels = c('156', '276', '356', '643', '840'), labels = c('China', 'Germany', 'India', 'Russia', 'USA'))
dat1$Country = factor(dat1$V2, levels = c('156', '276', '356', '643', '840'), labels = c('China', 'Germany', 'India', 'Russia', 'USA'))
plot(dat1$Country, main='Countries', las=1, col= c("#333333"))
## Histogram for Feeling of Happiness
dat1$FoH = as.character(dat1$V10, levels = c('1', '2', '3', '4'), labels = c('Very Happy', 'Rather Happy', 'Not Very Happy', 'Not Happy at All'))
dat1$FoH = factor(dat1$V10, levels = c('1', '2', '3', '4'), labels = c('Very Happy', 'Rather Happy', 'Not Very Happy', 'Not Happy at All'))
plot(dat1$FoH, main='Feeling of Happiness', las=1, col=c("#333333"))
## Histogram for State of Health
dat1$SoH = as.character(dat1$V11, levels = c('1', '2', '3', '4'), labels = c('Very Good', 'Good', 'Fair', 'Poor'))
dat1$SoH = factor(dat1$V11, levels = c('1', '2', '3', '4'), labels = c('Very Good', 'Good', 'Fair', 'Poor'))
plot(dat1$SoH, main='State of Health', las=1, col=c("#333333"))
## Histogram for Satifaction with Life
dat1$SwL = as.character(dat1$V23, levels = c('1', '2', '3', '4','5','6','7','8','9','10'), labels = c('Completely Dissatisfied', '2', '3', '4','5','6','7','8','9','Completely Satisfied'))
dat1$SwL = factor(dat1$V23, levels = c('1', '2', '3', '4','5','6','7','8','9','10'), labels = c('Completely\nDissatisfied', '2', '3', '4','5','6','7','8','9','Completely\nSatisfied'))
plot(dat1$SwL, main='Satisfaction with Life', las=1, col=c("#333333"))
## Histogram for Marital Status
dat1$Marital = as.character(dat1$V57, levels = c('1', '2', '3', '4', '5', '6'), labels = c('Married', 'Living Together', 'Divorced', 'Separated', 'Widowed', 'Single'))
dat1$Marital = factor(dat1$V57, levels = c('1', '2', '3', '4', '5', '6'), labels = c('Married', 'Living Together', 'Divorced', 'Separated', 'Widowed', 'Single'))
plot(dat1$Marital, main='Marital Status', las=1, col=c("#333333"))
## Histogram for Children
dat1$Child = as.character(dat1$V58, levels = c('0', '1', '2', '3', '4', '5', '6', '7', '8'), labels = c('No Children', '1', '2', '3', '4', '5', '6', '7', '8 or more children'))
dat1$Child = factor(dat1$V58, levels = c('0', '1', '2', '3', '4', '5', '6', '7', '8'), labels = c('No Children', '1', '2', '3', '4', '5', '6', '7', '8 or more\nchildren'))
plot(dat1$Child, main='Children', las=1, col=c("#333333"))
## Histogram for Satisfaction with Financial Situation of Household
dat1$Fstat = as.character(dat1$V59, levels = c('1', '2', '3', '4','5','6','7','8','9','10'), labels = c('Completely Dissatisfied', '2', '3', '4','5','6','7','8','9','Completely Satisfied'))
dat1$Fstat = factor(dat1$V59, levels = c('1', '2', '3', '4','5','6','7','8','9','10'), labels = c('Completely\nDissatisfied', '2', '3', '4','5','6','7','8','9','Completely\nSatisfied'))
plot(dat1$Fstat, main='Satisfaction with Financial Situation', las=1, col=c("#333333"))
## Histogram for Sex
dat1$Sex = as.character(dat1$V240, levels = c('1', '2'), labels = c('Male', 'Female'))
dat1$Sex = factor(dat1$V240, levels = c('1', '2'), labels = c('Male','Female'))
plot(dat1$Sex, main='Sex', las=1, col=c("#333333"))
## Histogram for Age
hist(dat1$V242, xlab = "Age", ylab = "", main= "Age", col = c("#333333"))
## Histogram for Education Level
dat1$Edu = as.character(dat1$V248, levels = c('1','2','3','4','5','6','7','8','9'), labels = c('No Formal Education','Incomplete Primary School', 'Complete Primary School', 'Incomplete Secondary School: Technical/Vocational Type', 'Complete Secondary School: Technical/Vocational Type','Incomplete Secondary School: University-preparatory Type','Complete Secondary School: University-preparatory Type','University-Level: without degree','University: with degree'))
dat1$Edu = factor(dat1$V248, levels = c('1','2','3','4','5','6','7','8','9'), labels = c('No Formal\nEducation','Incomplete\nPrimary School', 'Complete\nPrimary School', 'Incomplete\nTechnical/Vocational', 'Complete\nTechnical/Vocational','Incomplete\nUniv-prep','Complete\nUniv-prep','University:\nwithout degree','University:\nwith degree'))
plot(dat1$Edu, main='Education Level', las=1, col=c("#333333"))
## Removing extra column
dat1 = subset(dat1, select = -c(Country, FoH, SoH, SwL, Marital, Child, Fstat, Sex, Edu))


### --- 2.6 Kernel density plots of each continuous variable ------------------------------------------------- ###
# Kernel Density Plot for Each Continous Variable
plot(density(dat1$V10)) 
plot(density(dat1$V11)) 
plot(density(dat1$V23)) 
plot(density(dat1$V59)) 
plot(density(dat1$V242)) 
plot(density(dat1$V248)) 
