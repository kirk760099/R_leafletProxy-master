stores<- read.csv("taipei_store.csv",header = TRUE)
names(stores) <- c("id","lan","lat","tag")

# totalIcons <- iconList(
#   star = makeIcon("i_star.png", 18, 18,18,18),
#   cosmed = makeIcon("i_cosmed.png",  18, 18,18,18),
#   post = makeIcon("i_post.png", 18, 18,18,18),
#   cafe8mrt = makeIcon("i_cafe85.png",  18, 18,18,18),
#   mrt = makeIcon("i_mrt.png", 18, 18,18,18),
#   rent = makeIcon("i_rent.png", 18, 18,18,18)
# )
# valueIcons <- iconList(
#   high = makeIcon("i_red.png", 18, 18,18,18),
#   medium = makeIcon("i_3star.png",  18, 18,18,18),
#   low = makeIcon("i_2star.png", 18, 18,18,18)
# )
# 
# starIcons <- icons(
#   iconUrl = "i_star.png" ,
#   iconWidth = 20, iconHeight = 20,
#   iconAnchorX = 20, iconAnchorY = 20
# )
# mrtIcons <- icons(
#   iconUrl = "i_mrt.png" ,
#   iconWidth = 20, iconHeight = 20,
#   iconAnchorX = 20, iconAnchorY = 20
# )
# 
# leafIcons <- icons(
#   iconUrl = ifelse(stores$tag =="star",
#                    "i_mrt.png",
#                    "i_star.png"),
#   iconWidth = 18, iconHeight = 18,
#   iconAnchorX = 18, iconAnchorY = 18
#  )
