
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
plot(rio_csv$job_title)


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
     