ui <- shiny::htmlTemplate(

  # Index Page
  filename = "www/index.html",

  leaflet_output = leafletOutput("map"),

  table_output = reactableOutput("table"),

  timevis_output = timevisOutput("timeline"),

  img_desc = imageOutput("image_desc")

)
