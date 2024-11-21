library(pacman)  # No message.

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
hist(entry_level,breaks=20, col = "red")
hist(mid_level,breaks=20, col = "red")
hist(senior_level,breaks=20, col = "red")
hist(experienced_level,breaks=20, col = "red")


#...............................................
#checking normality
boxplot(rio_csv$salary_in_usd ~ rio_csv$experience_level, xlab= "experience levels", ylab= "salary", main="LOL")
options(scipen = 999)
hist(rio_csv$salary_in_usd, breaks =20, col = "blue")
#data is in bell shape so use pairwise student T test

pairwise_t_result <- pairwise.t.test(rio_csv$salary_in_usd, rio_csv$experience_level, p.adjust.method = "bonferroni")

print(pairwise_t_result)
