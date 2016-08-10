scraped <- read.csv('270towin.csv', header = FALSE, col.names = c('src', 'dem', 'rep','ind','state'))
scraped$dem = as.numeric(sub("%", "", scraped$dem))
scraped$rep = as.numeric(sub("%", "", scraped$rep))
scraped$ind = as.numeric(sub("%", "", scraped$ind))

library(dplyr)
library(ggplot2)
ggplot(scraped, aes(x=dem, group = factor(state), col = factor(state))) + 
  #geom_histogram(aes(y=..density..), binwidth=.5) +
  geom_density(aes(y = ..density..), alpha=.2)

ggplot(scraped, aes(x=rep, group = factor(state), col = factor(state))) + 
  #geom_histogram(aes(y=..density..), binwidth=.5) +
  geom_density(aes(y = ..density..), alpha=.2)


ggplot(scraped, aes(x=ind, group = factor(state), col = factor(state))) + 
  #geom_histogram(aes(y=..density..), binwidth=.5) +
  geom_density(aes(y = ..density..), alpha=.2)

summary(scraped)
library(tidyr)
scraped.long <- gather(scraped, party, numbers, dem:ind)
head(scraped.long)
ggplot(scraped.long, aes(factor(party), numbers, col = factor(party))) + geom_boxplot()

ge2012 <- read.csv('GeneralElection2012.csv', header = TRUE)
library(lubridate)
ge2012$Date <- mdy(ge2012$Date)
ge2012 %>%
  ggplot(aes(x = Date, y = Percent, col=interaction(Party,Demo))) + geom_line() + geom_point() + geom_jitter()