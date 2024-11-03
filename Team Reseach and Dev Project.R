
#Guys if you are seeing this you need to first install all the packages. Link repository me hai


library(pacman)  # No message.

# Or, by using "pacman::p_load" you can use the p_load
# function from pacman without actually loading pacman.
# These are packages I load every time.
pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, 
               ggvis, httr, lubridate, plotly, rio, rmarkdown, shiny, 
               stringr, tidyr)

rio_csv <- import("C:/Users/Zain/Documents/Team Research and Dev Project/Data Science Salary 2021 to 2023.csv")
head(rio_csv)
plot(rio_csv$work_year)
plot(rio_csv$work_year, rio_csv$salary_in_usd)
hist(rio_csv$salary_in_usd)
plot(rio_csv$salary_in_usd)



ggplot(rio_csv, aes(x = experience_level, y = salary_in_usd, fill = experience_level)) +
  geom_boxplot() +
  labs(title = "Salary Distribution by Experience Level", x = "Experience Level", y = "Salary (USD)") +
  theme_minimal() +
  theme(legend.position = "none")



ggplot(rio_csv, aes(x = salary_in_usd, fill = experience_level)) +
  geom_histogram(binwidth = 5000, color = "black", alpha = 0.7) +
  labs(title = "Salary Distribution by Experience Level", x = "Salary (USD)", y = "Count") +
  theme_minimal() +
  facet_wrap(~experience_level)

ggplot(rio_csv, aes(x = experience_level, y = salary_in_usd, fill = experience_level)) +
  geom_line() +
  labs(title = "Salary Distribution by Experience Level", x = "Experience Level", y = "Salary (USD)") +
  theme_minimal() +
  theme(legend.position = "none")

ggplot(rio_csv, aes(x = experience_level, y = salary_in_usd, fill = experience_level)) +
  geom_point() +
  labs(title = "Salary Distribution by Experience Level", x = "Experience Level", y = "Salary (USD)") +
  theme_minimal() +
  theme(legend.position = "none")

ggplot(rio_csv, aes(x = experience_level, fill = experience_level)) +
  geom_bar() +
  labs(title = "Frequency of Experience Levels", x = "Experience Level", y = "Frequency") +
  theme_minimal() +
  theme(legend.position = "none") 

# SAVE CSV FILE TO DATAFRAME
df<- rio_csv
#SAVE EACH CLASS OF EXPERIENCE LEVEL INDEPENDENTLY
entry_level <- subset(df, experience_level == "EN")
experienced_level <- subset(df, experience_level == "EX")
mid_level <- subset(df, experience_level == "MI")
senior_level <- subset(df, experience_level == "SE")

#PLOT EACH LEVEL SEPERATELY AGAINST SALARY
ggplot(entry_level, aes(x = salary_in_usd)) +
  geom_histogram(binwidth = 5000, fill = "skyblue", color = "black") +
  labs(title = "Frequency of Salaries for Entry-Level Employees", x = "Salary (USD)", y = "Frequency") +
  theme_minimal()
ggplot(entry_level, aes(x = salary_in_usd)) +
  geom_freqpoly(binwidth = 5000, color = "blue", size = 1.2) +
  labs(title = "Frequency of Salaries for Entry-Level Employees", x = "Salary (USD)", y = "Frequency") +
  theme_minimal()

ggplot(experienced_level, aes(x = salary_in_usd)) +
  geom_histogram(binwidth = 5000, fill = "skyblue", color = "black") +
  labs(title = "Frequency of Salaries for Experinced-Level Employees", x = "Salary (USD)", y = "Frequency") +
  theme_minimal()
ggplot(experienced_level, aes(x = salary_in_usd)) +
  geom_freqpoly(binwidth = 5000, color = "blue", size = 1.2) +
  labs(title = "Frequency of Salaries for Experienced-Level Employees", x = "Salary (USD)", y = "Frequency") +
  theme_minimal()

ggplot(mid_level, aes(x = salary_in_usd)) +
  geom_histogram(binwidth = 5000, fill = "skyblue", color = "black") +
  labs(title = "Frequency of Salaries for Mid-Level Employees", x = "Salary (USD)", y = "Frequency") +
  theme_minimal()
ggplot(mid_level, aes(x = salary_in_usd)) +
  geom_freqpoly(binwidth = 5000, color = "blue", size = 1.2) +
  labs(title = "Frequency of Salaries for Mid-Level Employees", x = "Salary (USD)", y = "Frequency") +
  theme_minimal()


ggplot(senior_level, aes(x = salary_in_usd)) +
  geom_histogram(binwidth = 10000, fill = "blue", color = "black") +
  labs(title = "Frequency of Salaries for Senior-Level Employees", x = "Salary (USD)", y = "Frequency") +
  theme_minimal()
ggplot(senior_level, aes(x = salary_in_usd)) +
  geom_freqpoly(binwidth = 5000, color = "Red", size = 1.2) +
  labs(title = "Frequency of Salaries for Senior-Level Employees", x = "Salary (USD)", y = "Frequency") +
  theme_minimal()
