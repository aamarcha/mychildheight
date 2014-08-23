library(shiny)
shinyUI(
        navbarPage("MyChildHeight",
                   tabPanel("Prediction"),
                   h1('You can predict your child height ', class="text-center text-info"),
                   h3("Who is Galton ?"),
                   p( a(href="http://en.wikipedia.org/wiki/Francis_Galton","Francis Galton")," (born on 1822), a pioneer in statistics, pretend to predict your child height. In this Shiny App, let's challenge Francis :) "),
                   h3("How you can use this App?"),
                   tags$ul(
                           tags$li("First, enter your height in cm "),
                           tags$li("Then, click on 'Predict' button to see your predicted child height")
                           ),
                   h3("Let's challenge Francis!"),
                   tags$hr(),
                   pageWithSidebar( 
                           headerPanel(""),
                           sidebarPanel(
                                   numericInput('parentHeight', 'Your height (cm)', 165, min =100, max = 250, step = 1),
                                   p("Values between 100cm and 250cm", class= "small"),
                                   submitButton('Predict')
                           ),
                           mainPanel(
                         
                                   h3('Prediction',class="text-warning"), 
                                   h4('Your height (cm) :', class="text-success"), 
                                   verbatimTextOutput("inputValue"), 
                                   h4('You have a chance of 95% of having a child  height:',class="text-success"), 
                                   verbatimTextOutput("prediction"),
                                   plotOutput('parentVSchild')
                           ) 
                   ),
                   footer= a(href="http://github.com/aamarcha",'See source code')
        )

)