library(UsingR)
library(ggplot2)

data(galton)
fitModel  <- lm(child ~., data=galton)
getChildHeight  <-  function(childHeight){
        dicimal <- childHeight -100;
        round(predict(fitModel,newdata=data.frame(parent=dicimal))[[1]]) +100
}

shinyServer( 
        function(input, output) {
                output$parentVSchild <- renderPlot({ 
                        parentHeight  <- input$parentHeight-100
                        childHeight  <-getChildHeight(input$parentHeight)-100
                        
                        plot(galton, xlim=c(40,100), ylim=c(60,95), main="Parent vs Child Height")
                        lines(c(0,100) ,c(parentHeight,parentHeight),col="red",lwd=5)
                        lines(c(childHeight,childHeight),c(0,100) ,col="green",lwd=5)
                        abline(fitModel,color="blue")
                        legend("topright", legend=c("your height","predicted child height"), lty=1,col=c("red","green"))
                        
                });
                output$inputValue <- renderPrint({input$parentHeight});
                output$prediction <- renderPrint({ getChildHeight(input$parentHeight) });
                } 
        )