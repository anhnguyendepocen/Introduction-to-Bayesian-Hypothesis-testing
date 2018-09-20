#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

## Code based on R code by Alexander Etz, described at https://alexanderetz.com/2015/04/15/understanding-bayes-a-look-at-the-likelihood
## Plots the likelihood function for the data obtained
## h = number of successes (heads), n = number of trials (flips), 
## p1 = prob of success (head) on H1, p2 = prob of success (head) on H2
## Returns the likelihood ratio for p1 over p2. The default values are the ones used in the blog post
LR <- function(h,n,p1=.5,p2=.75, standardize=TRUE){
  denom <- 1
  if(standardize){       ## standardize vs the MLE
    denom <- dbinom(h,n,h/n)
  }
  L1 <- dbinom(h,n,p1)/denom ## Likelihood for p1, possibly standardized vs MLE
  L2 <- dbinom(h,n,p2)/denom ## Likelihood for p2, possibly standardized vs MLE
  Ratio <- L1/L2 ## Likelihood ratio for p1 vs p2
  
  curve((dbinom(h,n,x)/denom), xlim = c(0,1), ylab = "Likelihood",xlab = "Probability of heads",las=1,
        main = paste("Likelihood ratio (H1/H2):", round(Ratio, 2)), lwd = 3)
  points(p1, L1, cex = 2, pch = 21, bg = "cyan")
  points(p2, L2, cex = 2, pch = 21, bg = "cyan")
  lines(c(p1, p2), c(L1, L1), lwd = 3, lty = 2, col = "cyan")
  lines(c(p2, p2), c(L1, L2), lwd = 3, lty = 2, col = "cyan")
  abline(v = h/n, lty = 5, lwd = 1, col = "grey73")
}

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("The likelihood of coin flips"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        numericInput("n",
                     "Number of throws:",
                     min = 1,
                     max = 10000,
                     step = 1,
                     value = 180),
         numericInput("h",
                    "Number of heads:",
                    min = 0,
                    max = 10000,
                    step = 1,
                    value = 100),
         sliderInput("p1",
                     "Prob. of head on H1:",
                     min = 0,
                     max = 1,
                     value = 0.5),
         sliderInput("p2",
                     "Prob. of head on H2:",
                     min = 0,
                     max = 1,
                     value = 0.65),
        checkboxInput("standardize", "Standardize likelihood", TRUE)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("likPlot"),
         htmlOutput("reference")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$likPlot <- renderPlot({
      LR(h=input$h, n=input$n, p1=input$p1, p2=input$p2, standardize=input$standardize)
   })
   output$reference <- renderUI({
     div(HTML("R code based on <a href='https://alexanderetz.com/2015/04/15/understanding-bayes-a-look-at-the-likelihood'>blog post</a> by Alexander Etz."))
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

