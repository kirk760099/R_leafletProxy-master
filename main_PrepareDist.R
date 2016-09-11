source('gmapdist.R')
library(dplyr)

rentLocate <- read.csv("rentxy.csv",col.names = c("id","Response_X","Response_Y","farePS","cata"))#2715
#names
nrow(rentLocate)
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
nrow(mrt)
#2715*(110+180+156+112+362) 2497800筆，要跑10天
#想辦法精簡先找出2715每個座標裡面最接近的3個再用google api跑
#2715*(3+3+3+3+3) 

slice(star,1:1)
#$Time秒數 $Distance 公尺
rentxy[1,]$Response_X
rent_dist = data.frame(rentLocate$id,rentLocate$Response_X,rentLocate$Response_Y)
head(rent_dist)
names(rent_dist) <- c("id","Response_X","Response_Y")
rent_dist$star = NA
rent_dist$cosmed = NA
rent_dist$post = NA
rent_dist$cafe85 = NA
rent_dist$mrt = NA
dist(rent_dist[1,],star,"walking")
for(i in 1:nrow(rent_dist)){
rent_dist$star[i]  <- dist(rent_dist[i,],star,"walking")
Sys.sleep() # You have exceeded your rate-limit for this API. 
}
dist(rentxy[1],star)

head(rent_dist,15)
