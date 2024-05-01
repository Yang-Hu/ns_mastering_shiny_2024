dropdown_UI <- function(id) {
  ns <- NS(id)
  tagList(
    
    selectInput(inputId = ns("name"), label = "Who is working from home?", choices = c("", name_options), selected = NULL),
    
    textInput(inputId = ns("new"), label = "Add a new person if you like", placeholder = "Please enter new name here"),
    
    # textOutput(outputId = ns("selected_digit")),
    
    textOutput(outputId = ns("text"))
  )
}


dropdown_Server <- function(id) {
  moduleServer(
    id = id,
    module = function(input, output, session) {
      
      # output$selected_digit <- renderText({
      #   nchar(input$name)
      # })
      
      
      observeEvent(input$new, {
        
        updateSelectInput(session = session, inputId = "name", choices = c("", input$new, name_options))
        
      })
      
      
      output$text <- renderText({
        
        
        if (nchar(input$name) == 0) {
          
        } else if (input$name == "Yang") {
          
          "Yes, he is working from home today."
          
        } else if (input$name == "Lara") {
          
          "No, she is working in office today."
          
        } else if (input$name == "Eric") {
          
          "Eric is too young to work, he is playing now."
          
        } else if (input$name == "Lut") {
          
          "No, she is retired and browsing Timu."
          
        } else {
          
          "Sorry I don't know if a cat can work."
          
        }
        
        
        
      })
      
      
      
    }
  )
}