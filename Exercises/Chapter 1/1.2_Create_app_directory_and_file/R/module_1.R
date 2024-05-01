# Module UI:
module_UI <- function(id) {
  
  ns <- NS(id)
  
  tagList(
    
    selectInput(inputId = ns("dataset"),
                label   = "Dataset",
                choices = ls("package:datasets")),
    
    verbatimTextOutput(outputId = ns("summary")),
    
    tableOutput(outputId = ns("table"))
  )
  
}


# Server UI:
module_Server <- function(id) {
  
  moduleServer(
    
    id     = id,
    module = function(input, output, session) {
      
      df <- reactive({get(x   = input$dataset, 
                          pos = "package:datasets")})
      
      # Note here is `renderPrint`, not `renderText`:
      
      # renderPrint() prints the result of expr, while renderText() pastes it together into a single string. 
      # renderPrint() is equivalent to print(); renderText() is equivalent to cat(). Both functions capture all 
      # other printed output generated while evaluating expr.
      
      output$summary <- renderPrint({
        summary(df())
      })
      
      output$table <- renderTable({
        df()
      })
    }
  )
}