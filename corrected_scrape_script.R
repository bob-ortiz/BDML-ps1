rm(list = ls())

# Install Pacman
install.packages("pacman")

# Load all required packages
pacman::p_load(rvest, dplyr, tidy, caret, kableExtra, tidyverse)

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