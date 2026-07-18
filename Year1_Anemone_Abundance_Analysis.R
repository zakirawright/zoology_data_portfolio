# University of Sussex | BSc Zoology
# Module: Coastal Ecology Field Course
# Project: Primary Field Research on Rock Pool Volume and Sea Anemone Abundance
# Note: original raw data sheet is no longer attached.

anemone<-read.table("coastal2.txt",header=T,stringsAsFactors = T) # inputting data into R
attach(anemone)
names(anemone)

# testing normality
shapiro.test(Volume.cm3.) 
# W = 0.48339, p-value < 2.2e-16, data not normal
shapiro.test(Total_anemone_count)
# W = 0.20814, p-value < 2.2e-16, data not normal

# testing correlation
cor.test(Volume.cm3.,Total_anemone_count,method="spearman")
# S = 67495, p-value = 1.157e-08, rho 0.542221 

cor.test(Volume.cm3.,Snakelock_number,method="spearman")
# S = 60269, p-value = 2.266e-10, rho 0.5912321

cor.test(Volume.cm3.,Beadlet_number,method="spearman")
# S = 100905, p-value = 0.001734, rho 0.3156199

options(scipen=999) # so axis shows full numbers and not notation

plot(Total_anemone_count~Volume.cm3.,xlab="Volume of rock pool (cm^3)",ylab="Total anemone count",ylim=c(0,30),xlim=c(0,500000)) # graph for volume against total anemone count
abline(lm(Total_anemone_count~Volume.cm3.),col="#dc2da2") # trend line

plot(Volume.cm3.,jitter(Beadlet_number),col=adjustcolor("red",alpha.f=0.5),ylim=c(0,30),xlab="Volume of rock pool (cm^3)",ylab="Anemone Count") # plotting volume against beadlet count
points(Volume.cm3.,jitter(Snakelock_number),col=adjustcolor("#60a5fa",alpha.f=0.7)) # adding the points for snakelock count onto the same graph
abline(lm(Beadlet_number~Volume.cm3.),col="red") # trend line for beadlets
abline(lm(Snakelock_number~Volume.cm3.),col="#60a5fa") # trend line for snakelocks
legend("topleft",legend=c("Beadlet","Snakelock"),col=c("red","#60a5fa"),pch=16,bty="n") # legend/key for anemone species