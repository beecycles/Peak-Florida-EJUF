##############################################
######## Peak Florida growth analysis ########
##############################################

library(dplyr)
library(ggplot2)

# load housing permit data
permits = read.csv("HousingTrends_Florida_top10.csv", header = TRUE)
dim(permits)
permits$Year = as.numeric(permits$Year)
permits$Permits = as.numeric(permits$Permits)

permits_counties = subset(permits, County != "State wide")
permits_state = subset(permits, County == "State wide")

# map housing permit data for top 10 most populous counties
quartz(width = 10, height = 10)
ggplot(aes(x = Year, y = Permits, colour = County), data = permits_counties) +
  geom_line() + 
  xlab("Year") + ylab("Number of Building Permits") +
  theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=15)) +
  theme(axis.text = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=10)) +
  scale_x_continuous(breaks=c(1990, 2000, 2010, 2014, 2017)) +
  scale_y_continuous(labels = function(x) paste0(scales::comma(x))) +
  theme(legend.position = "bottom")

# map housing permit data for state
quartz(width = 10, height = 10)
ggplot(aes(x = Year, y = Permits), data = permits_state) +
  geom_line() + 
  xlab("Year") + ylab("Number of Building Permits") +
  theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=15)) +
  theme(axis.text = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=10)) +
  scale_x_continuous(breaks=c(1990, 2000, 2010, 2014, 2017)) +
  scale_y_continuous(labels = function(x) paste0(scales::comma(x))) +
  theme(legend.position = "bottom")
