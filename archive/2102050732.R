#Read Dataset
dataset = read.csv("F:M AZMI ZAMZAMI RIYADIN/archive/car data.csv")

#Melihat Dataset
View(dataset)
str(dataset)

#->PREPROCESSING DATA
#Mengatasi Misssing Value dengan replace by mean value
rawdata = dataset
for (i in 1:ncol(rawdata)) {
  rawdata[is.na(rawdata[,i]), i] <- mean(rawdata[,i], na.rm = TRUE)
}
View(rawdata)

#Mengatasi Missing Value dengan menghapus NA
rawdata1 = rawdata
rawdata1 <- na.omit(rawdata)
View(rawdata1)
str(rawdata1)

#Menyimpan lagi dengan format Csv
write.csv(rawdata1, "F:/M AZMI ZAMZAMI RIYADIN/archive/data mobil.csv")

#read Dataset
rawdata1 <-read.csv("F:/M AZMI ZAMZAMI RIYADIN/archive/data mobil.csv")
View(rawdata1)
str(rawdata1)

#Menghapus Data Kolom
rawdata2 = rawdata1[,-1]
View(rawdata2)
str(rawdata2)

#Decision Trees With Package rpart
install.packages("dplyr", dependencies = TRUE)
library(dplyr)
#all Character Colums To Factor
character_vars<- lapply(rawdata2, class)== "character"
rawdata2[, character_vars]<- lapply(rawdata2[,character_vars], as.factor)
str(rawdata2)

#Partition and Create training set and testing set
set.seed(123)
cuaca <- sample(2, nrow(rawdata2), replace = TRUE, prob = c(0.8, 0.2))

datatrain <- rawdata2[cuaca==1,]
dataset <- rawdata2[cuaca==2,]

#Cek Proporsi Split Data Sudah Seimbang Atau Belum
dim(datatrain)
dim(dataset)

#Build Model
install.packages("party")
install.packages("partykit")
library(party)
library(partykit)
library(rpart.plot)
library(rpart)
library(tidyrules)
library(c50)
library(caret)
library(caTools)
str(rawdata2)

