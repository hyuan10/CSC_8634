# Packet Count

# Creates data frames and counts the individual instances of packets received

df.Sorted1$CombinedDateHour <- paste(df.Sorted1$Date, df.Sorted1$Hour)

df.Sorted2$CombinedDateHour <- paste(df.Sorted2$Date, df.Sorted2$Hour)

# Creates a data frame to combine Date and Hour

df.coct01 <- df.Sorted1 %>% group_by(CombinedDateHour) %>% summarise(Individual_Packets = n())

df.coct02 <- df.Sorted2 %>% group_by(CombinedDateHour) %>% summarise(Individual_Packets = n())


# Reformats the Time column to POSIXct format

df.coct01$CombinedDateHour <- as.POSIXct(df.coct01$CombinedDateHour, origin="1970-01-01", tz="GMT")

df.coct02$CombinedDateHour <- as.POSIXct(df.coct02$CombinedDateHour, origin="1970-01-01", tz="GMT")


# Combining the dataframes to be plot into one

df.cb.database<- rbind(df.coct01, df.coct02)


