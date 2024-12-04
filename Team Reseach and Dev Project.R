

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
hist(entry_level,breaks=20, col = "red",main = "Entry level vs Salary")
hist(mid_level,breaks=20, col = "red",main = "Mid level vs Salary")
hist(senior_level,breaks=20, col = "red",main = "Senior level vs Salary")
hist(experienced_level,breaks=20, col = "red",main = "Experienced level vs Salary")


#...............................................
#checking normality

options(scipen = 999)
hist(rio_csv$salary_in_usd, breaks =20, col = "blue")
#Histogram with the bell curve showing normality

hist(rio_csv$salary_in_usd, breaks =20, col = "blue", prob = TRUE)

x2 <- seq(min(rio_csv$salary_in_usd), max(rio_csv$salary_in_usd), length = 40)
x3 <- dnorm(x2, mean = mean(rio_csv$salary_in_usd), sd = sd(rio_csv$salary_in_usd))
hist(rio_csv$salary_in_usd, prob = TRUE,breaks = 20, col = "blue",
     ylim = c(0, max(x3)),
     main = "Histogram")
lines(x2, fun, col = 2, lwd = 2)




boxplot(rio_csv$salary_in_usd ~ rio_csv$experience_level, xlab= "Experience levels", ylab= "salary", main="Salaries vs Experience Levels")

#data is in bell shape so use pairwise student T test

pairwise_t_result <- pairwise.t.test(rio_csv$salary_in_usd, rio_csv$experience_level, p.adjust.method = "bonferroni")

print(pairwise_t_result)

#We are not 100% sure it is normal data so we can use wilcox pairwise test as well

pairwise_result <- pairwise.wilcox.test(rio_csv$salary_in_usd, rio_csv$experience_level,paired = FALSE, p.adjust.method = "bonferroni") 
                                        
print(pairwise_result)
