library(tidyverse)
library(hms)
library(scales)


getwd()
setwd("/Users/Cameron Pearl/Desktop/Data/Clean/cycle")

#collect the data
july_22 <- read.csv("202207-divvy-tripdata-July-Working.csv")
aug_22 <- read.csv("202208-divvy-tripdata-aug-working.csv")
sept_22 <- read.csv("202209-divvy-tripdata-sept-working.csv")
oct_22 <- read.csv("202210-divvy-tripdata-oct-working.csv")
nov_22 <- read.csv("202211-divvy-tripdata-nov-working.csv")
dec_22 <- read.csv("202212-divvy-tripdata-dec-working.csv")
jan_23 <- read.csv("202213-divvy-tripdata-jan-working.csv")
feb_23 <- read.csv("202214-divvy-tripdata-feb-working.csv")
mar_23 <- read.csv("202215-divvy-tripdata-mar-working.csv")
apr_23 <- read.csv("202216-divvy-tripdata-apr-working.csv")
may_23 <- read.csv("202217-divvy-tripdata-may-working.csv")
jun_23 <- read.csv("202218-divvy-tripdata-jun-working.csv")

#combine into a single dataframe

all_data <- bind_rows(july_22,aug_22,sept_22,oct_22,nov_22,dec_22,jan_23,feb_23,mar_23,apr_23,may_23,jun_23)

#convert start and end time to hms
all_data$started_at <- ymd_hms(all_data$started_at)
all_data$ended_at <- ymd_hms(all_data$ended_at)
all_data$trip_length <- difftime(all_data$ended_at, all_data$started_at)
all_data$trip_length <- as.numeric(all_data$trip_length)

# removing entries with wrong start and end datetimes
all_data <- all_data %>% 
  filter(!started_at > ended_at)

#create month column
all_data <- all_data %>% 
  mutate(month = month(started_at))

#save all data
write.csv(all_data, "all_data_cleaned.csv")

#analyze data
colnames(all_data)
nrow(all_data)
dim(all_data)
summary(all_data)

#plotting data
ggplot(data=all_data, aes(x=weekday,y=trip_length,fill=all_data$member_casual))+
  geom_bar(stat = "summary", fun = "mean", position = "dodge",alpha = 0.8)+
  ggtitle("Trip Length By Weekday") +
  ylab("Avg Trip Length")+
  xlab("Day of the week (1=Sunday)")+
  theme(panel.grid = element_blank())+
  labs(fill = "Member Type")

ggplot(data=all_data, aes(x=month,y=trip_length,fill=all_data$member_casual))+
  geom_bar(stat = "summary", fun = "mean", position = "dodge",alpha = 0.8)+
  ggtitle("Trip Length By Month") +
  ylab("Avg Trip Length")+
  xlab("Month")+
  theme(panel.grid = element_blank())+
  labs(fill = "Member Type")+
  scale_x_continuous(breaks = 1:12)

ggplot(data=all_data, aes(x=weekday,fill=member_casual))+
  geom_bar(position = "dodge",alpha = 0.8)+
  ggtitle("Number Of Trips By Weekday") +
  ylab("Trips")+
  xlab("Day of the week (1=Sunday)")+
  theme(panel.grid = element_blank())+
  labs(fill = "Member Type")+
  scale_y_continuous(labels = scales::comma)+
  scale_x_continuous(breaks = 1:7)

ggplot(data=all_data, aes(x=month,fill=member_casual))+
  geom_bar(position = "dodge",alpha = 0.8)+
  ggtitle("Number Of Trips By Month") +
  ylab("Trips")+
  xlab("Month")+
  theme(panel.grid = element_blank())+
  labs(fill = "Member Type")+
  scale_y_continuous(labels = scales::comma)+
  scale_x_continuous(breaks = 1:12)

ggplot(data=all_data, aes(x=rideable_type,fill=member_casual))+
  geom_bar(position = "dodge",alpha = 0.8)+
  ggtitle("Type Of Bike Prefered") +
  ylab("Number Of Rides")+
  xlab("Type Of Bike")+
  theme(panel.grid = element_blank())+
  labs(fill = "Member Type")+
  scale_y_continuous(labels = scales::comma)







