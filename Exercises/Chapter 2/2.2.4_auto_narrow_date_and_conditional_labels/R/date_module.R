date_UI <- function(id) {
  ns <- NS(id)
  tagList(
    
    textInput(inputId = ns("name"), label = "What's your name?", placeholder = "Please enter your name here"),
    
    numericInput(inputId = ns("age"), label = "How old are you?", value = NULL, min = 0, max = 120),
    
    dateInput(inputId = ns("dob"), label = "When were you born?", value = Sys.Date()),
    
    # textOutput(outputId = ns("out_dob"))
  )
}

date_Server <- function(id) {
  moduleServer(
    id = id,
    
    module = function(input, output, session) {
      
      
      observeEvent(input$name, {
        
        if (nchar(input$name) > 0 & input$name == "Eric") {
          # Update the label with the name when a name is entered
          updateNumericInput(session = session, inputId = "age", label = paste0("wow! ", input$name, ", how old are you?"))
          
        } else if (nchar(input$name) > 0 & input$name != "Eric") {
          
          updateNumericInput(session = session, inputId = "age", label = paste0("Hi ", input$name, ", how old are you?"))
          
        } else {
          # Reset the label to the default when the name is removed
          updateNumericInput(session = session, inputId = "age", label = "How old are you?")
          
        }
        
      }, ignoreInit = TRUE)

      
      observeEvent(input$age, {
        
        updateDateInput(session = session, inputId = "dob", value = (Sys.Date() - years(input$age + 1)))
        
      }, ignoreInit = TRUE)    # Keep the original date (today) until the user specified their age
      
      
      # output$out_dob <- renderText({
      #   input$dob
      # })
    }
  )
}