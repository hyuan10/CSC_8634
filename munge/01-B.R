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

df.goct01 <- df.Sorted1 %>% 
  group_by(Time) %>% 
  summarise('Sum Packet Length' = sum(`packet length (1)`))

df.goct02 <- df.Sorted2 %>% 
  group_by(Time) %>% 
  summarise('Sum Packet Length' = sum(`packet length (1)`))

# Adding in a date column back into the dataframe

df.goct01 <- df.goct01 %>% add_column(Date= "01 Oct",.before="Time")

df.goct02 <- df.goct02 %>% add_column(Date= "02 Oct",.before="Time")

# Combining the dataframes to be plot into one

df.gb.database<- rbind(df.goct01, df.goct02)

