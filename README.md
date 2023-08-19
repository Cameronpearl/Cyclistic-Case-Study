# Cyclistic-Case-Study

## Background
In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geo-tracked and locked into a network of 692 stations across Chicago.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

## Objectives
This report seeks to answer the question; How do annual members and casual riders use Cyclistic bikes differently?

## Stakeholders
* Cyclistic users   
* Director of marketing   
* Cyclistic executive team   
* Cyclistic marketing team   

## Tools used for analysis
I used R and Excel to clean, analyze, and visualize data

## Downloading, Cleaning, and Preparing dataset
Downloaded dataset from Aug 2022-July 2023 from this site: <https://divvy-tripdata.s3.amazonaws.com/index.html>   
Excel found no duplicate rows.   
Some sheets have blank values for the station information. (Name and ID)   
Created the column "ride_length" by subtracting starttime by endtime, formatting it as time.   
Created the column "weekday" using the =WEEKDAY() function. 1=Sunday-7=Saturday   
I had to reformat the started_at and ended_at columns so I could change them to datetimes in R   
I used the formula =TEXT(D2, "YYYY-MM-DD HH:MM:SS") in excel and used the ymd hms function to change the data type. then I could use the difftime function on the triplength to get the trip length in seconds as a num type.   
I also found some of the started at times were after the ended at times since timetravel isnt offered by the company I can assume this data was collected incorrectly and those entries were removed. In a real world situation I would confirm with the team that collected the data first. 
During the analysis I thought it would be helpful to add a Month column using R.

## Analysing
* Calculating the mean, median, max, min   
* Finding a correlation between time of year, day of the week, and member types.   
* Determining the preferred bike type per member type.   


## Visualizations   
<img src="Plots/Avg%20Trip%20Length%20By%20Weekday.png" alt="Avg Trip Length By Weekday" width=600>   
<img src="Plots/Number%20Of%20Trips%20By%20Month.png" alt="Number Of Trips By Month" width=600>
<img src="Plots/Number%20Of%20Trips%20By%20Weekday.png" alt="Number Of Trips By Weekday" width=600>
<img src="Plots/Trip%20Length%20By%20Month.png" alt="Trip Length By Month" width=600>
<img src="Plots/Type%20Of%20Bike.png" alt="Type Of Bike" width=600>    

## Summary
Observing the data, it becomes evident that casual users tend to engage in longer trip durations. A notable trend emerges with peak trip lengths manifesting during weekends and the warmer summer months. Notably, the total number of rides experiences a significant decline in winter, while it surges remarkably during the summer. This observation aligns with the characteristic weather patterns of Chicago, where cold winters potentially deter bike usage.   

Intriguingly, a discernible pattern emerges from the data concerning user behavior. Members consistently maintain a steady frequency of trips throughout the week. Conversely, casual users exhibit an interesting tendency of increased activity during weekends. This discrepancy prompts the assumption that members predominantly employ the bike-sharing service for their daily commute, while casual users leverage it more for recreational purposes.   

It is worth highlighting the substantial variance in the frequency of trips between members and casual users. Members exhibit a substantially higher rate of engagement, which indicates a more habitual reliance on the service. This divergence may be attributed to differing user motivations and needs.   

Furthermore, the depiction of bike preference paints a revealing picture. Both members and casual users demonstrate a strong inclination toward electric bikes, which stands in stark contrast to the negligible usage of docked bikes among members and a complete absence of such usage among casual users.   

In summary, the analysis underscores the multifaceted dynamics within the bike-sharing ecosystem. It sheds light on nuanced user behavior patterns, seasonal trends, and preference variations, offering valuable insights that could inform strategic decisions for enhancing the overall user experience and optimizing the service's offerings.   
## Recommended actions

* Consider introducing more electric bike options to meet the high demand for this preferred mode of transportation.
* During peak months, allocate a larger portion of the fleet to meet the heightened demand, and scale back during the off-peak winter months. This approach could help optimize resource allocation and enhance user satisfaction.   
* Capitalize on the trend of increased casual user activity during weekends by introducing targeted weekend promotions or special offers.  
