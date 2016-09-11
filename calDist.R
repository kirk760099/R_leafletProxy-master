library(geosphere)
#rentLocate$X 經度 rentLocate$Y 緯度 retailer某家零售業裡面有經緯度
dist<- function( rentLocate, retailer){
  x <- c(rentLocate$Response_X,rentLocate$Response_Y)
  for (j in 1:nrow(retailer)){
    y <- c(retailer$lon[j],retailer$lat[j])
    if (j==1){dist = distHaversine(x,y)}
    dist <- ifelse(distHaversine(x,y)<dist, distHaversine(x,y), dist)
  }
  #return dist
}