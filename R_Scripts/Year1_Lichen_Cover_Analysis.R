# University of Sussex | BSc Zoology 
# Module: Research Methods for Biology, Ecology & Zoology
# Project: Statistical Analysis of Lichen Cover on Trees
# Note: original raw data sheet is no longer attached.

shapiro.test(PerimeterTree) # checking for normality, W = 0.99041, p-value = 0.1328
shapiro.test(PerCentCoverLichen) # checking for normality, W = 0.95717, p-value = 2.324e-06

cor.test(PerimeterTree,PerCentCoverLichen,method="spearman") # spearmans rank test, rho 0.0385491,p-value = 0.5608 

plot(PerCentCoverLichen~PerimeterTree,ylab="Percentage Lichen Cover",xlab="Tree Perimeter (cm)",las=1,col="darkblue")
abline(lm(PerCentCoverLichen~PerimeterTree))