# Prepare workspace
rm(list = ls())

# Set working directory
setwd("/Users/upar/Dropbox/00-SCHOOL/0-University/0-Semesters/2022-20/6-Big_Data_and_ML_for_Applied_Economics/2-Evaluaciones/Problem_Sets/Problem_Set-1/BDML-ps1/results") #GUSTAVO

# Install Groundhog to ensure replicability 
install.packages("groundhog", repos = "http://cran.us.r-project.org")
library(groundhog)

# Load all required packages
pkgs=c("rvest", "dplyr", "caret", "kableExtra", "tidyverse", "stargazer")
groundhog.library(pkg = pkgs, "2022-08-31")

# Scrape the data
url_test <- paste0("https://ignaciomsarmiento.github.io/GEIH2018_sample/pages/geih_page_", 1:10, ".html")
geih <- data.frame()
for (url in url_test) {
  print(url)
  source_table <- read_html(url) %>%
    html_table()
  temp <- as.data.frame(source_table)
  print(nrow(temp))
  geih <- rbind(geih, temp)
}

#Check working directory
##getwd() 
write.csv(geih, file = "encuesta.csv")