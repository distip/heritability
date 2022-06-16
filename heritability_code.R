library(MASS)
library(tidyr)
library(dplyr)
library(heritability)

data <- read.csv('spectrum.csv')

H <- repeatability(data.vector=data$X750,geno.vector= data$Genotype,
                covariates.frame=as.data.frame(data[,2]))

columns <- colnames(data %>% dplyr:: select(starts_with('X')))


H_all <- c()
for (i in 4:ncol(data)) {
  H <- repeatability(data.vector=data[,i] ,geno.vector= data$Genotype,covariates.frame=as.data.frame(data[,2]))
  H_all <- c(H_all, H$repeatability)
  }
print(H_all)
