

#Guys if you are seeing this you need to first install all the packages. Link repository me hai




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
