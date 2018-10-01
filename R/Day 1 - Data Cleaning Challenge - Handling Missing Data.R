#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# DAY 1 - DATA CLEANSING CHALLENGE: HANDLING MISSING DATA #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Datasets used:
  # 1) Detailed NFL Play-by-Play Data 2009-2017 (NFL Play by Play 2009-2017 (v4).csv)
  # 2) San Francisco Building Permits (Building_Permits.csv)

## Key take-away points:
  # 1) For categorical data (factor), replace NA by most appeared value
  # 2) For numeric data, replace NA by mean or median

## Load required packages:
library(tidyverse)
library(data.table)
library(pipeR)
# install.packages(pipeR, dependencies = T)
## I'm a big fan of pipe operator from Kun Ren. His pipe operator (pipeR) is
## superior to magrittr.


## Read datasets to the environment:
nfl_data <- read_csv("../data/NFL Play by Play 2009-2017 (v4).csv", n_max=10000)
sf_permits <- read_csv("../data/Building_Permits.csv", n_max=10000)

## Check Null values:
set.seed(42)
nfl_data %>>% sample_n(10)
sf_permits %>>% sample_n(10)
nfl_data %>>% colnames # check all columns' name
sf_permits %>>% colnames # check all columns' name

# Total counts NA, not NA:
nfl_data %>>%
  is.na %>>% # check data if row value is NA or not
  table %>>%# count number of NA and Not NA
  (~ nfl_na_total) %>>% # save table as nfl_na_total
  print

# We can use prop.table for percentage of NA:
nfl_na_total %>>%
  prop.table * 100

# using margin.table to count number of NA in all columns:
(nfl_data %>>%
  is.na() %>>%
  margin.table(margin = 2) %>>% # use margin table to count NA (TRUE values)
  as.data.frame(col.names=c('ColNames','NACount'))) %>>% # convert to data.frame
  setDT( keep.rownames = TRUE) %>>%
  (~ nfl_na_details) # save result as nfl_na_details

names(nfl_na_details)[1] <- 'ColNames'
names(nfl_na_details)[2] <- 'NA_Count'

## Check NA values by colnames with desc order and percentage of total count:
nfl_na_details %>>% 
  filter(NA_Count > 0) %>>% # exclude none NA columns
  arrange(desc(NA_Count)) %>>% # arrange table by NA_Count fron high to low
  mutate('NA_pct'=NA_Count/nrow(nfl_data) * 100) %>>% # add pct of NA to all columns
  (~nfl_na_stats)

## top 20 columns that have NA value
nfl_na_stats %>>% head(20)

## Change NA values:
# from the result above, we can see that if we drop na rows, we'll drop all values
# but we can check it again to see if it's TRUE:
nfl_data[nfl_data %>>% complete.cases, ] 
# using complete.cases to check if there any rows that have all non NA values
# or we can use drop_na to drop all rows contain NA value(s)
nfl_data %>>%
  drop_na()

# remove all rows that have NA:
na_col <- nfl_na_stats$ColNames
nfl_data %>>%
  select(-na_col) %>>%
  head

# There're a numbers of ways to replace NA values:
# we can use mean, median, mode values for numeric data; most frequent value for categorical... so on
# we survey the data to check the types of data we have for each column:
nfl_data %>>% str

# we chose 1 chr data field and 1 num data fields and apply our method here:
# PassLength and Home_WP_pre

## PassLength:
# Since PassLength is factor, we'll replace with most frequent value
# check NA values of PassLenth
nfl_PL_NA <- nfl_data[is.na(nfl_data$PassLength), ]

# Find the most frequent value for PassLength
(nfl_data[!is.na(nfl_data$PassLength), ] %>>%
  count(PassLength) %>>% # first, count PassLength values to get frequency
  arrange(desc(n)) # then rearrange from high to low
)$PassLength[1] %>>%  # take the first value of the column PassLength of the freq table
  (~PL_most_freq) %>>% # save it as PL_most_freq
  print

# Replace with most frequent value:
nfl_PL_NA <- replace_na(nfl_PL_NA, list(PassLength=PL_most_freq))
# check result again
nfl_PL_NA$PassLength 

## Home_WP_pre:
# Home_WP_pre is numeric, we can use either mean or median to replace NA.
# check NA values of Home_WP_pre
nfl_HWP_NA <- nfl_data[is.na(nfl_data$Home_WP_pre), ]

nfl_HWP_NA$Home_WP_pre

# Replace with mean:
mean(nfl_data$Home_WP_pre, na.rm=T) # check mean
(nfl_HWP_NA %>>%
    replace_na(list(Home_WP_pre=mean(nfl_data$Home_WP_pre, na.rm=T)))
)$Home_WP_pre

# Replace with median:
median(nfl_data$Home_WP_pre, na.rm=T) # check median
(nfl_HWP_NA %>>%
    replace_na(list(Home_WP_pre=median(nfl_data$Home_WP_pre, na.rm=T)))
)$Home_WP_pre


# we can follow the same strategy for sf_permits!

