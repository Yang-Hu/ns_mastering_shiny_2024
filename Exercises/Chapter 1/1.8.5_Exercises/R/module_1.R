module_UI <- function(id) {
  ns <- NS(id)
  
  tagList(
    selectInput(inputId = ns("dataset"), 
                label   = "Dataset", 
                choices = datasets),
    
    verbatimTextOutput(outputId = ns("summary")),
    
    plotOutput(outputId = ns("plot"))
  )
}



module_Server <- function(id) {
  moduleServer(
    id = id,
    
    module = function(input, output, session) {
      
      df <- reactive({get(input$dataset, pos = "package:ggplot2")})
      
      output$summary <- renderPrint({
        summary(df())
      })
      
      output$plot <- renderPlot({
        plot(df())
      }, res = 96)
    }
  )
}