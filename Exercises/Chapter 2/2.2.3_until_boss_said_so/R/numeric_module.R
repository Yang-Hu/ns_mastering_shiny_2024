numeric_UI <- function(id) {
  ns <- NS(id)
  
  tagList(
    numericInput(inputId = ns("num"), label = "Number one:",   value = 0,         min = 0, max = 100),
    sliderInput(inputId = ns("num2"), label = "Number two:",   value = 50,        min = 0, max = 100),
    sliderInput(inputId = ns("rng"),  label = "Range:",        value = c(10, 20), min = 0, max = 100)
  )
}

numeric_Server <- function(id) {
  moduleServer(
    id = id,
    
    module = function(input, output, session) {
      
      observeEvent(input$num, {
        
        updateSliderInput(session = session, inputId = "num2", value = input$num)
        
      }, ignoreInit = TRUE)     # Ignore when the app start to allow sliderinput(num2) to keep its original value
    }
  )
}