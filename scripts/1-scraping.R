####################################################
# Scraping
# author: Gustavo A. Castillo Alvarez
####################################################


# Prepare workspace -----------------------------------------------------------
rm(list = ls())

# Set working directory --------------------------------------------------------
setwd("/Users/upar/Dropbox/00-SCHOOL/0-University/0-Semesters/2022-20/6-Big_Data_and_ML_for_Applied_Economics/2-Evaluaciones/Problem_Sets/Problem_Set-1/BDML-ps1/stores/") 

# Install Groundhog to ensure replicability & load packages --------------------
install.packages("groundhog", repos = "http://cran.us.r-project.org")
library(groundhog)
groundhog.library("rvest", date = "2022-08-31")


# Scrape the data --------------------------------------------------------------
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

# Save scraped data to `stores` directory --------------------------------------
##getwd() 
write.csv(geih, file = "encuesta.csv")