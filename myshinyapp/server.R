
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

        output$scatterplotmatrix <- renderPlot({
                
                panel.cor <- function(x,y,digits=2,prefix="",cex.cor,...){
                        usr <- par("usr")
                        on.exit(par(usr))
                        par(usr=c(0,1,0,1))
                        r <- abs(cor(x,y,use="complete.obs"))
                        txt <- format(c(r,0.123456789),digits=digits)[1]
                        txt <- paste(prefix,txt,sep="")
                        if(missing(cex.cor)) cex.cor <- 0.8/strwidth(txt)
                        text(0.5,0.5,txt,cex=cex.cor*(1+r)/2)
                }

                pairs(mtcars[,input$feature],upper.panel = panel.cor)
                
  })

})
