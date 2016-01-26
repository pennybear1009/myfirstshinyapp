
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel(h1("Explore Dataset by Scatterplot Matrices")),

  # Sidebar with a select input to choose the dataset and group checkbox
  # to pick the features. both of them are followed by a button to trigger.
  sidebarLayout(position="right",
    sidebarPanel(
      checkboxGroupInput("feature",
                   "Choose your features:",
                   choices = names(mtcars),
                   selected = list("mpg","wt")
                   ),
      submitButton("See the plot",
                   icon("fa fa-bar-chart")
                   )
    ),

    # Show a plot of the scatterplot matrix with correlation coefficents
    mainPanel(h3("Scatterplot Matrices"),
              h5("This application can produce a matrix of scatterplot with correlation coeffiencts of each pair of features"),
              textOutput("tips"),
              plotOutput("scatterplotmatrix")
           
    )
  )
))
