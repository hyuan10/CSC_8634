#This preprocess script will combine the data sub sets together

library(dplyr)
library(readr)
library(data.table)

# Set up working directory to data  folder to create data frames from data

setwd("~/Documents/CSC_8634/data")

# Setting up the data files as data frames

df.database.1<-as.data.frame(fread("14615503_1224523740902654_6852172664916672512_n"))

df.database.2<-as.data.frame(fread("10000000_220627975019916_5597249363521830912_n"))

df.database.3<-as.data.frame(fread("10000000_775780395897194_5651293731576348672_n"))

df.database.4<-as.data.frame(fread("10000000_1038929352871690_5384801718213017600_n"))


# Combines all the data frames into 1

df.database.binded<-rbind(df.database.1,df.database.2,df.database.3,df.database.4)

# Rename Column Names

colnames(df.database.binded) <- c("Timestamp","packet length (1)", "anonymized(2) source (src) IP","anonymized(2) destination (dst) IP","anonymized source (src) L4 Port",
                                 "anonymized destination (dst) L4 Port","IP protocol","anonymized source (src) hostprefix (3)","anonymized destination (dst) hostprefix (3)",
                                 "anonymized source (src) Rack", "anonymized destination (dst) Rack", "anonymized source (src) Pod", "anonymized destination (dst) Pod",
                                 "intercluster", "interdatacenter")

# Reformats Timestamp to Human readable

date.time = data.frame("Date.time" = c(as.POSIXct(df.database.binded$Timestamp, origin="1970-01-01", tz="GMT")))

date.time$Date <- as.Date(date.time$Date.time)

date.time$Time <- format(as.POSIXct(date.time$Date.time), format = "%H:%M")

date.time$Day <- format(as.POSIXct(date.time$Date.time), format = "%d")

date.time$Hour <- format(as.POSIXct(date.time$Date.time), format = "%H")

date.time$Mins <- format(as.POSIXct(date.time$Date.time), format = "%M")

date.time$Secs <- format(as.POSIXct(date.time$Date.time), format = "%S")

# Combines the Date Time df with row binded df

df.database<-cbind(date.time, df.database.binded)

# Set working directory back to project folder

setwd("~/Documents/CSC_8634/")


