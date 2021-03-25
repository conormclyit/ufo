# Data Science
# Assessment Test 1
# 25/03/2021
# Conor McGlinchey - L00092917

# Q1
# file downloaded from blackboard and inserted into data frame
# missing content replaced with NA
ufo_data <- read.csv("ufo.csv", na = "")

# Q2
# view the structure of the data frame
str(ufo_data)

# view first 15 rows
head(ufo_data, 15)

# count number of rows in ufo_data and confirm it has 89071 rows
nrow(ufo_data)

# Q3
# convert datetime from chr to a date variable (currently set to mm/dd/yyyy)
converted_date <- as.Date(ufo_data$datetime, "%m/%d/%y")
converted_date
str(converted_date)

# Q4
# update ufo_data with the new structure - str(ufo_data) will set $ datetime is now set to "Date" instead of "chr")
ufo_data$datetime <- converted_date
str(ufo_data)

# Q5
# modify heading names - show list of heading names first
names(ufo_data)

# rename variable names: duration..seconds to DurationSeconds
names(ufo_data)[6] <- "DurationSeconds"

# rename variable names: duration..hours..min to DurationHrsMins
names(ufo_data)[7] <- "DurationHrsMins"

# rename variable names: date.posted to DatePosted
names(ufo_data)[9] <- "DatePosted"

# show list of heading names to prove updates were successful
names(ufo_data)

# Q6
# Update latitude variable from chr to a numerical value
converted_latitude <- as.numeric(ufo_data$latitude)
converted_latitude
str(converted_latitude)

# update ufo_data with the new structure - str(ufo_data) will set $ converted_latitude is now set to "Num" instead of "chr")
ufo_data$latitude <- converted_latitude
str(ufo_data)

# Q7
# install and use the mice package to show missing variables in the ufo_data data frame
install.packages("mice")
library(mice)
# display missing data patterns (N/As)
md.pattern(ufo_data)

# from the plot:
# How many records have no missing data content? - 69,528
# How many variables have all data variables missing? - 196

##### Check:
#list rows with missing vals
ufo_data[!complete.cases(ufo_data),]

# Q8
# sort ufo_data by 1) shape and 2) city and save to sorted_data
attach(ufo_data)
sorted_data <- ufo_data[order(shape, city),]
sorted_data

# extract only datetime, country and shape columns and save to sorted_ufo_data
sorted_ufo_data <- subset(
  sorted_data,
  select = c(datetime, country, shape))
sorted_ufo_data
detach(ufo_data)

# view first 15 rows
head(sorted_ufo_data, 15)

# Q9
# find all entries in the UFO data frame where country = GF and shape = disk
# save to ufo_gb_disk
ufo_gb_disk <- subset(
  ufo_data, country == "gb" & shape == "disk",
  select = datetime:longitude)
ufo_gb_disk

# Q10
# save the ufo_data file to a csv file called modified_ufo.csv
write.csv(ufo_data, file = "modified_ufo.csv")
# save the ufo_gb_disk file to a csv file called ufo_gb.csv
write.csv(ufo_gb_disk, file = "ufo_gb.csv")
# save the sorted_ufo_data file to a csv file called sorted_ufo.csv.
write.csv(sorted_ufo_data, file = "sorted_ufo.csv.")