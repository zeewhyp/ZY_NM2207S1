library(shiny)

# Define UI ----


ui <- fluidPage(
  titlePanel(
    "Zong Yao is the King "
  ),
  sidebarLayout(
    position="left",
    sidebarPanel(
      "sidebar gold panel",
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30),
      
      img(src ="godlevi.jpg", height = 220, width = 250)
      ),
    mainPanel(
      # histogram
      plotOutput(outputId = "distPlot"),
      h1("First level title"),
      h2("Second level title"),
      h3("Third level title"),
      h4("Fourth level title"),
      h5("Fifth level title"),
      h6("Sixth level title"),
      p("p creates a paragraph of text."),
      p("A new p() command starts a new paragraph. Supply a style attribute to change the format"),
      strong("strong makes bold text."),
      em("em() creates italicised(ie. emphasised) text."),
      br(),
      code("code displays your text similar to computer code"),
      div("div creates segments of text with a similar style. This division of text is all blue"),
      br(),
      p("span does the same thing as div, but it works with",
        span("groups of words", style ="color:blue"),
        "that appear inside a paragraph.")
    )
  )
)


  
# Define server logic ----
server <- function(input, output) {
  output$distPlot <- renderPlot({
    
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "#75AADB", border = "red",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
    
  })
  
}

# Run the app ----
shinyApp(ui = ui, server = server)