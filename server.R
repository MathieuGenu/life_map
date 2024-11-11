
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
        layerId = ~id,
        icon = ~logoIcons[name],
        lng = ~lon,
        lat = ~lat)
  })

  # event on map
  p_react <- reactive({
    if(is.null(input$map_marker_click)) {
      1
    } else {
      input$map_marker_click$id
    }
  })

  observe({print(p_react())})


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

  infos_reactive <- reactive({
    info %>% filter(id == p_react())
  })


  output$image_desc <- renderText({c('<img src="',infos_reactive()$img_desc,'">')})

  output$title <- renderText({infos_reactive()$content})

  output$location <- renderText({infos_reactive()$location})

  output$dates <- renderText({
    if(is.na(infos_reactive()$end)) {
      infos_reactive()$start
    } else {
      paste0(infos_reactive()$start,' <i class="fa fa-arrow-right"></i> ',infos_reactive()$end)
    }
  })

}
