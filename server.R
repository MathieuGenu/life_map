
server <- function(input, output) {

  # Basic Numbers Page --------------------------------------------------------------

  # Number of trips text in UI
  # output$num_trips <- renderText({
  #   d_clean %>%
  #     filter(trip_or_order_status == "COMPLETED") %>%
  #     nrow()
  # })

  output$map <- renderLeaflet({
    # Base map

    leaflet(info) %>%
      addProviderTiles(providers$Esri.WorldImagery) %>%
      setView(-1.719069, 48.301249, zoom = 5) %>%
      addMarkers(
        icon = ~logoIcons[name],
        lng = ~lon,
        lat = ~lat)
  })

  output$table <- renderReactable({
    reactable(iris)
  })


  output$timeline <- renderTimevis({
    timevis(data,
            groups = groups)
  })


  # output$image_desc <- renderImage({
  #   list(src = info$img_desc[1])
  # })

  row <- 5

  output$image_desc<-renderText({c('<img src="',info$img_desc[row],'">')})

  output$title <- renderText({info$content[row]})

  output$location <- renderText({info$location[row]})

  output$dates <- renderText({
    if(is.na(info$end[row])) {
      info$start[row]
    } else {
      paste0(info$start[row]," --> ",info$end[row])
    }
  })

}
