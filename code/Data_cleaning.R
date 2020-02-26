# Defining data directory and load necessary library
dataDir       <- "../data/"
filename      <- "wvs_data.rds"
source("studentFunctions.R")
library(MASS)
library(MLmetrics)
# Set the seed
set.seed(235711)
#  Read the data ###
dat0          <-  readRDS(paste0(dataDir,filename))


### ---------------------------------------------------------------------------------------------------------- ###
### -----------------------------------------   end of Preliminary   ----------------------------------------- ###
### ---------------------------------------------------------------------------------------------------------- ###


### ---------------------------------------------------------------------------------------------------------- ###
### ----------------------------------------------   Question   ---------------------------------------------- ###
### ---------------------------------------------------------------------------------------------------------- ###


### ---------------------------------------------------------------------------------------------------------- ###
### 1. Data Cleaning ----------------------------------------------------------------------------------------- ###
### ---------------------------------------------------------------------------------------------------------- ###

### --- 1.1 List all variable to be used --------------------------------------------------------------------- ###
# Create subset for the data set
dat1                    <- dat0[, c("V2", "V10", "V11","V23","V57", "V58", "V59", "V240","V242","V248")]


### --- 1.2 Proportion of missing data for each variable ----------------------------------------------------- ###
# Proportion of Missing Data
cm                      <- colSums(is.na(dat1))
pm                      <- colMeans(is.na(dat1))
cm
pm


### --- 1.3 Check for Univariate Outliers -------------------------------------------------------------------- ###
# Detect Outliers using Boxplot Outliers
Outliers                <- lapply(dat1[ , c("V10", "V11","V23", "V58", "V59", "V242","V248")], FUN = bpOutliers)
# Report the Possible and Probable Value
Outliers$V10$probable
Outliers$V10$possible
Outliers$V11$probable
Outliers$V11$possible
Outliers$V23$probable
Outliers$V23$possible
Outliers$V58$probable  -> childrenOl #save into a variable the outliers to treat
Outliers$V58$possible
Outliers$V59$probable
Outliers$V59$possible
Outliers$V242$probable
Outliers$V242$possible
Outliers$V248$probable
Outliers$V248$possible
boxplot(dat0$V58, range = 3)


### --- 1.4 Treatment of univariate outliers ----------------------------------------------------------------- ###
# Winsorize the univariate outliers
children0       <- dat1$V58 #extract the children feature 
children1       <- winsorizeOutliers(x = children0, ol = childrenOl)
# Replace the value in subset
dat1$V58        <- winsorizeOutliers(x = children0, ol = childrenOl)


### --- 1.5 Check for multivariate outliers ------------------------------------------------------------------ ###
# Split only the continous variable to detect Multivariate Outliers
dat2            <- dat1[ ,c("V10", "V11","V23", "V58", "V59", "V242","V248")]
rownames(dat2)  <- NULL # restart the row number
prob            <- 0.99
ratio           <- 0.75
# Flag outliers using Mahalanobis Distance
## Calculate statistics to obtain MEAN and COVARIANCE
stats           <- cov.mcd(dat2, quantile.used = floor(ratio * nrow(dat2)))
## Apply Mahalanobis formula with split data, mean and covariance
MD              <- mahalanobis(x = dat2, center = stats$center, cov = stats$cov)
## Finding the CRITERIA for cutoff value
criteria        <- qchisq(prob, df = ncol(dat2))
## Flagging the multivariate outliers
dat1$MD = round(MD, 3)                      # we round Mahalanobis distance to have usable values.
dat1$OL = FALSE                             # we set an entire new column.
dat1$OL[dat1$MD > criteria] = TRUE          # we set to TRUE the values bigger than the critera.
## Counting Multivariate Outliers
sum(dat1$OL == TRUE)                        # returns the number of row flagged as outliers. 
sum(dat1$OL == FALSE)                       # returns the number of row is not flagged as outliers. 
## Save the flagged row numbers for reporting purpose
row_flagged     <- data.frame(which(dat1$OL == TRUE))
# Removing the row flagged as outliers
dat1 = dat1[dat1$OL == FALSE,]
dat1 = subset(dat1, select = -c(OL, MD))    # remove extra column produced when detecting multivariate outliers

