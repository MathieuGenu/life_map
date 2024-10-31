
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


  output$image_desc<-renderText({c('<img src="',info$img_desc[2],'">')})

}
