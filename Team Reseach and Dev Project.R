

#Guys if you are seeing this you need to first install all the packages. Link repository me hai


library(pacman)  

pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, 
               ggvis, httr, lubridate, plotly, rio, rmarkdown, shiny, 
               stringr, tidyr)

rio_csv <- import("https://raw.githubusercontent.com/Zain-Butt20/Team-Research-and-Dev-Project-A13-7COM1079/refs/heads/main/Data%20Science%20Salary%202021%20to%202023.csv")

head(rio_csv)
options(scipen = 999)

#SAVE EACH CLASS OF EXPERIENCE LEVEL INDEPENDENTLY
entry_level <- rio_csv$salary_in_usd [rio_csv$experience_level == "EN"]
experienced_level <- rio_csv$salary_in_usd [rio_csv$experience_level == "EX"]
mid_level <- rio_csv$salary_in_usd [rio_csv$experience_level == "MI"]
senior_level <- rio_csv$salary_in_usd [rio_csv$experience_level == "SE"]

#PLOT EACH LEVEL SEPERATELY AGAINST SALARY
hist(entry_level,breaks=20, col = "red",main = "Entry level's Salary")
hist(mid_level,breaks=20, col = "red",main = "Mid level's Salary")
hist(senior_level,breaks=20, col = "red",main = "Senior level's Salary")
hist(experienced_level,breaks=20, col = "red",main = "Experienced level's Salary")


#...............................................
#checking normality

options(scipen = 999)
h<- hist(rio_csv$salary_in_usd, breaks =20, col = "blue",main = "Experience Level's Salary",xlab = "Salaries in USD")

#Histogram with the bell curve showing normality

y <- rio_csv$salary_in_usd
x <- seq(0,400000,1)
mn <-mean(y)
sdev <- sd(y)
yn <- dnorm(x, mean=mn, sd=sdev)
box.size <- diff(h$mids[1:2]) * length(y)
yn <- yn * box.size

lines(x, yn, col="red")


boxplot(rio_csv$salary_in_usd ~ rio_csv$experience_level,col= topo.colors(4), xlab= "Experience levels", ylab= "salary", main="Salaries vs Experience Levels")
legend(x="topleft", legend=c("EN: Entry","EX: Experienced","MI: Mid","SE: Senior"))
#data is in bell shape so use pairwise student T test

pairwise_t_result <- pairwise.t.test(rio_csv$salary_in_usd, rio_csv$experience_level, p.adjust.method = "bonferroni")

print(pairwise_t_result)

#We are not 100% sure it is normal data so we can use wilcox pairwise test as well

pairwise_result <- pairwise.wilcox.test(rio_csv$salary_in_usd, rio_csv$experience_level,paired = FALSE, p.adjust.method = "bonferroni") 
                                        
print(pairwise_result)
