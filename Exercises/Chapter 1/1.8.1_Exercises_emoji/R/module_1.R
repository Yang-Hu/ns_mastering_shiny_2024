module_UI <- function(id) {
  
  ns <- NS(id)
  
  # Remember to use the `tagList()`:
  tagList(
    
    # Name:
    textInput(inputId = ns("name"),
              label   = "What's your name?"),
    
    textOutput(outputId = ns("greeting")),
    
    tags$br(),
    
    # Age:
    numericInput(inputId = ns("age"),
                 label   = "How old are you?",
                 value   = NA,
                 min     = 0,
                 max     = 130),
    
    textOutput(outputId = ns("result"))
  )
}



module_Server <- function(id) {
  
  moduleServer(
    id = id,
    
    module = function(input, output, session) {
      
      # Name:
      output$greeting <- renderText({
        
        # Input is required before any operations:
        req(input$name)
        paste0("Hi ", input$name, "! ", "\U0001F697")
      })
      
      
      # Age:
      output$result <- renderText({
        
        # Input is required before any operations:
        req(input$age)
        
        # Check the input number:
        check_result <- input$age < (year(Sys.time()) - 1991)
        
        if (isTRUE(check_result)) {
          return(paste0("You are younger than Yang.", "\U0002B50"))
        } else {
          return("You are older than Yang.")
        }
      })
    }
  )
}


