# Packet Sum

# Counts individual packets for each day

ppd = function(){
  return(sort(-table(df.database$Day))[1:2])
}

print(ppd()*-1)

# Filters the entire Data frame into two lots of data frames sorted by day

df.oct01=filter(df.database,Day=="01")  # Oct 01 filtered data

df.oct02=filter(df.database,Day=="02")  # Oct 02 filtered data

# Sorts the filtered data by Hour, Mins and Secs

attach(df.oct01)
df.Sorted1<-df.oct01[order(Hour,Mins,Secs),]
detach(df.oct01)


attach(df.oct02)
df.Sorted2<-df.oct02[order(Hour,Mins,Secs),]
detach(df.oct02)


# Creates data frames for the grouped and summed data

df.goct01 <- df.Sorted1 %>% group_by(Date, Hour) %>%summarise(Sum.Packets=sum(`packet length (1)`))

ungroup(df.goct01)

df.goct02 <- df.Sorted2 %>% group_by(Date, Hour) %>%summarise(Sum.Packets=sum(`packet length (1)`))

ungroup(df.goct02)



# Adding a concatinated column of date and time to the Hour of the packets

df.goct01$Time <- paste(df.goct01$Date, df.goct01$Hour)

df.goct02$Time <- paste(df.goct02$Date, df.goct02$Hour)

# Reformats the Time column to POSIXct format

df.goct01$Time <- as.POSIXct(df.goct01$Time, origin="1970-01-01", tz="GMT")

df.goct02$Time <- as.POSIXct(df.goct02$Time, origin="1970-01-01", tz="GMT")


# Combining the dataframes to be plot into one

df.gb.database<- rbind(df.goct01, df.goct02)

# Reordering columns

df.gb.database<-subset(df.gb.database, select=c(1,2,4,3))


