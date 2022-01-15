# Counts individual packets for each day

ppd = function(){
  return(sort(-table(df.database$Day))[1:2])
}

print(ppd()*-1)

# Filters the entire Data frame into two lots of data frames sorted by day

df.jan01=filter(df.database,Day=="01")  # Jan 01 filtered data

df.jan02=filter(df.database,Day=="02")  # Jan 02 filtered data

# Sorts the filtered data by Hour, Mins and Secs

attach(df.jan01)
df.Sorted1<-df.jan01[order(Hour,Mins,Secs),]
detach(df.jan01)


attach(df.jan02)
df.Sorted2<-df.jan02[order(Hour,Mins,Secs),]
detach(df.jan02)
