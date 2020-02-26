### ---------------------------------------------------------------------------------------------------------- ###
### 4. Predictive Modeling ----------------------------------------------------------------------------------- ###
### ---------------------------------------------------------------------------------------------------------- ###

### --- Question 1 and Question 2 ---------------------------------------------------------------------------- ###
# Transform the categorical features in factor
dat1$maritalStatus    <- factor(dat1$V57, levels = c(1, 2, 3,4,5,6), labels = c("Married","Livinig Together as Married","Divorced", "Seperated","Widowed","Single"))
dat1$SexF             <- factor(dat1$V240, levels = c(1,2),labels=c("Male","Female"))
dat1$Country_name # this variable has been created for the task before.
# Divide the data to train and test set
ind                   <- sample(1 : nrow(dat1))
train                 <- dat1[ind[1 : 10114], ]
test                  <- dat1[ind[10115 : nrow(dat1)], ]

# Linear regression for model 1: 
## Sex, Satisfaction with Life, and Country on Satisfaction with Financial Situation of Household 
out1                  <- lm(V59~SexF + V23 + Country_name-1,data=dat1)
summary.cellMeans(out1)
# Linear regression for model 2: 
## Sex, Marital Status, and Children on Satisfaction with Financial Situation of Household 
out2                  <- lm(V59~SexF + maritalStatus + V58 -1, data=dat1) 
summary.cellMeans(out2)
# Linear regression for model 1: 
## Sex, Age, and Education Level on Satisfaction with Financial Situation of Household 
out3                  <-lm(V59~SexF + V242 + V248 -1,data=dat1)
summary.cellMeans(out3)


### --- 4.3 Cross-validation error (CVE) from each model ----------------------------------------------------- ###
# 10-fold Cross Validation on each model
cve2                   <- cv.lm(data   = train,
                                models = c("V59~SexF+V23+Country_name - 1",
                                           "V59~SexF+maritalStatus+V58 -1",
                                           "V59~SexF+V242+V248 -1"),
                                K      = 10,
                                seed   = 235711)
cve2


### --- 4.4 Best performing model ---------------------------------------------------------------------------- ###
# Return the lowest MSE among 3 models
cve2[which.min(cve2)]


### --- 4.5 Estimated prediction error of the best performing model ------------------------------------------ ###
# Estimated Prediction Error of Model 1
p1                   <- predict(out1, newdata = test)
MSE(y_pred=p1,y_true=test$V59)
