library(caret)

training <- read.csv("census_income_learn.csv",header=FALSE)
testing <- read.csv("census_income_test.csv",header=FALSE)
training.pop <- dim(training)[1]

# Index des variables continues
contVars <- c(1,6,17,18,19,31,40)
# Index de la variables weight (à ignorer d'après le fichier census_income_metadata)
weightIndex <- 25

# Donne des informations générales sur chaque variable
summary(training)

# Exploration des variables continues
# Cf le fichier census_income_metadata pour savoir à quoi correspondent les numéros des variables
for(i in contVars)
{
	aze <- summary(training[,i])
	print(paste("Attribute #",(i-1),sep=""))
	print(aze)
	#boxplot(training[,i],data=training)
}

# Exploration des variables nominales 
for(i in (1:42)[-c(contVars,weightIndex )])
{
	Vfreq <- as.data.frame(table(training[,i]), responseName="Freq")
	Vfreq <- Vfreq [order(Vfreq$Freq,decreasing=TRUE),]
	Vfreq$Freq <- (Vfreq$Freq*100)/training.pop
	print(paste("Attribute #",(i-1),sep=""))
	print(Vfreq)
}



# Désormais inutile

Vfreq <- as.data.frame(table(training$V2), responseName="Freq")
Vfreq <- Vfreq [order(Vfreq$Freq,decreasing=TRUE),]
Vfreq$Freq <- (Vfreq$Freq*100)/training.pop
print("Class of worker (dec. order)")
Vfreq
Vfreq <- as.data.frame(table(training$V3), responseName="Freq")
Vfreq <- Vfreq [order(Vfreq$Freq,decreasing=TRUE),]
Vfreq$Freq <- (Vfreq$Freq*100)/training.pop
print("Industry recode (dec. order)")
Vfreq[1:5,]
Vfreq <- as.data.frame(table(training$V4), responseName="Freq")
Vfreq <- Vfreq [order(Vfreq$Freq,decreasing=TRUE),]
Vfreq$Freq <- (Vfreq$Freq*100)/training.pop
print("Occupation recode (dec. order)")
Vfreq[1:5,]
Vfreq <- as.data.frame(table(training$V5), responseName="Freq")
Vfreq <- Vfreq [order(Vfreq$Freq,decreasing=TRUE),]
Vfreq$Freq <- (Vfreq$Freq*100)/training.pop
print("Education (dec. order)")
Vfreq[1:5,]

Vfreq <- as.data.frame(table(training$V6), responseName="Freq")
Vfreq <- Vfreq [order(Vfreq$Freq,decreasing=TRUE),]
Vfreq$Freq <- (Vfreq$Freq*100)/training.pop
print("Wage per hour (dec. order)")
Vfreq[1:5,]
summary(training$V6)

# Donnée difficile à représenter, le grand nombre de zéros est certainement dû à des trous
# dans les informations, ainsi 0 pourrait représenter à la fois ceux n'ayant pas répondu
# et ceux n'ayant pas de revenus, d'où peut-être la si grande proportion de zéros.
counts1 <- training[training$V6>0,]$V6
hist(table(counts1), main="Hourly wage (when superior to zero)", xlab="Hourly wage",ylab="Population")

Vfreq <- as.data.frame(table(training$V7), responseName="Freq")
Vfreq <- Vfreq [order(Vfreq$Freq,decreasing=TRUE),]
Vfreq$Freq <- (Vfreq$Freq*100)/training.pop
print("Enrolled in education last week (dec. order)")
Vfreq

Vfreq <- as.data.frame(table(training$V8), responseName="Freq")
Vfreq <- Vfreq [order(Vfreq$Freq,decreasing=TRUE),]
Vfreq$Freq <- (Vfreq$Freq*100)/training.pop
print("Marital status (dec. order)")
Vfreq

Vfreq <- as.data.frame(table(training$V9), responseName="Freq")
Vfreq <- Vfreq [order(Vfreq$Freq,decreasing=TRUE),]
Vfreq$Freq <- (Vfreq$Freq*100)/training.pop
print("Major industry code (dec. order)")
Vfreq[1:5,]

Vfreq <- as.data.frame(table(training$V10), responseName="Freq")
Vfreq <- Vfreq [order(Vfreq$Freq,decreasing=TRUE),]
Vfreq$Freq <- (Vfreq$Freq*100)/training.pop
print("Major occupation code (dec. order)")
Vfreq[1:5,]

Vfreq <- as.data.frame(table(training$V11), responseName="Freq")
Vfreq <- Vfreq [order(Vfreq$Freq,decreasing=TRUE),]
Vfreq$Freq <- (Vfreq$Freq*100)/training.pop
print("Race (dec. order)")
Vfreq

Vfreq <- as.data.frame(table(training$V12), responseName="Freq")
Vfreq <- Vfreq [order(Vfreq$Freq,decreasing=TRUE),]
Vfreq$Freq <- (Vfreq$Freq*100)/training.pop
print("Hispanic origin (dec. order)")
Vfreq
