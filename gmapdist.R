#rentLocate$X 經度 rentLocate$Y 緯度 retailer某家零售業裡面有經緯
#devtools::install_github("rodazuero/gmapsdistance") #bugs from CRAN
library(gmapsdistance)

dist<- function( rentLocate, retailer, way){
  x <- paste(rentLocate$Response_Y,rentLocate$Response_X,sep = "+")
  for (j in 1:nrow(retailer)){
    y <- paste(retailer$lat[j],retailer$lon[j],sep = "+")
    if (j==1){
      dist = gmapsdistance(origin =x,destination = y,mode = way,key = APIkey)$Distance
      }
    dist <- ifelse(gmapsdistance(origin =x,destination = y,mode = way,key = APIkey)$Distance<dist,
                   gmapsdistance(origin =x,destination = y,mode = way,key = APIkey)$Distance, dist)
  }
  return(dist) 
}

#Google API returned an error: You have exceeded your daily request quota for this API. We recommend registering for a key at the Google Developers Console: 

# ##Time 
# dist_time<- function( rentLocate, retailer, way){
#   x <- paste(rentLocate$Response_Y,rentLocate$Response_X,sep = "+")
#   for (j in 1:nrow(retailer)){
#     y <- paste(retailer$lat[j],retailer$lon[j],sep = "+")
#     if (j==1){
#       dist = gmapsdistance(origin =x,destination = y,mode = way)$Time#Distance
#     }
#     dist <- ifelse(gmapsdistance(origin =x,destination = y,mode = way)$Time<dist,
#                    gmapsdistance(origin =x,destination = y,mode = way)$Time, dist)
#   }
#   return(dist) 
# }