list_UI <- function(id) {
  ns <- NS(id)
  tagList(
    
    textInput(inputId = ns("name"), 
              label = "What's your name?"),
    
    passwordInput(inputId = ns("password"),
                  label = "What's your password?"),
    
    textAreaInput(inputId = ns("story"),
                  label = "I guess your password is...",
                  placeholder = "Warning! Your password will be displayed here...")
    
  )
}

list_Server <- function(id) {
  moduleServer(
    id = id,
    module = function(input, output, session) {
      
      observeEvent(input$password, {
        updateTextAreaInput(session = session, inputId = "story", value = input$password)
      })
      
    }
  )
}