
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
    leaflet() %>%
      addProviderTiles(providers$Stadia.AlidadeSmoothDark) %>%
      setView(-1.719069, 48.301249, zoom = 6)
  })

  output$table <- renderReactable({
    reactable(iris)
  })


  output$timeline <- renderTimevis({
    timevis(data,
            groups = groups)
  })

}
