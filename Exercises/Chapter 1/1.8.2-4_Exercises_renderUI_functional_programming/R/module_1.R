module_UI <- function(id) {
  
  ns <- NS(id)
  
  tagList(
    
    # x: 
    sliderInput(inputId = ns("x"),
                label   = "If x is",
                value   = 25,
                min     = 0,
                max     = 50),
    
    # y:
    sliderInput(inputId = ns("y"),
                label   = "and if y is",
                value   = 25,
                min     = 0,
                max     = 50),
    
    tags$p("then"),
    
    # Live text (Shiny automatic unpack a list into html elements):
    uiOutput(outputId = ns("live_text"))
  )
}


module_Server <- function(id) {
  
  moduleServer(
    
    id = id,
    
    module = function(input, output, session) {
      
      # Define a list specify the functions and labels:
      df <- list(
        func  = c(`+`, `*`, `/`),
        label = c(" plus ", " times ", " divided by ")
      )
      
      # Use functional programming to generate UI element in a vector way:
      output$live_text <- renderUI({
        
        pmap(df, \(func, label) {
          
          tags$p(paste0(input$x, label, input$y, " is ", format(round(func(input$x, input$y), 
                                                                      digits = 2),  # This is for fractions
                                                                big.mark = ",")))   # This is for values greater than 1k
        })
      })
    }
  )
}