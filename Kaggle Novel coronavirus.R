rm(list =ls()) #removes all elements stored previously
library(Hmisc) #import


data <- read.csv("D:/R/COVID19_line_list_data.csv")
describe(data) #Hmisc command

#cleaned up death column
data$death_dummy = as.integer(data$death !=0)

#death rate
sum(data$death_dummy)/ nrow(data)

#age
#claim : people who die are older
dead = subset(data, death_dummy==1)
alive = subset(data, death_dummy==0)

mean(dead$age , na.rm = TRUE)
mean(alive$age, na.rm = TRUE)
#is this statistically significant?

t.test(alive$age, dead$age, alternative = "two.sided",
       conf.level = 0.95
       )
#normally if p-value < 0.05 we reject the null hypothesis
#here p-value ~ 0 we reject the null hypothesis and
#conclude that this is statistically significant



#gender
#claim : gender has no effect
men = subset(data, gender=="male")
women = subset(data, gender == "female")

mean(men$death_dummy , na.rm = TRUE)
mean(women$death_dummy, na.rm = TRUE)
#is this statistically significant?

t.test(men$death_dummy, women$death_dummy, alternative = "two.sided",
       conf.level = 0.99)
#men have from 0.8% to 8.8% higher chance of dying
#normally if p-value = 0.002 < 0.05 we reject the null hypothesis
#here p-value ~ 0 we reject the null hypothesis and
#conclude that this is statistically significant


