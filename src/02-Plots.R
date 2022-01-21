#Plotting the packets exchanged length sum against the time

library(scales)

library(ggplot2)

p1 <- ggplot(data=df.gb.database, aes(x=Time, y=Sum.Packets)) +
  ggtitle("Sum of Packet Length Over Time")+
  labs(x="Time", y= "Sum of Packet Lenth",caption="Graph 1")+
  geom_bar(stat="identity", fill="#08588D")+
  scale_x_datetime(labels = date_format("%H:%M", tz="GMT"))+
  scale_y_continuous(labels = comma)+
  theme_bw()
p1

ggsave("~/Documents/CSC_8634/graphs/p1.png", p1)

p2 <- ggplot(data=df.cb.database, aes(x=CombinedDateHour, y=Individual_Packets)) +
  ggtitle("Individual Packets Exchanged Over Time")+
  labs(x="Time", y= "Individual Packets",caption="Graph 2")+
  geom_bar(stat="identity", fill="#08588D")+
  scale_x_datetime(labels = date_format("%H:%M", tz="GMT"))+
  scale_y_continuous(labels = comma)+
  theme_bw()
p2

ggsave("~/Documents/CSC_8634/graphs/p2.png", p2)
