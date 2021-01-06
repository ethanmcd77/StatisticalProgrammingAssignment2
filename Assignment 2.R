#Assignment 2 Statistical Programming, C18424952 


#Installing needed packages

install.packages("tidyverse")
library(ggplot2)
library(dplyr)
library(readr)
library(tibble)
setwd("C:/Users/orlai/OneDrive/Documents/Ethan College Stuff/Statistical Programming 3rd-Year/2nd Assignment Data")


#Importing data

Advertiser <- tibble(read_csv('C:/Users/orlai/OneDrive/Documents/Ethan College Stuff/Statistical Programming 3rd-Year/2nd Assignment Data/advertiser.csv'))
Campaign <- tibble(read_csv('C:/Users/orlai/OneDrive/Documents/Ethan College Stuff/Statistical Programming 3rd-Year/2nd Assignment Data/campaigns.csv'))
Click <- tibble(read_csv('C:/Users/orlai/OneDrive/Documents/Ethan College Stuff/Statistical Programming 3rd-Year/2nd Assignment Data/clicks.csv'))
Conversion <- tibble(read_csv('C:/Users/orlai/OneDrive/Documents/Ethan College Stuff/Statistical Programming 3rd-Year/2nd Assignment Data/conversions.csv'))
Impression <- tibble(read_csv('C:/Users/orlai/OneDrive/Documents/Ethan College Stuff/Statistical Programming 3rd-Year/2nd Assignment Data/impressions.csv'))


#Renaming to allow for joins

names(Advertiser)[names(Advertiser) == "ID"] <- "advertiser_id"
names(Click)[names(Click) == "ID"] <- "id"
names(Conversion)[names(Conversion) == "ID"] <- "id"
names(Impression)[names(Impression) == "ID"] <- "id"
names(Click)[names(Click) == "time"] <- "Click_Time"
names(Click)[names(Click) == "timezone"]<- "Click_Timezone"
names(Click)[names(Click) == "date"] <- "Click_Date"
names(Impression)[names(Impression) == "time"] <- "Impression_Time"
names(Impression)[names(Impression) == "timezone"] <- "Impression_Timezone"
names(Impression)[names(Impression) == "date"] <- "Impression_Date"
names(Conversion)[names(Conversion) == "time"] <- "Conversion_Time"
names(Conversion)[names(Conversion) == "timezone"] <- "Conversion_Timezone"
names(Conversion)[names(Conversion) == "date"] <- "Conversion_Date"
names(Advertiser)[names(Advertiser) == "name"] <- "Advertiser_Name"



#Joining the Tables

Join1 <- inner_join(Advertiser, Campaign, key = "advertiser_id")
Join2 <- inner_join(Join1, Click, key = "id")
Join3 <- inner_join(Join2, Conversion, key = "id")
Full_Table <- inner_join(Join3, Impression, key = "id")
view(Full_Table)

Impressions_Table <-inner_join(Join1, Impression, key = "id")
view(Impressions_Table)

Conversions_Table <-inner_join(Join1, Conversion, key = "id")
view(Conversions_Table)

Clicks_Table <-inner_join(Join1, Click, key = "id")
view(Clicks_Table)

view(Join1)


#Graphs are created from here down

ggplot(data = Impressions_Table) + geom_bar(mapping = aes(x = Advertiser_Name, colour = Advertiser_Name, fill = Advertiser_Name)) +
  labs(title ="Impressions Count per Advertiser", x = "Advertiser Name", y = "Impressions")

#ggplot(data = Conversions_Table) + geom_bar(mapping = aes(x = Advertiser_Name, colour = Advertiser_Name, fill = Advertiser_Name)) +
  #labs(title ="Conversions Count per Advertiser", x = "Advertiser Name", y = "Conversions")

#ggplot(data = Clicks_Table) + geom_bar(mapping = aes(x = Advertiser_Name, colour = Advertiser_Name), fill = 'black') +
#  labs(title ="Clicks Count per Advertiser", x = "Advertiser Name", y = "Clicks")

#ggplot(data = Impressions_Table) + geom_bar(mapping = aes(x = name, colour = Advertiser_Name), fill = 'black') +
#  labs(title ="Impressions Count per Campaign", x = "Campaign Name", y = "Impressions")

#ggplot(data = Conversions_Table) + geom_bar(mapping = aes(x = name, colour = name, fill = name)) +
#  labs(title ="Conversions Count per Campaign", x = "Campaign Name", y = "Conversions")

ggplot(data = Clicks_Table) + geom_bar(mapping = aes(x = name, colour = name, fill = name)) +
  labs(title ="Clicks Count per Campaign", x = "Campaign Name", y = "Clicks")

ggplot(data = Join1, aes(x=Advertiser_Name, y=budget, colour = Advertiser_Name)) + geom_bar(stat="identity", width=0.5) +
  labs(title ="Budget per Advertiser", x = "Advertiser Name", y ="Budget Amount")

#ggplot(data = Join1, aes(x=name, y=budget, colour = name)) + geom_bar(stat="identity", width=0.5) +
#  labs(title ="Budget per Campaign", x = "Campaign Name", y = "Budget Amount")

ggplot(data = Impressions_Table) + geom_jitter(mapping = aes(x = Advertiser_Name, y = Impression_Date, colour = Advertiser_Name, size = 0.2)) +
  labs(title ="Impressions seen per Advertiser on a Certain Date", x = "Advertiser Name", y = "Date")

#ggplot(data = Impressions_Table) + geom_jitter(mapping = aes(x = name, y = Impression_Time, colour = name, size = 0.2)) +
#  labs(title ="Impressions seen per Campaign at a Certain Time", x = "Campaign Name", y = "Time of Day")

ggplot(data = Conversions_Table) + geom_jitter(mapping = aes(x = Advertiser_Name, y = Conversion_Time, colour = Advertiser_Name, size = 0.2)) +
  labs(title ="Conversions taken place per Advertiser at a Certain Time", x = "Advertiser Name", y = "Time of Day")

#ggplot(data = Conversions_Table) + geom_jitter(mapping = aes(x = name, y = Conversion_Date, colour = name, size = 0.3)) +
#  labs(title ="Conversions taken place per Campaign on a Certain Date", x = "Campaign Name", y = "Date")

#ggplot(data = Conversions_Table) + geom_jitter(mapping = aes(x = Advertiser_Name, y = Conversion_Timezone, colour = Conversion_Timezone, size = 0.3)) +
#  labs(title ="Conversions taken place per Advertiser in a Certain Timezone", x = "Advertiser Name", y = "Timezone")

ggplot(data = Clicks_Table) + geom_jitter(mapping = aes(x = Click_Timezone, y = name, colour = Advertiser_Name, size = 0.3)) +
  labs(title ="Clicks received per Campaign in a certain Timezone", x = "Campaign Name", y = "Timezone")

#ggplot(data = Clicks_Table) + geom_jitter(mapping = aes(x = Click_Date, y = Advertiser_Name, colour = name, size = 0.3)) +
#  labs(title ="Clicks received per Advertiser on a Certain Date", x = "Date", y = "Adveriser Name")

#ggplot(data = Clicks_Table) + geom_jitter(mapping = aes(x = Click_Time, y = name, colour = Advertiser_Name, size = 0.3)) +
#  labs(title ="Clicks received per Campaign at a Certain Time", x = "Time", y = "Campaign Name")


