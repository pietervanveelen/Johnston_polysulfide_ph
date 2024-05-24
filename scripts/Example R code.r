install.packages("readxl")
install.packages("export")
library(readxl)
library(ggplot2)
library(export)

########################HI Pieter, Please ignore the code below

BathBu_df <- read_xlsx(path = "RegressionSummary.xlsx", sheet = "UsedForB4Regression")
BathAc_df <- read_xlsx(path = "RegressionSummary.xlsx", sheet = "B3")
M.df<-read_xlsx(path = "RegressionSummary.xlsx", sheet = "Sheet1", skip=2)
Time.Bath.Bu<-BathBu_df$Time_M
Time.Bath.Ac<-BathAc_df$Time_M
##Fitting curve
PHA.Bu<-BathBu_df$PHA_M
PHA.Ac<-BathAc_df$PHA_M

##Measured data
####Bath
M.BAc.1<-M.df$PHA...2
M.BAc.T.1<-M.df$Time...1
M.BAc.2<-M.df$PHA...6
M.BAc.T.2<-M.df$Time...5
M.BBU.1<-M.df$PHA...4
M.BBU.2<-M.df$PHA...8
M.BBU.T.1<-M.df$Time...3
M.BBU.T.2<-M.df$Time...7
####Almere
M.AAc.1<-M.df$PHA...12
M.AAc.T.1<-M.df$Time...11
M.AAc.2<-M.df$PHA...16
M.AAc.T.2<-M.df$Time...15
M.ABU.1<-M.df$PHA...14
M.ABU.2<-M.df$PHA...18
M.ABU.T.1<-M.df$Time...13
M.ABU.T.2<-M.df$Time...17

#########################HI Pieter, Please ignore the code above
#########################


ggplot()+
  geom_line(aes(x=Time.Bath.Ac, y=PHA.Ac), colour="red", alpha=0.2, linewidth=0.5)+ #line for Acetate
  geom_line(aes(x=Time.Bath.Bu, y=PHA.Bu), colour="blue", alpha=0.2, linewidth=0.5)+ #line for Butyrate
  geom_point(aes(x=M.BAc.T.1, y=M.BAc.1), colour="red", alpha=0.6,shape=0, size=3)+ #Data point for Acetate
  geom_point(aes(x=M.BBU.T.1, y=M.BBU.1), colour="blue", alpha=0.6,shape=2, size=3)+ #Data point for Butyrate
  scale_y_continuous(name="PHA Content (gPHA/gVSS)", limits= c(0,0.7),breaks=seq(0,0.7,0.1))+
  scale_x_continuous(name="Time (hour)",limits= c(0,52),breaks=seq(0,48,12))+
  ggtitle("Bath")+
theme(
  plot.title = element_text(hjust = 0.1, vjust = -10),
  panel.background = element_rect(fill='transparent'),
  panel.border = element_rect(colour = "black", fill=NA, linewidth = 0.3),
  axis.line.x = element_line(color="black", size = 0.3),
  axis.line.y = element_line(color="black", size = 0.3))

graph2svg()

