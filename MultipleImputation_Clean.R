# 1. Prediction matrix selection ---------------------------------------------

load("~/KUL - Clases/Master Thesis/R THESIS/CleanedSubdata.Rdata")

imputedata <- as.data.frame(subdata)
imputedata <- subdata[,-4]

predmatrix <- mice::quickpred(imputedata, mincor = 0.25, include = SEM_variable_list)

predmatrix_reduced <- predmatrix
predmatrix_reduced[,!colnames(predmatrix) %in% c("V2B.8_1",  "V2B.8_2",  "V2B.8_3",  "V2B.8_4",  "V2B.8_5",  "V2B.8_6",  "V2B.8_7",  "V2B.8_8",  "V2B.8_9",
                                                 "bv2b8_1",  "bv2b8_2",  "bv2b8_3",  "bv2b8_4", "bv2b8_5",  "bv2b8_6",  "bv2b8_7",  "bv2b8_8",  "bv2b8_9",
                                                 "cv2b8_1",  "cv2b8_2",  "cv2b8_3",  "cv2b8_4",  "cv2b8_5",  "cv2b8_6",  "cv2b8_7",  "cv2b8_8", "cv2b8_9",
                                                 "V2B.7_1",  "V2B.7_2",  "V2B.7_3",  "V2B.7_4",  "V2B.7_5",  "V2B.7_6",  "V2B.7_7",  "V2B.7_8",  "V2B.7_9",
                                                 "bv2b7_1",  "bv2b7_2",  "bv2b7_3", "bv2b7_4",  "bv2b7_5",  "bv2b7_6",  "bv2b7_7",  "bv2b7_8",  "bv2b7_9",
                                                 "cv2b7_1",  "cv2b7_2",  "cv2b7_3",  "cv2b7_4",  "cv2b7_5",  "cv2b7_6",  "cv2b7_7", "cv2b7_8",  "cv2b7_9",
                                                 "age_W1",   "id2", "NumRomW3", "NumSexW3", "cv3a3_6a", "coercive_w4")] <- 0


# 2. Pre-processing for imputation ----------------------------------------

new.levels <- c(2,2,3,4,4) # Collapse first and second categories

imputedata[,c("V2B.8_1", "V2B.8_2",  "V2B.8_3",  "V2B.8_4",  "V2B.8_5",  "V2B.8_6",  "V2B.8_7",  "V2B.8_8",  "V2B.8_9",
              "bv2b8_1",  "bv2b8_2",  "bv2b8_3",  "bv2b8_4", "bv2b8_5",  "bv2b8_6",  "bv2b8_7",  "bv2b8_8",  "bv2b8_9",
              "cv2b8_1",  "cv2b8_2",  "cv2b8_3",  "cv2b8_4",  "cv2b8_5",  "cv2b8_6",  "cv2b8_7",  "cv2b8_8", "cv2b8_9",
              "V2B.7_1",  "V2B.7_2",  "V2B.7_3",  "V2B.7_4",  "V2B.7_5",  "V2B.7_6",  "V2B.7_7",  "V2B.7_8",  "V2B.7_9",
              "bv2b7_1",  "bv2b7_2",  "bv2b7_3", "bv2b7_4",  "bv2b7_5",  "bv2b7_6",  "bv2b7_7",  "bv2b7_8",  "bv2b7_9",
              "cv2b7_1",  "cv2b7_2",  "cv2b7_3",  "cv2b7_4",  "cv2b7_5",  "cv2b7_6",  "cv2b7_7", "cv2b7_8",  "cv2b7_9")] <- lapply(imputedata[,c("V2B.8_1", "V2B.8_2",  "V2B.8_3",  "V2B.8_4",  "V2B.8_5",  "V2B.8_6",  "V2B.8_7",  "V2B.8_8",  "V2B.8_9",
                                                                                                                                                 "bv2b8_1",  "bv2b8_2",  "bv2b8_3",  "bv2b8_4", "bv2b8_5",  "bv2b8_6",  "bv2b8_7",  "bv2b8_8",  "bv2b8_9",
                                                                                                                                                 "cv2b8_1",  "cv2b8_2",  "cv2b8_3",  "cv2b8_4",  "cv2b8_5",  "cv2b8_6",  "cv2b8_7",  "cv2b8_8", "cv2b8_9",
                                                                                                                                                 "V2B.7_1",  "V2B.7_2",  "V2B.7_3",  "V2B.7_4",  "V2B.7_5",  "V2B.7_6",  "V2B.7_7",  "V2B.7_8",  "V2B.7_9",
                                                                                                                                                 "bv2b7_1",  "bv2b7_2",  "bv2b7_3", "bv2b7_4",  "bv2b7_5",  "bv2b7_6",  "bv2b7_7",  "bv2b7_8",  "bv2b7_9",
                                                                                                                                                 "cv2b7_1",  "cv2b7_2",  "cv2b7_3",  "cv2b7_4",  "cv2b7_5",  "cv2b7_6",  "cv2b7_7", "cv2b7_8",  "cv2b7_9")],
                                                                                                                                   function (x) factor(new.levels[x]))



# 3. Imputation -----------------------------------------------------------

# Was done in 4 machines simultaneously to parallelize computation time

# 1
begin_1 <- Sys.time()
finalImp10_1 <- mice::mice(imputedata, m = 10, maxit = 25, seed = 12345, predictorMatrix = predmatrix_reduced)
end_1 <- Sys.time()


end_1 - begin_1

save(finalImp10_1, file = "finalImp10_1.Rdata")

# 2
begin_2 <- Sys.time()
finalImp10_2 <- mice::mice(imputedata, m = 10, maxit = 25, seed = 23456, predictorMatrix = predmatrix_reduced)
end_2 <- Sys.time()


end_2 - begin_2

save(finalImp10_2, file = "finalImp10_2.Rdata")

# 3
begin_3 <- Sys.time()
finalImp10_3 <- mice::mice(imputedata, m = 10, maxit = 25, seed = 34567, predictorMatrix = predmatrix_reduced)
end_3 <- Sys.time()


end_3 - begin_3

save(finalImp10_3, file = "finalImp10_3.Rdata")

# 4
begin_4 <- Sys.time()
finalImp10_4 <- mice::mice(imputedata, m = 10, maxit = 25, seed = 45678, predictorMatrix = predmatrix_reduced)
end_4 <- Sys.time()


end_4 - begin_4

save(finalImp10_4, file = "finalImp10_4.Rdata")


# 4. Merging --------------------------------------------------------------


finalImp10_12 <- mice::ibind(finalImp10_1, finalImp10_2)
finalImp10_124 <- mice::ibind(finalImp10_12, finalImp10_4) 
# Order is altered due to differing completion times for the different machines
finalImp10_1234 <- mice::ibind(finalImp10_124, finalImp10_3)


# 5. Pre-processing of final dataset -----------------------------------------------

temp_long <- mice::complete(finalImp10_1234, "long", include = TRUE) # Expand

temp_long$coercive_w4 <- as.ordered(temp_long$coercive_w4) # Recode

finalImp10_1234_R <- mice::as.mids(temp_long) # Contract

# 6. Analyze --------------------------------------------------------------

begin <- Sys.time()
set.seed(0731203)
FinalResult <- semTools::runMI(MI_Model, data =  finalImp10_1234_R,
                               fun = "sem", estimator = 'ULSMV', control = list(rel.tol = 1e-5, abs.tol = 1e-7),
                               verbose = TRUE)
end <- Sys.time()
end - begin
save(FinalResult, file = 'FinalResult.Rdata')
