source("calDist.R")
rentLocate <- read.csv("rentxy.csv",col.names = c("id","Response_X","Response_Y","farePS","cata"))#2715
nrow(rentLocate)
rentLocate[1,]
store <- read.csv("taipei_store.csv",header = TRUE)
head(store)
str(store)
names(store)<-c("id","lon","lat","tag")
rentxy <- slice(rentLocate,1:5)
#?rename()
#有沒有其他寫法?
star <- filter(store,tag == "star")#110
#star <- rename(star,lon = Response_X , lat = Response_Y)
cosmed <- filter(store,tag=="cosmed")#180
post <- filter(store,tag=="post")#156
cafe85 <- filter(store,tag=="cafe85")#112
mrt <- filter(store,tag=="mrt")#362

df <- data.frame(rentLocate$id,rentLocate$Response_X,rentLocate$Response_Y)
names(df)<- c("id","Response_X","Response_Y")
df$star1_X =NA
df$star1_Y =NA
df$star2_X =NA
df$star2_Y =NA
df$star3_X =NA
df$star3_Y =NA
df$star =NULL

df[1,]
<- dist( rentLocate, star)
distHaversine(x,y)

