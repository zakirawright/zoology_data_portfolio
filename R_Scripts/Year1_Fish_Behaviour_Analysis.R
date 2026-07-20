# University of Sussex | BSc Zoology 
# Module: Research Methods for Biology, Ecology & Zoology
# Project: Statistical Analysis of Fish Courtship Behaviour 
# Note: original raw data sheet is no longer attached.

plot(Fry~No_displays_f,las=1,ylab="Successful Reproduction",xlab="Number of Courtship Display Behaviours by Female Fish",ylim=c(0,1),xlim=c(0,25),col="darkblue") # plotting graph of fry count against female displays

m1<-glm(Fry~No_displays_f*No_displays_m,family=binomial) # logistic regression testing variables and interaction
summary(m1) # seeing results of logistic regression

m2<-glm(Fry~No_displays_f,family=binomial) # simple model with only one variable
range(No_displays_f) # range of values for female displays
xfdisplay<-seq(0,25,0.1) # creating x values for fitted line
yfry<-predict(m2,list(No_displays_f=xfdisplay),type="response") # y value predictions for created x values 
lines(yfry~xfdisplay) # create fitted line
