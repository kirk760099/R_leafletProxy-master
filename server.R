library(shiny)
library(leaflet)
source('source.R')

#' Title
#'
#' @param input 
#' @param output 
#' @param session 
#'
#' @return
#' @export
#'
#' @examples
shinyServer(function(input, output, session) {
  
  ShowId <- eventReactive(input$Area, {
    which(stores$tag == input$Area)
  })
  
  observeEvent(input$Area, {
    Id = ShowId()
    m <- leafletProxy('mymap',session) %>% clearMarkers()
    for( i in 1:length(input$Area) )
    {
      subid = which(stores$tag == input$Area[i])
      iconF = stores$tag[subid[1]]
      iconF = paste('i_', iconF, '.png', sep='')
      
      LeafIcon <- makeIcon(
        iconUrl = iconF,
        iconWidth = 18, iconHeight = 18,
        iconAnchorX = 18, iconAnchorY = 18)
      
      lng.path = stores$lan[subid]
      lat.path = stores$lat[subid]
      m <- addMarkers(m, lng=lng.path,lat=lat.path, icon=LeafIcon)
    }
  })

  output$mymap <- renderLeaflet({
    markers711 <- leaflet() %>% 
      addTiles() %>%
      setView(121.5467, 25.05248, zoom = 13)
    markers711
  })

})