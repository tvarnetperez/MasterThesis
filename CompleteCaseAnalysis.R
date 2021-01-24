library(lavaan)

# Reduced Model Syntax

StructuralPruned <- '
  peers3 =~ cv2b8_1 + cv2b8_2 + cv2b8_3 + cv2b8_4 + cv2b8_5 + cv2b8_6 + cv2b8_7 + cv2b8_8 + cv2b8_9 
  parents3 =~ cv2b7_1 + cv2b7_2 + cv2b7_3 + cv2b7_4 + cv2b7_5 + cv2b7_6 + cv2b7_7 + cv2b7_8 + cv2b7_9 
  
coercive_w4 ~ peers3 + parents3 +
id2 + age_W1 +
NumRomW3 + cv3a3_6a

peers3 ~ age_W1
parents3 ~ age_W1
NumRomW3 ~ + age_W1
	'


#ULSMV
subdata$coercive_w4 <- as.ordered(subdata$coercive_w4)

completecase_fit <- sem(StructuralPruned, data = subdata, estimator = "ULSMV")
save(completecase_fit, file = 'CompleteCaseFit.Rdata')

#MLR
subdataML <- subdata
subdataML <- as.data.frame(subdataML)
subdataML[,c(peersattachment_w3, parentalattachment_w3)] <- lapply(subdataML[,c(peersattachment_w3, parentalattachment_w3)], as.numeric)
subdataML[,"coercive_w4"] <- as.integer(subdataML[,"coercive_w4"])

completecase_ML_fit <- sem(StructuralPruned, data = subdataML, estimator = "MLR")

save(completecase_ML_fit, file = 'CompleteCaseMLFit.Rdata')

#Summaries
lavaan::summary(completecase_fit)
lavaan::summary(completecase_ML_fit)