## irisPlotFunction.R

## DUKE TRANSLATIONAL BIOINFORMATICS

irisPlotFunction <- function(irisData){
  require(ggplot2)
  irisPlot <- ggplot(irisData, aes(factor(Species), Petal.Width)) +
    geom_boxplot(aes(fill = factor(Species)), alpha = 0.3) +
    geom_jitter(aes(colour = factor(Species)), size = 3) +
    ggtitle('Boxplot of Iris Petal Width by Species\n')
  
  return(irisPlot)
}