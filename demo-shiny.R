library(shiny)

# Interface utilisateur
ui <- fluidPage(
  titlePanel("Explorer les iris"),
  sidebarLayout(
    sidebarPanel(
      selectInput("species", "Choisissez une espèce :", choices = unique(iris$Species))
    ),
    mainPanel(
      plotOutput("irisPlot")
    )
  )
)

# Logique serveur
server <- function(input, output) {
  output$irisPlot <- renderPlot({
    data <- iris[iris$Species == input$species, ]
    plot(data$Sepal.Length, data$Petal.Length,
         main = paste("Espèce :", input$species),
         xlab = "Longueur des sépales", ylab = "Longueur des pétales",
         pch = 19, col = "darkgreen")
  })
}

# Lancer l'application avec port 5800
shinyApp(ui = ui, server = server, options = list(port = 5800, host = "0.0.0.0"))
