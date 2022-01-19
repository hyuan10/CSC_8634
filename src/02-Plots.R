#Plotting the packets received length sum against the time

library(scales)

p1 <- ggplot(data=df.gb.database, aes(x=Time, y=Sum.Packets)) +
  ggtitle("Packets Received Over Time")+
  labs(x="Time", y= "Packets Received",caption="Graph 1")+
  geom_bar(stat="identity", fill="#08588D")+
  scale_x_datetime(labels = date_format("%H:%M", tz="GMT"))+
  scale_y_continuous(labels = comma)+
  theme_bw()
p1

