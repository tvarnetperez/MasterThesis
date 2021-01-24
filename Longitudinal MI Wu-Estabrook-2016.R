# 1. Peers ----------------------------------------------------------------

cfapeers <- '
peers1 =~ V2B.8_1 + V2B.8_1 + V2B.8_2 + V2B.8_3 + V2B.8_4 +
  V2B.8_5 + V2B.8_6 + V2B.8_7 + V2B.8_8 + V2B.8_9

peers2 =~ bv2b8_1 + bv2b8_1 + bv2b8_2 + bv2b8_3 + 
  bv2b8_4 + bv2b8_5 + bv2b8_6 + bv2b8_7 + bv2b8_8 + bv2b8_9

peers3 =~ cv2b8_1 + cv2b8_1 + cv2b8_2 + cv2b8_3 +
  cv2b8_4 + cv2b8_5 + cv2b8_6 + cv2b8_7 + cv2b8_8 + cv2b8_9
'

# Wu & Estabrook, 2016
#configpeersmodel_theta <- semTools::measEq.syntax(cfapeers, data = subdata,
 #                                           parameterization = "theta",
 #                                           ID.cat = "Wu.Estabrook.2016",
 #                                           longFacNames = list(PeerAttachment = c('peers1', 'peers2', 'peers3')))


thrash <- semTools::measEq.syntax(cfapeers, data = subdata,
                                          parameterization = "delta",
                                          ID.cat = "Wu.Estabrook.2016",
                                          longFacNames = list(PeerAttachment = c('peers1', 'peers2', 'peers3')),
                                          long.equal = c("thresholds"))

cat(as.character(thrash))

# 1.1. Configural ---------------------------------------------------------


#Delta parameterization
configpeers_model <- 
'
## FACTOR LOADINGS
# All loadings are freely estimated for each item and for each wave

peers1 =~ NA*V2B.8_1 + lambda.1_1*V2B.8_1
peers1 =~ NA*V2B.8_2 + lambda.2_1*V2B.8_2
peers1 =~ NA*V2B.8_3 + lambda.3_1*V2B.8_3
peers1 =~ NA*V2B.8_4 + lambda.4_1*V2B.8_4
peers1 =~ NA*V2B.8_5 + lambda.5_1*V2B.8_5
peers1 =~ NA*V2B.8_6 + lambda.6_1*V2B.8_6
peers1 =~ NA*V2B.8_7 + lambda.7_1*V2B.8_7
peers1 =~ NA*V2B.8_8 + lambda.8_1*V2B.8_8
peers1 =~ NA*V2B.8_9 + lambda.9_1*V2B.8_9
peers2 =~ NA*bv2b8_1 + lambda.10_2*bv2b8_1
peers2 =~ NA*bv2b8_2 + lambda.11_2*bv2b8_2
peers2 =~ NA*bv2b8_3 + lambda.12_2*bv2b8_3
peers2 =~ NA*bv2b8_4 + lambda.13_2*bv2b8_4
peers2 =~ NA*bv2b8_5 + lambda.14_2*bv2b8_5
peers2 =~ NA*bv2b8_6 + lambda.15_2*bv2b8_6
peers2 =~ NA*bv2b8_7 + lambda.16_2*bv2b8_7
peers2 =~ NA*bv2b8_8 + lambda.17_2*bv2b8_8
peers2 =~ NA*bv2b8_9 + lambda.18_2*bv2b8_9
peers3 =~ NA*cv2b8_1 + lambda.19_3*cv2b8_1
peers3 =~ NA*cv2b8_2 + lambda.20_3*cv2b8_2
peers3 =~ NA*cv2b8_3 + lambda.21_3*cv2b8_3
peers3 =~ NA*cv2b8_4 + lambda.22_3*cv2b8_4
peers3 =~ NA*cv2b8_5 + lambda.23_3*cv2b8_5
peers3 =~ NA*cv2b8_6 + lambda.24_3*cv2b8_6
peers3 =~ NA*cv2b8_7 + lambda.25_3*cv2b8_7
peers3 =~ NA*cv2b8_8 + lambda.26_3*cv2b8_8
peers3 =~ NA*cv2b8_9 + lambda.27_3*cv2b8_9

## THRESHOLDS:
# Thresholds are freely estimated for each item and for each wave.

V2B.8_1 | NA*t1 + V2B.8_1.thr1*t1; V2B.8_1 | NA*t2 + V2B.8_1.thr2*t2; V2B.8_1 | NA*t3 + V2B.8_1.thr3*t3; V2B.8_1 | NA*t4 + V2B.8_1.thr4*t4
V2B.8_2 | NA*t1 + V2B.8_2.thr1*t1; V2B.8_2 | NA*t2 + V2B.8_2.thr2*t2; V2B.8_2 | NA*t3 + V2B.8_2.thr3*t3; V2B.8_2 | NA*t4 + V2B.8_2.thr4*t4
V2B.8_3 | NA*t1 + V2B.8_3.thr1*t1; V2B.8_3 | NA*t2 + V2B.8_3.thr2*t2; V2B.8_3 | NA*t3 + V2B.8_3.thr3*t3; V2B.8_3 | NA*t4 + V2B.8_3.thr4*t4
V2B.8_4 | NA*t1 + V2B.8_4.thr1*t1; V2B.8_4 | NA*t2 + V2B.8_4.thr2*t2; V2B.8_4 | NA*t3 + V2B.8_4.thr3*t3; V2B.8_4 | NA*t4 + V2B.8_4.thr4*t4
V2B.8_5 | NA*t1 + V2B.8_5.thr1*t1; V2B.8_5 | NA*t2 + V2B.8_5.thr2*t2; V2B.8_5 | NA*t3 + V2B.8_5.thr3*t3; V2B.8_5 | NA*t4 + V2B.8_5.thr4*t4
V2B.8_6 | NA*t1 + V2B.8_6.thr1*t1; V2B.8_6 | NA*t2 + V2B.8_6.thr2*t2; V2B.8_6 | NA*t3 + V2B.8_6.thr3*t3; V2B.8_6 | NA*t4 + V2B.8_6.thr4*t4
V2B.8_7 | NA*t1 + V2B.8_7.thr1*t1; V2B.8_7 | NA*t2 + V2B.8_7.thr2*t2; V2B.8_7 | NA*t3 + V2B.8_7.thr3*t3; V2B.8_7 | NA*t4 + V2B.8_7.thr4*t4
V2B.8_8 | NA*t1 + V2B.8_8.thr1*t1; V2B.8_8 | NA*t2 + V2B.8_8.thr2*t2; V2B.8_8 | NA*t3 + V2B.8_8.thr3*t3; V2B.8_8 | NA*t4 + V2B.8_8.thr4*t4
V2B.8_9 | NA*t1 + V2B.8_9.thr1*t1; V2B.8_9 | NA*t2 + V2B.8_9.thr2*t2; V2B.8_9 | NA*t3 + V2B.8_9.thr3*t3; V2B.8_9 | NA*t4 + V2B.8_9.thr4*t4
bv2b8_1 | NA*t1 + bv2b8_1.thr1*t1; bv2b8_1 | NA*t2 + bv2b8_1.thr2*t2; bv2b8_1 | NA*t3 + bv2b8_1.thr3*t3; bv2b8_1 | NA*t4 + bv2b8_1.thr4*t4
bv2b8_2 | NA*t1 + bv2b8_2.thr1*t1; bv2b8_2 | NA*t2 + bv2b8_2.thr2*t2; bv2b8_2 | NA*t3 + bv2b8_2.thr3*t3; bv2b8_2 | NA*t4 + bv2b8_2.thr4*t4
bv2b8_3 | NA*t1 + bv2b8_3.thr1*t1; bv2b8_3 | NA*t2 + bv2b8_3.thr2*t2; bv2b8_3 | NA*t3 + bv2b8_3.thr3*t3; bv2b8_3 | NA*t4 + bv2b8_3.thr4*t4
bv2b8_4 | NA*t1 + bv2b8_4.thr1*t1; bv2b8_4 | NA*t2 + bv2b8_4.thr2*t2; bv2b8_4 | NA*t3 + bv2b8_4.thr3*t3; bv2b8_4 | NA*t4 + bv2b8_4.thr4*t4
bv2b8_5 | NA*t1 + bv2b8_5.thr1*t1; bv2b8_5 | NA*t2 + bv2b8_5.thr2*t2; bv2b8_5 | NA*t3 + bv2b8_5.thr3*t3; bv2b8_5 | NA*t4 + bv2b8_5.thr4*t4
bv2b8_6 | NA*t1 + bv2b8_6.thr1*t1; bv2b8_6 | NA*t2 + bv2b8_6.thr2*t2; bv2b8_6 | NA*t3 + bv2b8_6.thr3*t3; bv2b8_6 | NA*t4 + bv2b8_6.thr4*t4
bv2b8_7 | NA*t1 + bv2b8_7.thr1*t1; bv2b8_7 | NA*t2 + bv2b8_7.thr2*t2; bv2b8_7 | NA*t3 + bv2b8_7.thr3*t3; bv2b8_7 | NA*t4 + bv2b8_7.thr4*t4
bv2b8_8 | NA*t1 + bv2b8_8.thr1*t1; bv2b8_8 | NA*t2 + bv2b8_8.thr2*t2; bv2b8_8 | NA*t3 + bv2b8_8.thr3*t3; bv2b8_8 | NA*t4 + bv2b8_8.thr4*t4
bv2b8_9 | NA*t1 + bv2b8_9.thr1*t1; bv2b8_9 | NA*t2 + bv2b8_9.thr2*t2; bv2b8_9 | NA*t3 + bv2b8_9.thr3*t3; bv2b8_9 | NA*t4 + bv2b8_9.thr4*t4
cv2b8_1 | NA*t1 + cv2b8_1.thr1*t1; cv2b8_1 | NA*t2 + cv2b8_1.thr2*t2; cv2b8_1 | NA*t3 + cv2b8_1.thr3*t3; cv2b8_1 | NA*t4 + cv2b8_1.thr4*t4
cv2b8_2 | NA*t1 + cv2b8_2.thr1*t1; cv2b8_2 | NA*t2 + cv2b8_2.thr2*t2; cv2b8_2 | NA*t3 + cv2b8_2.thr3*t3; cv2b8_2 | NA*t4 + cv2b8_2.thr4*t4
cv2b8_3 | NA*t1 + cv2b8_3.thr1*t1; cv2b8_3 | NA*t2 + cv2b8_3.thr2*t2; cv2b8_3 | NA*t3 + cv2b8_3.thr3*t3; cv2b8_3 | NA*t4 + cv2b8_3.thr4*t4
cv2b8_4 | NA*t1 + cv2b8_4.thr1*t1; cv2b8_4 | NA*t2 + cv2b8_4.thr2*t2; cv2b8_4 | NA*t3 + cv2b8_4.thr3*t3; cv2b8_4 | NA*t4 + cv2b8_4.thr4*t4
cv2b8_5 | NA*t1 + cv2b8_5.thr1*t1; cv2b8_5 | NA*t2 + cv2b8_5.thr2*t2; cv2b8_5 | NA*t3 + cv2b8_5.thr3*t3; cv2b8_5 | NA*t4 + cv2b8_5.thr4*t4
cv2b8_6 | NA*t1 + cv2b8_6.thr1*t1; cv2b8_6 | NA*t2 + cv2b8_6.thr2*t2; cv2b8_6 | NA*t3 + cv2b8_6.thr3*t3; cv2b8_6 | NA*t4 + cv2b8_6.thr4*t4
cv2b8_7 | NA*t1 + cv2b8_7.thr1*t1; cv2b8_7 | NA*t2 + cv2b8_7.thr2*t2; cv2b8_7 | NA*t3 + cv2b8_7.thr3*t3; cv2b8_7 | NA*t4 + cv2b8_7.thr4*t4
cv2b8_8 | NA*t1 + cv2b8_8.thr1*t1; cv2b8_8 | NA*t2 + cv2b8_8.thr2*t2; cv2b8_8 | NA*t3 + cv2b8_8.thr3*t3; cv2b8_8 | NA*t4 + cv2b8_8.thr4*t4
cv2b8_9 | NA*t1 + cv2b8_9.thr1*t1; cv2b8_9 | NA*t2 + cv2b8_9.thr2*t2; cv2b8_9 | NA*t3 + cv2b8_9.thr3*t3; cv2b8_9 | NA*t4 + cv2b8_9.thr4*t4

## INTERCEPTS:
# All 27 item intercepts are constrained to 0.

V2B.8_1 ~ nu.1*1 + 0*1
V2B.8_2 ~ nu.2*1 + 0*1
V2B.8_3 ~ nu.3*1 + 0*1
V2B.8_4 ~ nu.4*1 + 0*1
V2B.8_5 ~ nu.5*1 + 0*1
V2B.8_6 ~ nu.6*1 + 0*1
V2B.8_7 ~ nu.7*1 + 0*1
V2B.8_8 ~ nu.8*1 + 0*1
V2B.8_9 ~ nu.9*1 + 0*1
bv2b8_1 ~ nu.10*1 + 0*1
bv2b8_2 ~ nu.11*1 + 0*1
bv2b8_3 ~ nu.12*1 + 0*1
bv2b8_4 ~ nu.13*1 + 0*1
bv2b8_5 ~ nu.14*1 + 0*1
bv2b8_6 ~ nu.15*1 + 0*1
bv2b8_7 ~ nu.16*1 + 0*1
bv2b8_8 ~ nu.17*1 + 0*1
bv2b8_9 ~ nu.18*1 + 0*1
cv2b8_1 ~ nu.19*1 + 0*1
cv2b8_2 ~ nu.20*1 + 0*1
cv2b8_3 ~ nu.21*1 + 0*1
cv2b8_4 ~ nu.22*1 + 0*1
cv2b8_5 ~ nu.23*1 + 0*1
cv2b8_6 ~ nu.24*1 + 0*1
cv2b8_7 ~ nu.25*1 + 0*1
cv2b8_8 ~ nu.26*1 + 0*1
cv2b8_9 ~ nu.27*1 + 0*1

## SCALING FACTORS:
#As this is the Delta parametrization, there are no constraints
#on the unique-factor variances, but instead all latent response variable
#variances are set to 1

V2B.8_1 ~*~ 1*V2B.8_1
V2B.8_2 ~*~ 1*V2B.8_2
V2B.8_3 ~*~ 1*V2B.8_3
V2B.8_4 ~*~ 1*V2B.8_4
V2B.8_5 ~*~ 1*V2B.8_5
V2B.8_6 ~*~ 1*V2B.8_6
V2B.8_7 ~*~ 1*V2B.8_7
V2B.8_8 ~*~ 1*V2B.8_8
V2B.8_9 ~*~ 1*V2B.8_9
bv2b8_1 ~*~ 1*bv2b8_1
bv2b8_2 ~*~ 1*bv2b8_2
bv2b8_3 ~*~ 1*bv2b8_3
bv2b8_4 ~*~ 1*bv2b8_4
bv2b8_5 ~*~ 1*bv2b8_5
bv2b8_6 ~*~ 1*bv2b8_6
bv2b8_7 ~*~ 1*bv2b8_7
bv2b8_8 ~*~ 1*bv2b8_8
bv2b8_9 ~*~ 1*bv2b8_9
cv2b8_1 ~*~ 1*cv2b8_1
cv2b8_2 ~*~ 1*cv2b8_2
cv2b8_3 ~*~ 1*cv2b8_3
cv2b8_4 ~*~ 1*cv2b8_4
cv2b8_5 ~*~ 1*cv2b8_5
cv2b8_6 ~*~ 1*cv2b8_6
cv2b8_7 ~*~ 1*cv2b8_7
cv2b8_8 ~*~ 1*cv2b8_8
cv2b8_9 ~*~ 1*cv2b8_9



## UNIQUE-FACTOR COVARIANCES:
# Same item across wave is auto-correlated. 

V2B.8_1 ~~ NA*bv2b8_1 + theta.10_1*bv2b8_1; V2B.8_1 ~~ NA*cv2b8_1 + theta.19_1*cv2b8_1
V2B.8_2 ~~ NA*bv2b8_2 + theta.11_2*bv2b8_2; V2B.8_2 ~~ NA*cv2b8_2 + theta.20_2*cv2b8_2
V2B.8_3 ~~ NA*bv2b8_3 + theta.12_3*bv2b8_3; V2B.8_3 ~~ NA*cv2b8_3 + theta.21_3*cv2b8_3
V2B.8_4 ~~ NA*bv2b8_4 + theta.13_4*bv2b8_4; V2B.8_4 ~~ NA*cv2b8_4 + theta.22_4*cv2b8_4
V2B.8_5 ~~ NA*bv2b8_5 + theta.14_5*bv2b8_5; V2B.8_5 ~~ NA*cv2b8_5 + theta.23_5*cv2b8_5
V2B.8_6 ~~ NA*bv2b8_6 + theta.15_6*bv2b8_6; V2B.8_6 ~~ NA*cv2b8_6 + theta.24_6*cv2b8_6
V2B.8_7 ~~ NA*bv2b8_7 + theta.16_7*bv2b8_7; V2B.8_7 ~~ NA*cv2b8_7 + theta.25_7*cv2b8_7
V2B.8_8 ~~ NA*bv2b8_8 + theta.17_8*bv2b8_8; V2B.8_8 ~~ NA*cv2b8_8 + theta.26_8*cv2b8_8
V2B.8_9 ~~ NA*bv2b8_9 + theta.18_9*bv2b8_9; V2B.8_9 ~~ NA*cv2b8_9 + theta.27_9*cv2b8_9
bv2b8_1 ~~ NA*cv2b8_1 + theta.19_10*cv2b8_1
bv2b8_2 ~~ NA*cv2b8_2 + theta.20_11*cv2b8_2
bv2b8_3 ~~ NA*cv2b8_3 + theta.21_12*cv2b8_3
bv2b8_4 ~~ NA*cv2b8_4 + theta.22_13*cv2b8_4
bv2b8_5 ~~ NA*cv2b8_5 + theta.23_14*cv2b8_5
bv2b8_6 ~~ NA*cv2b8_6 + theta.24_15*cv2b8_6
bv2b8_7 ~~ NA*cv2b8_7 + theta.25_16*cv2b8_7
bv2b8_8 ~~ NA*cv2b8_8 + theta.26_17*cv2b8_8
bv2b8_9 ~~ NA*cv2b8_9 + theta.27_18*cv2b8_9 

## LATENT MEANS/INTERCEPTS:
# Common factor means set to 0.

peers1 ~ alpha.1*1 + 0*1
peers2 ~ alpha.2*1 + 0*1
peers3 ~ alpha.3*1 + 0*1

## COMMON-FACTOR VARIANCES:
# Common factor variances set to 1

peers1 ~~ 1*peers1 + psi.1_1*peers1
peers2 ~~ 1*peers2 + psi.2_2*peers2
peers3 ~~ 1*peers3 + psi.3_3*peers3

## COMMON-FACTOR COVARIANCES:
# Autocorrelated factors across time

peers1 ~~ NA*peers2 + psi.2_1*peers2
peers1 ~~ NA*peers3 + psi.3_1*peers3
peers2 ~~ NA*peers3 + psi.3_2*peers3
'

configpeers_fit <- cfa(configpeers_model, data = subdata, estimator = 'ULSMV')
summary(configpeers_fit)
round(inspect(configpeers_fit, 'fit.measures')[c("npar", "chisq.scaled", "df.scaled", "pvalue.scaled", 
                                                 "cfi.scaled", "tli.scaled", "crmr")], 3)


# 1.1.1. Specification Search ---------------------------------------------


modificationindices(configpeers_fit, sort = TRUE, minimum.value = 10)

#         lhs op     rhs     mi    epc sepc.lv sepc.all sepc.nox
# 625 cv2b8_6 ~~ cv2b8_7 24.219  0.178   0.178    0.405    0.405
# 262  peers1 =~ cv2b8_1 17.183  0.118   0.118    0.118    0.118
# 417 V2B.8_6 ~~ V2B.8_7 16.589  0.148   0.148    0.342    0.342
# 280  peers2 =~ cv2b8_1 16.168  0.148   0.148    0.148    0.148
# 518 bv2b8_3 ~~ bv2b8_4 15.658  0.144   0.144    0.369    0.369
# 354 V2B.8_3 ~~ V2B.8_4 15.465  0.144   0.144    0.373    0.373


# 1st 
configpeers_model1 <- paste0(configpeers_model, '\n## LOCALIZED ACQUIESCENCE \n \ncv2b8_6 ~~ aq1*cv2b8_7')
cat(configpeers_model1)

configpeers_fit1 <- cfa(configpeers_model1, data = subdata, estimator = 'ULSMV')
round(inspect(configpeers_fit1, 'fit.measures')[c("npar", "chisq.scaled", "df.scaled", "pvalue.scaled", 
                                                 "cfi.scaled", "tli.scaled", "crmr")], 3)



modificationindices(configpeers_fit1, sort = TRUE, minimum.value = 10)
#418 V2B.8_6 ~~ V2B.8_7 16.727  0.149   0.149    0.342    0.342
#519 bv2b8_3 ~~ bv2b8_4 15.589  0.144   0.144    0.368    0.368
#355 V2B.8_3 ~~ V2B.8_4 15.416  0.144   0.144    0.373    0.373
#263  peers1 =~ cv2b8_1 15.300  0.112   0.112    0.112    0.112
#622 cv2b8_5 ~~ cv2b8_6 14.616  0.139   0.139    0.339    0.339

# 2nd

configpeers_model2 <- paste0(configpeers_model1, '\nV2B.8_6 ~~ aq2*V2B.8_7 \n')
cat(configpeers_model2)

configpeers_fit2 <- cfa(configpeers_model2, data = subdata, estimator = 'ULSMV')
round(inspect(configpeers_fit2, 'fit.measures')[c("npar", "chisq.scaled", "df.scaled", "pvalue.scaled", 
                                                  "cfi.scaled", "tli.scaled", "crmr")], 3)

modificationindices(configpeers_fit2, sort = TRUE, minimum.value = 10)
# 519 bv2b8_3 ~~ bv2b8_4 15.530  0.143   0.143    0.368    0.368
# 264  peers1 =~ cv2b8_1 15.452  0.114   0.114    0.114    0.114
# 356 V2B.8_3 ~~ V2B.8_4 15.227  0.143   0.143    0.371    0.371
# 622 cv2b8_5 ~~ cv2b8_6 14.680  0.140   0.140    0.339    0.339

# 3rd

configpeers_model3 <- paste0(configpeers_model2, 'bv2b8_3 ~~ aq3*bv2b8_4 \n')
cat(configpeers_model3)

configpeers_fit3 <- cfa(configpeers_model3, data = subdata, estimator = 'ULSMV')
round(inspect(configpeers_fit3, 'fit.measures')[c("npar", "chisq.scaled", "df.scaled", "pvalue.scaled", 
                                                  "cfi.scaled", "tli.scaled", "crmr")], 3)

modificationindices(configpeers_fit3, sort = TRUE, minimum.value = 10)

#         lhs op     rhs     mi   epc sepc.lv sepc.all sepc.nox
# 265  peers1 =~ cv2b8_1 15.460 0.114   0.114    0.114    0.114
# 357 V2B.8_3 ~~ V2B.8_4 15.387 0.144   0.144    0.373    0.373
# 622 cv2b8_5 ~~ cv2b8_6 14.620 0.139   0.139    0.339    0.339
# 283  peers2 =~ cv2b8_1 14.237 0.142   0.142    0.142    0.142
# 274  peers2 =~ V2B.8_1 12.931 0.122   0.122    0.122    0.122
# 558 bv2b8_6 ~~ bv2b8_7 11.077 0.121   0.121    0.301    0.301

# 4th

configpeers_model4 <- paste0(configpeers_model3, 'V2B.8_3 ~~ aq4*V2B.8_4 \n')
cat(configpeers_model4)

configpeers_fit4 <- cfa(configpeers_model4, data = subdata, estimator = 'ULSMV')
round(inspect(configpeers_fit4, 'fit.measures')[c("npar", "chisq.scaled", "df.scaled", "pvalue.scaled", 
                                                  "cfi.scaled", "tli.scaled", "crmr")], 3)

modificationindices(configpeers_fit4, sort = TRUE, minimum.value = 10)
#         lhs op     rhs     mi   epc sepc.lv sepc.all sepc.nox
# 266  peers1 =~ cv2b8_1 15.584 0.115   0.115    0.115    0.115
# 622 cv2b8_5 ~~ cv2b8_6 14.571 0.139   0.139    0.338    0.338
# 284  peers2 =~ cv2b8_1 14.255 0.142   0.142    0.142    0.142
# 275  peers2 =~ V2B.8_1 11.383 0.116   0.116    0.116    0.116
# 558 bv2b8_6 ~~ bv2b8_7 11.049 0.121   0.121    0.300    0.300

# 5th

configpeers_model5 <- paste0(configpeers_model4, 'cv2b8_5 ~~ aq5*cv2b8_6 \n')
cat(configpeers_model5)

configpeers_fit5 <- cfa(configpeers_model5, data = subdata, estimator = 'ULSMV')
round(inspect(configpeers_fit5, 'fit.measures')[c("npar", "chisq.scaled", "df.scaled", "pvalue.scaled", 
                                                  "cfi.scaled", "tli.scaled", "crmr")], 3)

modificationindices(configpeers_fit5, sort = TRUE, minimum.value = 10)
#         lhs op     rhs     mi   epc sepc.lv sepc.all sepc.nox
# 267  peers1 =~ cv2b8_1 14.028 0.110   0.110    0.110    0.110
# 285  peers2 =~ cv2b8_1 12.524 0.134   0.134    0.134    0.134
# 276  peers2 =~ V2B.8_1 11.396 0.116   0.116    0.116    0.116
# 559 bv2b8_6 ~~ bv2b8_7 11.114 0.121   0.121    0.301    0.301
# 623 cv2b8_5 ~~ cv2b8_7 10.535 0.120   0.120    0.348    0.348

# 6th

configpeers_model6 <- paste0(configpeers_model5, 'bv2b8_6 ~~ aq6*bv2b8_7 \n')
cat(configpeers_model6)

configpeers_fit6 <- cfa(configpeers_model6, data = subdata, estimator = 'ULSMV')
round(inspect(configpeers_fit6, 'fit.measures')[c("npar", "chisq.scaled", "df.scaled", "pvalue.scaled", 
                                                  "cfi.scaled", "tli.scaled", "crmr")], 3)

modificationindices(configpeers_fit6, sort = TRUE, minimum.value = 10)
#         lhs op     rhs     mi   epc sepc.lv sepc.all sepc.nox
# 268  peers1 =~ cv2b8_1 14.028 0.110   0.110    0.110    0.110
# 286  peers2 =~ cv2b8_1 12.650 0.136   0.136    0.136    0.136
# 548 bv2b8_5 ~~ bv2b8_6 12.006 0.126   0.126    0.316    0.316
# 277  peers2 =~ V2B.8_1 11.460 0.117   0.117    0.117    0.117

# 7th

configpeers_model7 <- paste0(configpeers_model6, 'bv2b8_5 ~~ aq7*bv2b8_6 \n')
cat(configpeers_model7)

configpeers_fit7 <- cfa(configpeers_model7, data = subdata, estimator = 'ULSMV')
round(inspect(configpeers_fit7, 'fit.measures')[c("npar", "chisq.scaled", "df.scaled", "pvalue.scaled", 
                                                  "cfi.scaled", "tli.scaled", "crmr")], 3)

modificationindices(configpeers_fit7, sort = TRUE, minimum.value = 10)


# 1.2. Threshold ----------------------------------------------------------

threshpeers_model <- '
## LOADINGS:
#Loadings are freely estimated

peers1 =~ NA*V2B.8_1 + lambda.1_1*V2B.8_1
peers1 =~ NA*V2B.8_2 + lambda.2_1*V2B.8_2
peers1 =~ NA*V2B.8_3 + lambda.3_1*V2B.8_3
peers1 =~ NA*V2B.8_4 + lambda.4_1*V2B.8_4
peers1 =~ NA*V2B.8_5 + lambda.5_1*V2B.8_5
peers1 =~ NA*V2B.8_6 + lambda.6_1*V2B.8_6
peers1 =~ NA*V2B.8_7 + lambda.7_1*V2B.8_7
peers1 =~ NA*V2B.8_8 + lambda.8_1*V2B.8_8
peers1 =~ NA*V2B.8_9 + lambda.9_1*V2B.8_9
peers2 =~ NA*bv2b8_1 + lambda.10_2*bv2b8_1
peers2 =~ NA*bv2b8_2 + lambda.11_2*bv2b8_2
peers2 =~ NA*bv2b8_3 + lambda.12_2*bv2b8_3
peers2 =~ NA*bv2b8_4 + lambda.13_2*bv2b8_4
peers2 =~ NA*bv2b8_5 + lambda.14_2*bv2b8_5
peers2 =~ NA*bv2b8_6 + lambda.15_2*bv2b8_6
peers2 =~ NA*bv2b8_7 + lambda.16_2*bv2b8_7
peers2 =~ NA*bv2b8_8 + lambda.17_2*bv2b8_8
peers2 =~ NA*bv2b8_9 + lambda.18_2*bv2b8_9
peers3 =~ NA*cv2b8_1 + lambda.19_3*cv2b8_1
peers3 =~ NA*cv2b8_2 + lambda.20_3*cv2b8_2
peers3 =~ NA*cv2b8_3 + lambda.21_3*cv2b8_3
peers3 =~ NA*cv2b8_4 + lambda.22_3*cv2b8_4
peers3 =~ NA*cv2b8_5 + lambda.23_3*cv2b8_5
peers3 =~ NA*cv2b8_6 + lambda.24_3*cv2b8_6
peers3 =~ NA*cv2b8_7 + lambda.25_3*cv2b8_7
peers3 =~ NA*cv2b8_8 + lambda.26_3*cv2b8_8
peers3 =~ NA*cv2b8_9 + lambda.27_3*cv2b8_9

## THRESHOLDS:
#Thresholds are the same across waves

V2B.8_1 | NA*t1 + V2B.8_1.thr1*t1; V2B.8_1 | NA*t2 + V2B.8_1.thr2*t2; V2B.8_1 | NA*t3 + V2B.8_1.thr3*t3; V2B.8_1 | NA*t4 + V2B.8_1.thr4*t4
V2B.8_2 | NA*t1 + V2B.8_2.thr1*t1; V2B.8_2 | NA*t2 + V2B.8_2.thr2*t2; V2B.8_2 | NA*t3 + V2B.8_2.thr3*t3; V2B.8_2 | NA*t4 + V2B.8_2.thr4*t4
V2B.8_3 | NA*t1 + V2B.8_3.thr1*t1; V2B.8_3 | NA*t2 + V2B.8_3.thr2*t2; V2B.8_3 | NA*t3 + V2B.8_3.thr3*t3; V2B.8_3 | NA*t4 + V2B.8_3.thr4*t4
V2B.8_4 | NA*t1 + V2B.8_4.thr1*t1; V2B.8_4 | NA*t2 + V2B.8_4.thr2*t2; V2B.8_4 | NA*t3 + V2B.8_4.thr3*t3; V2B.8_4 | NA*t4 + V2B.8_4.thr4*t4
V2B.8_5 | NA*t1 + V2B.8_5.thr1*t1; V2B.8_5 | NA*t2 + V2B.8_5.thr2*t2; V2B.8_5 | NA*t3 + V2B.8_5.thr3*t3; V2B.8_5 | NA*t4 + V2B.8_5.thr4*t4
V2B.8_6 | NA*t1 + V2B.8_6.thr1*t1; V2B.8_6 | NA*t2 + V2B.8_6.thr2*t2; V2B.8_6 | NA*t3 + V2B.8_6.thr3*t3; V2B.8_6 | NA*t4 + V2B.8_6.thr4*t4
V2B.8_7 | NA*t1 + V2B.8_7.thr1*t1; V2B.8_7 | NA*t2 + V2B.8_7.thr2*t2; V2B.8_7 | NA*t3 + V2B.8_7.thr3*t3; V2B.8_7 | NA*t4 + V2B.8_7.thr4*t4
V2B.8_8 | NA*t1 + V2B.8_8.thr1*t1; V2B.8_8 | NA*t2 + V2B.8_8.thr2*t2; V2B.8_8 | NA*t3 + V2B.8_8.thr3*t3; V2B.8_8 | NA*t4 + V2B.8_8.thr4*t4
V2B.8_9 | NA*t1 + V2B.8_9.thr1*t1; V2B.8_9 | NA*t2 + V2B.8_9.thr2*t2; V2B.8_9 | NA*t3 + V2B.8_9.thr3*t3; V2B.8_9 | NA*t4 + V2B.8_9.thr4*t4
bv2b8_1 | NA*t1 + V2B.8_1.thr1*t1; bv2b8_1 | NA*t2 + V2B.8_1.thr2*t2; bv2b8_1 | NA*t3 + V2B.8_1.thr3*t3; bv2b8_1 | NA*t4 + V2B.8_1.thr4*t4
bv2b8_2 | NA*t1 + V2B.8_2.thr1*t1; bv2b8_2 | NA*t2 + V2B.8_2.thr2*t2; bv2b8_2 | NA*t3 + V2B.8_2.thr3*t3; bv2b8_2 | NA*t4 + V2B.8_2.thr4*t4
bv2b8_3 | NA*t1 + V2B.8_3.thr1*t1; bv2b8_3 | NA*t2 + V2B.8_3.thr2*t2; bv2b8_3 | NA*t3 + V2B.8_3.thr3*t3; bv2b8_3 | NA*t4 + V2B.8_3.thr4*t4
bv2b8_4 | NA*t1 + V2B.8_4.thr1*t1; bv2b8_4 | NA*t2 + V2B.8_4.thr2*t2; bv2b8_4 | NA*t3 + V2B.8_4.thr3*t3; bv2b8_4 | NA*t4 + V2B.8_4.thr4*t4
bv2b8_5 | NA*t1 + V2B.8_5.thr1*t1; bv2b8_5 | NA*t2 + V2B.8_5.thr2*t2; bv2b8_5 | NA*t3 + V2B.8_5.thr3*t3; bv2b8_5 | NA*t4 + V2B.8_5.thr4*t4
bv2b8_6 | NA*t1 + V2B.8_6.thr1*t1; bv2b8_6 | NA*t2 + V2B.8_6.thr2*t2; bv2b8_6 | NA*t3 + V2B.8_6.thr3*t3; bv2b8_6 | NA*t4 + V2B.8_6.thr4*t4
bv2b8_7 | NA*t1 + V2B.8_7.thr1*t1; bv2b8_7 | NA*t2 + V2B.8_7.thr2*t2; bv2b8_7 | NA*t3 + V2B.8_7.thr3*t3; bv2b8_7 | NA*t4 + V2B.8_7.thr4*t4
bv2b8_8 | NA*t1 + V2B.8_8.thr1*t1; bv2b8_8 | NA*t2 + V2B.8_8.thr2*t2; bv2b8_8 | NA*t3 + V2B.8_8.thr3*t3; bv2b8_8 | NA*t4 + V2B.8_8.thr4*t4
bv2b8_9 | NA*t1 + V2B.8_9.thr1*t1; bv2b8_9 | NA*t2 + V2B.8_9.thr2*t2; bv2b8_9 | NA*t3 + V2B.8_9.thr3*t3; bv2b8_9 | NA*t4 + V2B.8_9.thr4*t4
cv2b8_1 | NA*t1 + V2B.8_1.thr1*t1; cv2b8_1 | NA*t2 + V2B.8_1.thr2*t2; cv2b8_1 | NA*t3 + V2B.8_1.thr3*t3; cv2b8_1 | NA*t4 + V2B.8_1.thr4*t4
cv2b8_2 | NA*t1 + V2B.8_2.thr1*t1; cv2b8_2 | NA*t2 + V2B.8_2.thr2*t2; cv2b8_2 | NA*t3 + V2B.8_2.thr3*t3; cv2b8_2 | NA*t4 + V2B.8_2.thr4*t4
cv2b8_3 | NA*t1 + V2B.8_3.thr1*t1; cv2b8_3 | NA*t2 + V2B.8_3.thr2*t2; cv2b8_3 | NA*t3 + V2B.8_3.thr3*t3; cv2b8_3 | NA*t4 + V2B.8_3.thr4*t4
cv2b8_4 | NA*t1 + V2B.8_4.thr1*t1; cv2b8_4 | NA*t2 + V2B.8_4.thr2*t2; cv2b8_4 | NA*t3 + V2B.8_4.thr3*t3; cv2b8_4 | NA*t4 + V2B.8_4.thr4*t4
cv2b8_5 | NA*t1 + V2B.8_5.thr1*t1; cv2b8_5 | NA*t2 + V2B.8_5.thr2*t2; cv2b8_5 | NA*t3 + V2B.8_5.thr3*t3; cv2b8_5 | NA*t4 + V2B.8_5.thr4*t4
cv2b8_6 | NA*t1 + V2B.8_6.thr1*t1; cv2b8_6 | NA*t2 + V2B.8_6.thr2*t2; cv2b8_6 | NA*t3 + V2B.8_6.thr3*t3; cv2b8_6 | NA*t4 + V2B.8_6.thr4*t4
cv2b8_7 | NA*t1 + V2B.8_7.thr1*t1; cv2b8_7 | NA*t2 + V2B.8_7.thr2*t2; cv2b8_7 | NA*t3 + V2B.8_7.thr3*t3; cv2b8_7 | NA*t4 + V2B.8_7.thr4*t4
cv2b8_8 | NA*t1 + V2B.8_8.thr1*t1; cv2b8_8 | NA*t2 + V2B.8_8.thr2*t2; cv2b8_8 | NA*t3 + V2B.8_8.thr3*t3; cv2b8_8 | NA*t4 + V2B.8_8.thr4*t4
cv2b8_9 | NA*t1 + V2B.8_9.thr1*t1; cv2b8_9 | NA*t2 + V2B.8_9.thr2*t2; cv2b8_9 | NA*t3 + V2B.8_9.thr3*t3; cv2b8_9 | NA*t4 + V2B.8_9.thr4*t4

## INTERCEPTS:
#Only first group constrained to 0

V2B.8_1 ~ nu.1*1 + 0*1
V2B.8_2 ~ nu.2*1 + 0*1
V2B.8_3 ~ nu.3*1 + 0*1
V2B.8_4 ~ nu.4*1 + 0*1
V2B.8_5 ~ nu.5*1 + 0*1
V2B.8_6 ~ nu.6*1 + 0*1
V2B.8_7 ~ nu.7*1 + 0*1
V2B.8_8 ~ nu.8*1 + 0*1
V2B.8_9 ~ nu.9*1 + 0*1
bv2b8_1 ~ nu.10*1 + NA*1
bv2b8_2 ~ nu.11*1 + NA*1
bv2b8_3 ~ nu.12*1 + NA*1
bv2b8_4 ~ nu.13*1 + NA*1
bv2b8_5 ~ nu.14*1 + NA*1
bv2b8_6 ~ nu.15*1 + NA*1
bv2b8_7 ~ nu.16*1 + NA*1
bv2b8_8 ~ nu.17*1 + NA*1
bv2b8_9 ~ nu.18*1 + NA*1
cv2b8_1 ~ nu.19*1 + NA*1
cv2b8_2 ~ nu.20*1 + NA*1
cv2b8_3 ~ nu.21*1 + NA*1
cv2b8_4 ~ nu.22*1 + NA*1
cv2b8_5 ~ nu.23*1 + NA*1
cv2b8_6 ~ nu.24*1 + NA*1
cv2b8_7 ~ nu.25*1 + NA*1
cv2b8_8 ~ nu.26*1 + NA*1
cv2b8_9 ~ nu.27*1 + NA*1

## SCALING FACTORS:
#Only first group constrained to 1

V2B.8_1 ~*~ 1*V2B.8_1
V2B.8_2 ~*~ 1*V2B.8_2
V2B.8_3 ~*~ 1*V2B.8_3
V2B.8_4 ~*~ 1*V2B.8_4
V2B.8_5 ~*~ 1*V2B.8_5
V2B.8_6 ~*~ 1*V2B.8_6
V2B.8_7 ~*~ 1*V2B.8_7
V2B.8_8 ~*~ 1*V2B.8_8
V2B.8_9 ~*~ 1*V2B.8_9
bv2b8_1 ~*~ NA*bv2b8_1
bv2b8_2 ~*~ NA*bv2b8_2
bv2b8_3 ~*~ NA*bv2b8_3
bv2b8_4 ~*~ NA*bv2b8_4
bv2b8_5 ~*~ NA*bv2b8_5
bv2b8_6 ~*~ NA*bv2b8_6
bv2b8_7 ~*~ NA*bv2b8_7
bv2b8_8 ~*~ NA*bv2b8_8
bv2b8_9 ~*~ NA*bv2b8_9
cv2b8_1 ~*~ NA*cv2b8_1
cv2b8_2 ~*~ NA*cv2b8_2
cv2b8_3 ~*~ NA*cv2b8_3
cv2b8_4 ~*~ NA*cv2b8_4
cv2b8_5 ~*~ NA*cv2b8_5
cv2b8_6 ~*~ NA*cv2b8_6
cv2b8_7 ~*~ NA*cv2b8_7
cv2b8_8 ~*~ NA*cv2b8_8
cv2b8_9 ~*~ NA*cv2b8_9


## UNIQUE-FACTOR COVARIANCES:

V2B.8_1 ~~ NA*bv2b8_1 + theta.10_1*bv2b8_1
V2B.8_1 ~~ NA*cv2b8_1 + theta.19_1*cv2b8_1
V2B.8_2 ~~ NA*bv2b8_2 + theta.11_2*bv2b8_2
V2B.8_2 ~~ NA*cv2b8_2 + theta.20_2*cv2b8_2
V2B.8_3 ~~ NA*bv2b8_3 + theta.12_3*bv2b8_3
V2B.8_3 ~~ NA*cv2b8_3 + theta.21_3*cv2b8_3
V2B.8_4 ~~ NA*bv2b8_4 + theta.13_4*bv2b8_4
V2B.8_4 ~~ NA*cv2b8_4 + theta.22_4*cv2b8_4
V2B.8_5 ~~ NA*bv2b8_5 + theta.14_5*bv2b8_5
V2B.8_5 ~~ NA*cv2b8_5 + theta.23_5*cv2b8_5
V2B.8_6 ~~ NA*bv2b8_6 + theta.15_6*bv2b8_6
V2B.8_6 ~~ NA*cv2b8_6 + theta.24_6*cv2b8_6
V2B.8_7 ~~ NA*bv2b8_7 + theta.16_7*bv2b8_7
V2B.8_7 ~~ NA*cv2b8_7 + theta.25_7*cv2b8_7
V2B.8_8 ~~ NA*bv2b8_8 + theta.17_8*bv2b8_8
V2B.8_8 ~~ NA*cv2b8_8 + theta.26_8*cv2b8_8
V2B.8_9 ~~ NA*bv2b8_9 + theta.18_9*bv2b8_9
V2B.8_9 ~~ NA*cv2b8_9 + theta.27_9*cv2b8_9
bv2b8_1 ~~ NA*cv2b8_1 + theta.19_10*cv2b8_1
bv2b8_2 ~~ NA*cv2b8_2 + theta.20_11*cv2b8_2
bv2b8_3 ~~ NA*cv2b8_3 + theta.21_12*cv2b8_3
bv2b8_4 ~~ NA*cv2b8_4 + theta.22_13*cv2b8_4
bv2b8_5 ~~ NA*cv2b8_5 + theta.23_14*cv2b8_5
bv2b8_6 ~~ NA*cv2b8_6 + theta.24_15*cv2b8_6
bv2b8_7 ~~ NA*cv2b8_7 + theta.25_16*cv2b8_7
bv2b8_8 ~~ NA*cv2b8_8 + theta.26_17*cv2b8_8
bv2b8_9 ~~ NA*cv2b8_9 + theta.27_18*cv2b8_9

## LATENT MEANS/INTERCEPTS:

peers1 ~ alpha.1*1 + 0*1
peers2 ~ alpha.2*1 + 0*1
peers3 ~ alpha.3*1 + 0*1

## COMMON-FACTOR VARIANCES:
# All common factor variances set to 1

peers1 ~~ 1*peers1 + psi.1_1*peers1
peers2 ~~ 1*peers2 + psi.2_2*peers2
peers3 ~~ 1*peers3 + psi.3_3*peers3

## COMMON-FACTOR COVARIANCES:

peers1 ~~ NA*peers2 + psi.2_1*peers2
peers1 ~~ NA*peers3 + psi.3_1*peers3
peers2 ~~ NA*peers3 + psi.3_2*peers3

## LOCALIZED ACQUIESCENCE

cv2b8_6 ~~ aq1*cv2b8_7
V2B.8_6 ~~ aq2*V2B.8_7 
bv2b8_3 ~~ aq3*bv2b8_4 
V2B.8_3 ~~ aq4*V2B.8_4 
cv2b8_5 ~~ aq5*cv2b8_6 
bv2b8_6 ~~ aq6*bv2b8_7 
bv2b8_5 ~~ aq7*bv2b8_6 
'


threshpeers_fit <- cfa(threshpeers_model, data = subdata, estimator = "ULSMV")
round(inspect(threshpeers_fit, 'fit.measures')[c("npar", "chisq.scaled", "df.scaled", "pvalue.scaled", 
                                                  "cfi.scaled", "tli.scaled", "crmr")], 3)

lavTestLRT(threshpeers_fit, configpeers_fit7)

# 1.3. Metric -------------------------------------------------------------

metricpeers_model <- '
## LOADINGS:
# All factor loadings equal across waves

peers1 =~ NA*V2B.8_1 + lambda.1_1*V2B.8_1; peers2 =~ NA*bv2b8_1 + lambda.1_1*bv2b8_1; peers3 =~ NA*cv2b8_1 + lambda.1_1*cv2b8_1 
peers1 =~ NA*V2B.8_2 + lambda.2_1*V2B.8_2; peers2 =~ NA*bv2b8_2 + lambda.2_1*bv2b8_2; peers3 =~ NA*cv2b8_2 + lambda.2_1*cv2b8_2 
peers1 =~ NA*V2B.8_3 + lambda.3_1*V2B.8_3; peers2 =~ NA*bv2b8_3 + lambda.3_1*bv2b8_3; peers3 =~ NA*cv2b8_3 + lambda.3_1*cv2b8_3 
peers1 =~ NA*V2B.8_4 + lambda.4_1*V2B.8_4; peers2 =~ NA*bv2b8_4 + lambda.4_1*bv2b8_4; peers3 =~ NA*cv2b8_4 + lambda.4_1*cv2b8_4 
peers1 =~ NA*V2B.8_5 + lambda.5_1*V2B.8_5; peers2 =~ NA*bv2b8_5 + lambda.5_1*bv2b8_5; peers3 =~ NA*cv2b8_5 + lambda.5_1*cv2b8_5 
peers1 =~ NA*V2B.8_6 + lambda.6_1*V2B.8_6; peers2 =~ NA*bv2b8_6 + lambda.6_1*bv2b8_6; peers3 =~ NA*cv2b8_6 + lambda.6_1*cv2b8_6 
peers1 =~ NA*V2B.8_7 + lambda.7_1*V2B.8_7; peers2 =~ NA*bv2b8_7 + lambda.7_1*bv2b8_7; peers3 =~ NA*cv2b8_7 + lambda.7_1*cv2b8_7 
peers1 =~ NA*V2B.8_8 + lambda.8_1*V2B.8_8; peers2 =~ NA*bv2b8_8 + lambda.8_1*bv2b8_8; peers3 =~ NA*cv2b8_8 + lambda.8_1*cv2b8_8 
peers1 =~ NA*V2B.8_9 + lambda.9_1*V2B.8_9; peers2 =~ NA*bv2b8_9 + lambda.9_1*bv2b8_9; peers3 =~ NA*cv2b8_9 + lambda.9_1*cv2b8_9 


## THRESHOLDS:

V2B.8_1 | NA*t1 + V2B.8_1.thr1*t1; V2B.8_1 | NA*t2 + V2B.8_1.thr2*t2; V2B.8_1 | NA*t3 + V2B.8_1.thr3*t3; V2B.8_1 | NA*t4 + V2B.8_1.thr4*t4
V2B.8_2 | NA*t1 + V2B.8_2.thr1*t1; V2B.8_2 | NA*t2 + V2B.8_2.thr2*t2; V2B.8_2 | NA*t3 + V2B.8_2.thr3*t3; V2B.8_2 | NA*t4 + V2B.8_2.thr4*t4
V2B.8_3 | NA*t1 + V2B.8_3.thr1*t1; V2B.8_3 | NA*t2 + V2B.8_3.thr2*t2; V2B.8_3 | NA*t3 + V2B.8_3.thr3*t3; V2B.8_3 | NA*t4 + V2B.8_3.thr4*t4
V2B.8_4 | NA*t1 + V2B.8_4.thr1*t1; V2B.8_4 | NA*t2 + V2B.8_4.thr2*t2; V2B.8_4 | NA*t3 + V2B.8_4.thr3*t3; V2B.8_4 | NA*t4 + V2B.8_4.thr4*t4
V2B.8_5 | NA*t1 + V2B.8_5.thr1*t1; V2B.8_5 | NA*t2 + V2B.8_5.thr2*t2; V2B.8_5 | NA*t3 + V2B.8_5.thr3*t3; V2B.8_5 | NA*t4 + V2B.8_5.thr4*t4
V2B.8_6 | NA*t1 + V2B.8_6.thr1*t1; V2B.8_6 | NA*t2 + V2B.8_6.thr2*t2; V2B.8_6 | NA*t3 + V2B.8_6.thr3*t3; V2B.8_6 | NA*t4 + V2B.8_6.thr4*t4
V2B.8_7 | NA*t1 + V2B.8_7.thr1*t1; V2B.8_7 | NA*t2 + V2B.8_7.thr2*t2; V2B.8_7 | NA*t3 + V2B.8_7.thr3*t3; V2B.8_7 | NA*t4 + V2B.8_7.thr4*t4
V2B.8_8 | NA*t1 + V2B.8_8.thr1*t1; V2B.8_8 | NA*t2 + V2B.8_8.thr2*t2; V2B.8_8 | NA*t3 + V2B.8_8.thr3*t3; V2B.8_8 | NA*t4 + V2B.8_8.thr4*t4
V2B.8_9 | NA*t1 + V2B.8_9.thr1*t1; V2B.8_9 | NA*t2 + V2B.8_9.thr2*t2; V2B.8_9 | NA*t3 + V2B.8_9.thr3*t3; V2B.8_9 | NA*t4 + V2B.8_9.thr4*t4
bv2b8_1 | NA*t1 + V2B.8_1.thr1*t1; bv2b8_1 | NA*t2 + V2B.8_1.thr2*t2; bv2b8_1 | NA*t3 + V2B.8_1.thr3*t3; bv2b8_1 | NA*t4 + V2B.8_1.thr4*t4
bv2b8_2 | NA*t1 + V2B.8_2.thr1*t1; bv2b8_2 | NA*t2 + V2B.8_2.thr2*t2; bv2b8_2 | NA*t3 + V2B.8_2.thr3*t3; bv2b8_2 | NA*t4 + V2B.8_2.thr4*t4
bv2b8_3 | NA*t1 + V2B.8_3.thr1*t1; bv2b8_3 | NA*t2 + V2B.8_3.thr2*t2; bv2b8_3 | NA*t3 + V2B.8_3.thr3*t3; bv2b8_3 | NA*t4 + V2B.8_3.thr4*t4
bv2b8_4 | NA*t1 + V2B.8_4.thr1*t1; bv2b8_4 | NA*t2 + V2B.8_4.thr2*t2; bv2b8_4 | NA*t3 + V2B.8_4.thr3*t3; bv2b8_4 | NA*t4 + V2B.8_4.thr4*t4
bv2b8_5 | NA*t1 + V2B.8_5.thr1*t1; bv2b8_5 | NA*t2 + V2B.8_5.thr2*t2; bv2b8_5 | NA*t3 + V2B.8_5.thr3*t3; bv2b8_5 | NA*t4 + V2B.8_5.thr4*t4
bv2b8_6 | NA*t1 + V2B.8_6.thr1*t1; bv2b8_6 | NA*t2 + V2B.8_6.thr2*t2; bv2b8_6 | NA*t3 + V2B.8_6.thr3*t3; bv2b8_6 | NA*t4 + V2B.8_6.thr4*t4
bv2b8_7 | NA*t1 + V2B.8_7.thr1*t1; bv2b8_7 | NA*t2 + V2B.8_7.thr2*t2; bv2b8_7 | NA*t3 + V2B.8_7.thr3*t3; bv2b8_7 | NA*t4 + V2B.8_7.thr4*t4
bv2b8_8 | NA*t1 + V2B.8_8.thr1*t1; bv2b8_8 | NA*t2 + V2B.8_8.thr2*t2; bv2b8_8 | NA*t3 + V2B.8_8.thr3*t3; bv2b8_8 | NA*t4 + V2B.8_8.thr4*t4
bv2b8_9 | NA*t1 + V2B.8_9.thr1*t1; bv2b8_9 | NA*t2 + V2B.8_9.thr2*t2; bv2b8_9 | NA*t3 + V2B.8_9.thr3*t3; bv2b8_9 | NA*t4 + V2B.8_9.thr4*t4
cv2b8_1 | NA*t1 + V2B.8_1.thr1*t1; cv2b8_1 | NA*t2 + V2B.8_1.thr2*t2; cv2b8_1 | NA*t3 + V2B.8_1.thr3*t3; cv2b8_1 | NA*t4 + V2B.8_1.thr4*t4
cv2b8_2 | NA*t1 + V2B.8_2.thr1*t1; cv2b8_2 | NA*t2 + V2B.8_2.thr2*t2; cv2b8_2 | NA*t3 + V2B.8_2.thr3*t3; cv2b8_2 | NA*t4 + V2B.8_2.thr4*t4
cv2b8_3 | NA*t1 + V2B.8_3.thr1*t1; cv2b8_3 | NA*t2 + V2B.8_3.thr2*t2; cv2b8_3 | NA*t3 + V2B.8_3.thr3*t3; cv2b8_3 | NA*t4 + V2B.8_3.thr4*t4
cv2b8_4 | NA*t1 + V2B.8_4.thr1*t1; cv2b8_4 | NA*t2 + V2B.8_4.thr2*t2; cv2b8_4 | NA*t3 + V2B.8_4.thr3*t3; cv2b8_4 | NA*t4 + V2B.8_4.thr4*t4
cv2b8_5 | NA*t1 + V2B.8_5.thr1*t1; cv2b8_5 | NA*t2 + V2B.8_5.thr2*t2; cv2b8_5 | NA*t3 + V2B.8_5.thr3*t3; cv2b8_5 | NA*t4 + V2B.8_5.thr4*t4
cv2b8_6 | NA*t1 + V2B.8_6.thr1*t1; cv2b8_6 | NA*t2 + V2B.8_6.thr2*t2; cv2b8_6 | NA*t3 + V2B.8_6.thr3*t3; cv2b8_6 | NA*t4 + V2B.8_6.thr4*t4
cv2b8_7 | NA*t1 + V2B.8_7.thr1*t1; cv2b8_7 | NA*t2 + V2B.8_7.thr2*t2; cv2b8_7 | NA*t3 + V2B.8_7.thr3*t3; cv2b8_7 | NA*t4 + V2B.8_7.thr4*t4
cv2b8_8 | NA*t1 + V2B.8_8.thr1*t1; cv2b8_8 | NA*t2 + V2B.8_8.thr2*t2; cv2b8_8 | NA*t3 + V2B.8_8.thr3*t3; cv2b8_8 | NA*t4 + V2B.8_8.thr4*t4
cv2b8_9 | NA*t1 + V2B.8_9.thr1*t1; cv2b8_9 | NA*t2 + V2B.8_9.thr2*t2; cv2b8_9 | NA*t3 + V2B.8_9.thr3*t3; cv2b8_9 | NA*t4 + V2B.8_9.thr4*t4

## INTERCEPTS:

V2B.8_1 ~ nu.1*1 + 0*1
V2B.8_2 ~ nu.2*1 + 0*1
V2B.8_3 ~ nu.3*1 + 0*1
V2B.8_4 ~ nu.4*1 + 0*1
V2B.8_5 ~ nu.5*1 + 0*1
V2B.8_6 ~ nu.6*1 + 0*1
V2B.8_7 ~ nu.7*1 + 0*1
V2B.8_8 ~ nu.8*1 + 0*1
V2B.8_9 ~ nu.9*1 + 0*1
bv2b8_1 ~ nu.10*1 + NA*1
bv2b8_2 ~ nu.11*1 + NA*1
bv2b8_3 ~ nu.12*1 + NA*1
bv2b8_4 ~ nu.13*1 + NA*1
bv2b8_5 ~ nu.14*1 + NA*1
bv2b8_6 ~ nu.15*1 + NA*1
bv2b8_7 ~ nu.16*1 + NA*1
bv2b8_8 ~ nu.17*1 + NA*1
bv2b8_9 ~ nu.18*1 + NA*1
cv2b8_1 ~ nu.19*1 + NA*1
cv2b8_2 ~ nu.20*1 + NA*1
cv2b8_3 ~ nu.21*1 + NA*1
cv2b8_4 ~ nu.22*1 + NA*1
cv2b8_5 ~ nu.23*1 + NA*1
cv2b8_6 ~ nu.24*1 + NA*1
cv2b8_7 ~ nu.25*1 + NA*1
cv2b8_8 ~ nu.26*1 + NA*1
cv2b8_9 ~ nu.27*1 + NA*1

## SCALING FACTORS:

V2B.8_1 ~*~ 1*V2B.8_1
V2B.8_2 ~*~ 1*V2B.8_2
V2B.8_3 ~*~ 1*V2B.8_3
V2B.8_4 ~*~ 1*V2B.8_4
V2B.8_5 ~*~ 1*V2B.8_5
V2B.8_6 ~*~ 1*V2B.8_6
V2B.8_7 ~*~ 1*V2B.8_7
V2B.8_8 ~*~ 1*V2B.8_8
V2B.8_9 ~*~ 1*V2B.8_9
bv2b8_1 ~*~ NA*bv2b8_1
bv2b8_2 ~*~ NA*bv2b8_2
bv2b8_3 ~*~ NA*bv2b8_3
bv2b8_4 ~*~ NA*bv2b8_4
bv2b8_5 ~*~ NA*bv2b8_5
bv2b8_6 ~*~ NA*bv2b8_6
bv2b8_7 ~*~ NA*bv2b8_7
bv2b8_8 ~*~ NA*bv2b8_8
bv2b8_9 ~*~ NA*bv2b8_9
cv2b8_1 ~*~ NA*cv2b8_1
cv2b8_2 ~*~ NA*cv2b8_2
cv2b8_3 ~*~ NA*cv2b8_3
cv2b8_4 ~*~ NA*cv2b8_4
cv2b8_5 ~*~ NA*cv2b8_5
cv2b8_6 ~*~ NA*cv2b8_6
cv2b8_7 ~*~ NA*cv2b8_7
cv2b8_8 ~*~ NA*cv2b8_8
cv2b8_9 ~*~ NA*cv2b8_9


## UNIQUE-FACTOR COVARIANCES:

V2B.8_1 ~~ NA*bv2b8_1 + theta.10_1*bv2b8_1
V2B.8_1 ~~ NA*cv2b8_1 + theta.19_1*cv2b8_1
V2B.8_2 ~~ NA*bv2b8_2 + theta.11_2*bv2b8_2
V2B.8_2 ~~ NA*cv2b8_2 + theta.20_2*cv2b8_2
V2B.8_3 ~~ NA*bv2b8_3 + theta.12_3*bv2b8_3
V2B.8_3 ~~ NA*cv2b8_3 + theta.21_3*cv2b8_3
V2B.8_4 ~~ NA*bv2b8_4 + theta.13_4*bv2b8_4
V2B.8_4 ~~ NA*cv2b8_4 + theta.22_4*cv2b8_4
V2B.8_5 ~~ NA*bv2b8_5 + theta.14_5*bv2b8_5
V2B.8_5 ~~ NA*cv2b8_5 + theta.23_5*cv2b8_5
V2B.8_6 ~~ NA*bv2b8_6 + theta.15_6*bv2b8_6
V2B.8_6 ~~ NA*cv2b8_6 + theta.24_6*cv2b8_6
V2B.8_7 ~~ NA*bv2b8_7 + theta.16_7*bv2b8_7
V2B.8_7 ~~ NA*cv2b8_7 + theta.25_7*cv2b8_7
V2B.8_8 ~~ NA*bv2b8_8 + theta.17_8*bv2b8_8
V2B.8_8 ~~ NA*cv2b8_8 + theta.26_8*cv2b8_8
V2B.8_9 ~~ NA*bv2b8_9 + theta.18_9*bv2b8_9
V2B.8_9 ~~ NA*cv2b8_9 + theta.27_9*cv2b8_9
bv2b8_1 ~~ NA*cv2b8_1 + theta.19_10*cv2b8_1
bv2b8_2 ~~ NA*cv2b8_2 + theta.20_11*cv2b8_2
bv2b8_3 ~~ NA*cv2b8_3 + theta.21_12*cv2b8_3
bv2b8_4 ~~ NA*cv2b8_4 + theta.22_13*cv2b8_4
bv2b8_5 ~~ NA*cv2b8_5 + theta.23_14*cv2b8_5
bv2b8_6 ~~ NA*cv2b8_6 + theta.24_15*cv2b8_6
bv2b8_7 ~~ NA*cv2b8_7 + theta.25_16*cv2b8_7
bv2b8_8 ~~ NA*cv2b8_8 + theta.26_17*cv2b8_8
bv2b8_9 ~~ NA*cv2b8_9 + theta.27_18*cv2b8_9

## LATENT MEANS/INTERCEPTS:

peers1 ~ alpha.1*1 + 0*1
peers2 ~ alpha.2*1 + 0*1
peers3 ~ alpha.3*1 + 0*1

## COMMON-FACTOR VARIANCES:
# Only first common factor set to 1

peers1 ~~ 1*peers1 + psi.1_1*peers1
peers2 ~~ NA*peers2 + psi.2_2*peers2
peers3 ~~ NA*peers3 + psi.3_3*peers3

## COMMON-FACTOR COVARIANCES:

peers1 ~~ NA*peers2 + psi.2_1*peers2
peers1 ~~ NA*peers3 + psi.3_1*peers3
peers2 ~~ NA*peers3 + psi.3_2*peers3

## LOCALIZED ACQUIESCENCE

cv2b8_6 ~~ aq1*cv2b8_7
V2B.8_6 ~~ aq2*V2B.8_7 
bv2b8_3 ~~ aq3*bv2b8_4 
V2B.8_3 ~~ aq4*V2B.8_4 
cv2b8_5 ~~ aq5*cv2b8_6 
bv2b8_6 ~~ aq6*bv2b8_7 
bv2b8_5 ~~ aq7*bv2b8_6 
'

metricpeers_fit <- cfa(metricpeers_model, data = subdata, estimator = "ULSMV")
round(inspect(metricpeers_fit, 'fit.measures')[c("npar", "chisq.scaled", "df.scaled", "pvalue.scaled", 
                                                  "cfi.scaled", "tli.scaled", "crmr")], 3)

lavTestLRT(threshpeers_fit, metricpeers_fit)

# We reject metric invariance. 
#lavaan NOTE:
#The “Chisq” column contains standard test statistics, not the
#robust test that should be reported per model. A robust difference
#test is a function of two standard (not robust) statistics.
#
#Df AIC BIC  Chisq Chisq diff Df diff Pr(>Chisq)   
#threshpeers_fit8 323         413.48                                 
#metricpeers_fit  339         457.12     39.047      16   0.001071 **


# Summary

# # npar  chisq.scaled     df.scaled pvalue.scaled    cfi.scaled    tli.scaled          crmr 
# 165.000      1086.045       294.000         0.000         0.965         0.959         0.037 
# 166.000      1040.783       293.000         0.000         0.967         0.961         0.036 # Started Specification Search
# 167.000      1008.051       292.000         0.000         0.969         0.962         0.036 
# 168.000       976.649       291.000         0.000         0.970         0.964         0.035 
# 169.000       945.812       290.000         0.000         0.971         0.965         0.034 
# 170.000       919.637       289.000         0.000         0.972         0.967         0.034 
# 171.000       896.653       288.000         0.000         0.973         0.968         0.033
# 172.000       871.400       287.000         0.000         0.974         0.969         0.033 # Finished, no more reasonable changes with MI > 10
# 136.000       674.011       323.000         0.000         0.985         0.983         0.036 # Threshold Invariant
# 120.000       632.540       339.000         0.000         0.987         0.987         0.036 # Metric Invariant



# 2. Parents --------------------------------------------------------------

 
cfaparents <- '
parents1 =~ V2B.7_1 + V2B.7_2 + V2B.7_3 + V2B.7_4 +
  V2B.7_5 + V2B.7_6 + V2B.7_7 + V2B.7_8 + V2B.7_9

parents2 =~ bv2b7_1 + bv2b7_2 + bv2b7_3 + bv2b7_4 +
bv2b7_5 + bv2b7_6 + bv2b7_7 + bv2b7_8 + bv2b7_9

parents3 =~ cv2b7_1 + cv2b7_2 + cv2b7_3 + cv2b7_4 +
cv2b7_5 + cv2b7_6 + cv2b7_7 + cv2b7_8 + cv2b7_9
'


# 2.1. Configural ---------------------------------------------------------

configparents_model <- '
parents1 =~ NA*V2B.7_1 + lambda.1_1*V2B.7_1
parents1 =~ NA*V2B.7_2 + lambda.2_1*V2B.7_2
parents1 =~ NA*V2B.7_3 + lambda.3_1*V2B.7_3
parents1 =~ NA*V2B.7_4 + lambda.4_1*V2B.7_4
parents1 =~ NA*V2B.7_5 + lambda.5_1*V2B.7_5
parents1 =~ NA*V2B.7_6 + lambda.6_1*V2B.7_6
parents1 =~ NA*V2B.7_7 + lambda.7_1*V2B.7_7
parents1 =~ NA*V2B.7_8 + lambda.8_1*V2B.7_8
parents1 =~ NA*V2B.7_9 + lambda.9_1*V2B.7_9
parents2 =~ NA*bv2b7_1 + lambda.10_2*bv2b7_1
parents2 =~ NA*bv2b7_2 + lambda.11_2*bv2b7_2
parents2 =~ NA*bv2b7_3 + lambda.12_2*bv2b7_3
parents2 =~ NA*bv2b7_4 + lambda.13_2*bv2b7_4
parents2 =~ NA*bv2b7_5 + lambda.14_2*bv2b7_5
parents2 =~ NA*bv2b7_6 + lambda.15_2*bv2b7_6
parents2 =~ NA*bv2b7_7 + lambda.16_2*bv2b7_7
parents2 =~ NA*bv2b7_8 + lambda.17_2*bv2b7_8
parents2 =~ NA*bv2b7_9 + lambda.18_2*bv2b7_9
parents3 =~ NA*cv2b7_1 + lambda.19_3*cv2b7_1
parents3 =~ NA*cv2b7_2 + lambda.20_3*cv2b7_2
parents3 =~ NA*cv2b7_3 + lambda.21_3*cv2b7_3
parents3 =~ NA*cv2b7_4 + lambda.22_3*cv2b7_4
parents3 =~ NA*cv2b7_5 + lambda.23_3*cv2b7_5
parents3 =~ NA*cv2b7_6 + lambda.24_3*cv2b7_6
parents3 =~ NA*cv2b7_7 + lambda.25_3*cv2b7_7
parents3 =~ NA*cv2b7_8 + lambda.26_3*cv2b7_8
parents3 =~ NA*cv2b7_9 + lambda.27_3*cv2b7_9

## THRESHOLDS:
# Thresholds are freely estimated for each item and for each wave.

V2B.7_1 | NA*t1 + V2B.7_1.thr1*t1; V2B.7_1 | NA*t2 + V2B.7_1.thr2*t2; V2B.7_1 | NA*t3 + V2B.7_1.thr3*t3; V2B.7_1 | NA*t4 + V2B.7_1.thr4*t4
V2B.7_2 | NA*t1 + V2B.7_2.thr1*t1; V2B.7_2 | NA*t2 + V2B.7_2.thr2*t2; V2B.7_2 | NA*t3 + V2B.7_2.thr3*t3; V2B.7_2 | NA*t4 + V2B.7_2.thr4*t4
V2B.7_3 | NA*t1 + V2B.7_3.thr1*t1; V2B.7_3 | NA*t2 + V2B.7_3.thr2*t2; V2B.7_3 | NA*t3 + V2B.7_3.thr3*t3; V2B.7_3 | NA*t4 + V2B.7_3.thr4*t4
V2B.7_4 | NA*t1 + V2B.7_4.thr1*t1; V2B.7_4 | NA*t2 + V2B.7_4.thr2*t2; V2B.7_4 | NA*t3 + V2B.7_4.thr3*t3; V2B.7_4 | NA*t4 + V2B.7_4.thr4*t4
V2B.7_5 | NA*t1 + V2B.7_5.thr1*t1; V2B.7_5 | NA*t2 + V2B.7_5.thr2*t2; V2B.7_5 | NA*t3 + V2B.7_5.thr3*t3; V2B.7_5 | NA*t4 + V2B.7_5.thr4*t4
V2B.7_6 | NA*t1 + V2B.7_6.thr1*t1; V2B.7_6 | NA*t2 + V2B.7_6.thr2*t2; V2B.7_6 | NA*t3 + V2B.7_6.thr3*t3; V2B.7_6 | NA*t4 + V2B.7_6.thr4*t4
V2B.7_7 | NA*t1 + V2B.7_7.thr1*t1; V2B.7_7 | NA*t2 + V2B.7_7.thr2*t2; V2B.7_7 | NA*t3 + V2B.7_7.thr3*t3; V2B.7_7 | NA*t4 + V2B.7_7.thr4*t4
V2B.7_8 | NA*t1 + V2B.7_8.thr1*t1; V2B.7_8 | NA*t2 + V2B.7_8.thr2*t2; V2B.7_8 | NA*t3 + V2B.7_8.thr3*t3; V2B.7_8 | NA*t4 + V2B.7_8.thr4*t4
V2B.7_9 | NA*t1 + V2B.7_9.thr1*t1; V2B.7_9 | NA*t2 + V2B.7_9.thr2*t2; V2B.7_9 | NA*t3 + V2B.7_9.thr3*t3; V2B.7_9 | NA*t4 + V2B.7_9.thr4*t4
bv2b7_1 | NA*t1 + bv2b7_1.thr1*t1; bv2b7_1 | NA*t2 + bv2b7_1.thr2*t2; bv2b7_1 | NA*t3 + bv2b7_1.thr3*t3; bv2b7_1 | NA*t4 + bv2b7_1.thr4*t4
bv2b7_2 | NA*t1 + bv2b7_2.thr1*t1; bv2b7_2 | NA*t2 + bv2b7_2.thr2*t2; bv2b7_2 | NA*t3 + bv2b7_2.thr3*t3; bv2b7_2 | NA*t4 + bv2b7_2.thr4*t4
bv2b7_3 | NA*t1 + bv2b7_3.thr1*t1; bv2b7_3 | NA*t2 + bv2b7_3.thr2*t2; bv2b7_3 | NA*t3 + bv2b7_3.thr3*t3; bv2b7_3 | NA*t4 + bv2b7_3.thr4*t4
bv2b7_4 | NA*t1 + bv2b7_4.thr1*t1; bv2b7_4 | NA*t2 + bv2b7_4.thr2*t2; bv2b7_4 | NA*t3 + bv2b7_4.thr3*t3; bv2b7_4 | NA*t4 + bv2b7_4.thr4*t4
bv2b7_5 | NA*t1 + bv2b7_5.thr1*t1; bv2b7_5 | NA*t2 + bv2b7_5.thr2*t2; bv2b7_5 | NA*t3 + bv2b7_5.thr3*t3; bv2b7_5 | NA*t4 + bv2b7_5.thr4*t4
bv2b7_6 | NA*t1 + bv2b7_6.thr1*t1; bv2b7_6 | NA*t2 + bv2b7_6.thr2*t2; bv2b7_6 | NA*t3 + bv2b7_6.thr3*t3; bv2b7_6 | NA*t4 + bv2b7_6.thr4*t4
bv2b7_7 | NA*t1 + bv2b7_7.thr1*t1; bv2b7_7 | NA*t2 + bv2b7_7.thr2*t2; bv2b7_7 | NA*t3 + bv2b7_7.thr3*t3; bv2b7_7 | NA*t4 + bv2b7_7.thr4*t4
bv2b7_8 | NA*t1 + bv2b7_8.thr1*t1; bv2b7_8 | NA*t2 + bv2b7_8.thr2*t2; bv2b7_8 | NA*t3 + bv2b7_8.thr3*t3; bv2b7_8 | NA*t4 + bv2b7_8.thr4*t4
bv2b7_9 | NA*t1 + bv2b7_9.thr1*t1; bv2b7_9 | NA*t2 + bv2b7_9.thr2*t2; bv2b7_9 | NA*t3 + bv2b7_9.thr3*t3; bv2b7_9 | NA*t4 + bv2b7_9.thr4*t4
cv2b7_1 | NA*t1 + cv2b7_1.thr1*t1; cv2b7_1 | NA*t2 + cv2b7_1.thr2*t2; cv2b7_1 | NA*t3 + cv2b7_1.thr3*t3; cv2b7_1 | NA*t4 + cv2b7_1.thr4*t4
cv2b7_2 | NA*t1 + cv2b7_2.thr1*t1; cv2b7_2 | NA*t2 + cv2b7_2.thr2*t2; cv2b7_2 | NA*t3 + cv2b7_2.thr3*t3; cv2b7_2 | NA*t4 + cv2b7_2.thr4*t4
cv2b7_3 | NA*t1 + cv2b7_3.thr1*t1; cv2b7_3 | NA*t2 + cv2b7_3.thr2*t2; cv2b7_3 | NA*t3 + cv2b7_3.thr3*t3; cv2b7_3 | NA*t4 + cv2b7_3.thr4*t4
cv2b7_4 | NA*t1 + cv2b7_4.thr1*t1; cv2b7_4 | NA*t2 + cv2b7_4.thr2*t2; cv2b7_4 | NA*t3 + cv2b7_4.thr3*t3; cv2b7_4 | NA*t4 + cv2b7_4.thr4*t4
cv2b7_5 | NA*t1 + cv2b7_5.thr1*t1; cv2b7_5 | NA*t2 + cv2b7_5.thr2*t2; cv2b7_5 | NA*t3 + cv2b7_5.thr3*t3; cv2b7_5 | NA*t4 + cv2b7_5.thr4*t4
cv2b7_6 | NA*t1 + cv2b7_6.thr1*t1; cv2b7_6 | NA*t2 + cv2b7_6.thr2*t2; cv2b7_6 | NA*t3 + cv2b7_6.thr3*t3; cv2b7_6 | NA*t4 + cv2b7_6.thr4*t4
cv2b7_7 | NA*t1 + cv2b7_7.thr1*t1; cv2b7_7 | NA*t2 + cv2b7_7.thr2*t2; cv2b7_7 | NA*t3 + cv2b7_7.thr3*t3; cv2b7_7 | NA*t4 + cv2b7_7.thr4*t4
cv2b7_8 | NA*t1 + cv2b7_8.thr1*t1; cv2b7_8 | NA*t2 + cv2b7_8.thr2*t2; cv2b7_8 | NA*t3 + cv2b7_8.thr3*t3; cv2b7_8 | NA*t4 + cv2b7_8.thr4*t4
cv2b7_9 | NA*t1 + cv2b7_9.thr1*t1; cv2b7_9 | NA*t2 + cv2b7_9.thr2*t2; cv2b7_9 | NA*t3 + cv2b7_9.thr3*t3; cv2b7_9 | NA*t4 + cv2b7_9.thr4*t4

## INTERCEPTS:
# All 27 intercepts are constrained to 0.

V2B.7_1 ~ nu.1*1 + 0*1
V2B.7_2 ~ nu.2*1 + 0*1
V2B.7_3 ~ nu.3*1 + 0*1
V2B.7_4 ~ nu.4*1 + 0*1
V2B.7_5 ~ nu.5*1 + 0*1
V2B.7_6 ~ nu.6*1 + 0*1
V2B.7_7 ~ nu.7*1 + 0*1
V2B.7_8 ~ nu.8*1 + 0*1
V2B.7_9 ~ nu.9*1 + 0*1
bv2b7_1 ~ nu.10*1 + 0*1
bv2b7_2 ~ nu.11*1 + 0*1
bv2b7_3 ~ nu.12*1 + 0*1
bv2b7_4 ~ nu.13*1 + 0*1
bv2b7_5 ~ nu.14*1 + 0*1
bv2b7_6 ~ nu.15*1 + 0*1
bv2b7_7 ~ nu.16*1 + 0*1
bv2b7_8 ~ nu.17*1 + 0*1
bv2b7_9 ~ nu.18*1 + 0*1
cv2b7_1 ~ nu.19*1 + 0*1
cv2b7_2 ~ nu.20*1 + 0*1
cv2b7_3 ~ nu.21*1 + 0*1
cv2b7_4 ~ nu.22*1 + 0*1
cv2b7_5 ~ nu.23*1 + 0*1
cv2b7_6 ~ nu.24*1 + 0*1
cv2b7_7 ~ nu.25*1 + 0*1
cv2b7_8 ~ nu.26*1 + 0*1
cv2b7_9 ~ nu.27*1 + 0*1

## SCALING FACTORS:
#As this is the Delta parametrization, there are no constraints
#on the unique-factor variances, but instead all latent response variable
#variances are set to 1

V2B.7_1 ~*~ 1*V2B.7_1
V2B.7_2 ~*~ 1*V2B.7_2
V2B.7_3 ~*~ 1*V2B.7_3
V2B.7_4 ~*~ 1*V2B.7_4
V2B.7_5 ~*~ 1*V2B.7_5
V2B.7_6 ~*~ 1*V2B.7_6
V2B.7_7 ~*~ 1*V2B.7_7
V2B.7_8 ~*~ 1*V2B.7_8
V2B.7_9 ~*~ 1*V2B.7_9
bv2b7_1 ~*~ 1*bv2b7_1
bv2b7_2 ~*~ 1*bv2b7_2
bv2b7_3 ~*~ 1*bv2b7_3
bv2b7_4 ~*~ 1*bv2b7_4
bv2b7_5 ~*~ 1*bv2b7_5
bv2b7_6 ~*~ 1*bv2b7_6
bv2b7_7 ~*~ 1*bv2b7_7
bv2b7_8 ~*~ 1*bv2b7_8
bv2b7_9 ~*~ 1*bv2b7_9
cv2b7_1 ~*~ 1*cv2b7_1
cv2b7_2 ~*~ 1*cv2b7_2
cv2b7_3 ~*~ 1*cv2b7_3
cv2b7_4 ~*~ 1*cv2b7_4
cv2b7_5 ~*~ 1*cv2b7_5
cv2b7_6 ~*~ 1*cv2b7_6
cv2b7_7 ~*~ 1*cv2b7_7
cv2b7_8 ~*~ 1*cv2b7_8
cv2b7_9 ~*~ 1*cv2b7_9



## UNIQUE-FACTOR COVARIANCES:
# Same item across wave is auto-correlated. 

V2B.7_1 ~~ NA*bv2b7_1 + theta.10_1*bv2b7_1; V2B.7_1 ~~ NA*cv2b7_1 + theta.19_1*cv2b7_1
V2B.7_2 ~~ NA*bv2b7_2 + theta.11_2*bv2b7_2; V2B.7_2 ~~ NA*cv2b7_2 + theta.20_2*cv2b7_2
V2B.7_3 ~~ NA*bv2b7_3 + theta.12_3*bv2b7_3; V2B.7_3 ~~ NA*cv2b7_3 + theta.21_3*cv2b7_3
V2B.7_4 ~~ NA*bv2b7_4 + theta.13_4*bv2b7_4; V2B.7_4 ~~ NA*cv2b7_4 + theta.22_4*cv2b7_4
V2B.7_5 ~~ NA*bv2b7_5 + theta.14_5*bv2b7_5; V2B.7_5 ~~ NA*cv2b7_5 + theta.23_5*cv2b7_5
V2B.7_6 ~~ NA*bv2b7_6 + theta.15_6*bv2b7_6; V2B.7_6 ~~ NA*cv2b7_6 + theta.24_6*cv2b7_6
V2B.7_7 ~~ NA*bv2b7_7 + theta.16_7*bv2b7_7; V2B.7_7 ~~ NA*cv2b7_7 + theta.25_7*cv2b7_7
V2B.7_8 ~~ NA*bv2b7_8 + theta.17_8*bv2b7_8; V2B.7_8 ~~ NA*cv2b7_8 + theta.26_8*cv2b7_8
V2B.7_9 ~~ NA*bv2b7_9 + theta.18_9*bv2b7_9; V2B.7_9 ~~ NA*cv2b7_9 + theta.27_9*cv2b7_9
bv2b7_1 ~~ NA*cv2b7_1 + theta.19_10*cv2b7_1
bv2b7_2 ~~ NA*cv2b7_2 + theta.20_11*cv2b7_2
bv2b7_3 ~~ NA*cv2b7_3 + theta.21_12*cv2b7_3
bv2b7_4 ~~ NA*cv2b7_4 + theta.22_13*cv2b7_4
bv2b7_5 ~~ NA*cv2b7_5 + theta.23_14*cv2b7_5
bv2b7_6 ~~ NA*cv2b7_6 + theta.24_15*cv2b7_6
bv2b7_7 ~~ NA*cv2b7_7 + theta.25_16*cv2b7_7
bv2b7_8 ~~ NA*cv2b7_8 + theta.26_17*cv2b7_8
bv2b7_9 ~~ NA*cv2b7_9 + theta.27_18*cv2b7_9 

## LATENT MEANS/INTERCEPTS:
# Latent means set to 0.

parents1 ~ alpha.1*1 + 0*1
parents2 ~ alpha.2*1 + 0*1
parents3 ~ alpha.3*1 + 0*1

## COMMON-FACTOR VARIANCES:
# Common factor variances set to 1

parents1 ~~ 1*parents1 + psi.1_1*parents1
parents2 ~~ 1*parents2 + psi.2_2*parents2
parents3 ~~ 1*parents3 + psi.3_3*parents3

## COMMON-FACTOR COVARIANCES:
# Autocorrelated factors across time

parents1 ~~ NA*parents2 + psi.2_1*parents2
parents1 ~~ NA*parents3 + psi.3_1*parents3
parents2 ~~ NA*parents3 + psi.3_2*parents3
'

set.seed(0731203)
configparents_fit <- cfa(configparents_model, data = subdata, estimator = 'ULSMV')
summary(configparents_fit)
round(inspect(configparents_fit, 'fit.measures')[c("npar", "chisq.scaled", "df.scaled", "pvalue.scaled", 
                                                         "cfi.scaled", "tli.scaled", "crmr")], 3)

#
# 2.1.1. Specification Search ---------------------------------------------

modificationindices(configparents_fit, sort = TRUE, minimum.value = 10)

#        lhs op     rhs     mi    epc sepc.lv sepc.all sepc.nox
#487 bv2b7_1 ~~ bv2b7_2 29.149  0.191   0.191    0.336    0.336
#307 V2B.7_1 ~~ V2B.7_2 27.885  0.185   0.185    0.277    0.277
#595 cv2b7_1 ~~ cv2b7_2 12.473  0.125   0.125    0.229    0.229


  # 1st

configparents_model1 <- paste0(configparents_model, '\n ## LOCALIZED ACQUIESCENCE \n \nbv2b7_1 ~~ aq1*bv2b7_2 \n')
cat(configparents_model1)

configparents_fit1 <- cfa(configparents_model1, data = subdata, estimator = 'ULSMV')
round(inspect(configparents_fit1, 'fit.measures')[c("npar", "chisq.scaled", "df.scaled", "pvalue.scaled", 
                                                   "cfi.scaled", "tli.scaled", "crmr")], 3)

modificationindices(configparents_fit1, sort = TRUE, minimum.value = 10)
#         lhs op     rhs     mi    epc sepc.lv sepc.all sepc.nox
# 308 V2B.7_1 ~~ V2B.7_2 28.007  0.185   0.185    0.277    0.277
# 595 cv2b7_1 ~~ cv2b7_2 12.589  0.126   0.126    0.229    0.229
# 493 bv2b7_1 ~~ bv2b7_8 11.691  0.122   0.122    0.239    0.239


  # 2nd

configparents_model2 <- paste0(configparents_model1, 'V2B.7_1 ~~ aq2*V2B.7_2 \n')
cat(configparents_model2)

configparents_fit2 <- cfa(configparents_model2, data = subdata, estimator = 'ULSMV')
round(inspect(configparents_fit2, 'fit.measures')[c("npar", "chisq.scaled", "df.scaled", "pvalue.scaled", 
                                                    "cfi.scaled", "tli.scaled", "crmr")], 3)

modificationindices(configparents_fit2, sort = TRUE, minimum.value = 10)
#        lhs op     rhs     mi   epc sepc.lv sepc.all sepc.nox
#595 cv2b7_1 ~~ cv2b7_2 12.662 0.126   0.126    0.230    0.230
#493 bv2b7_1 ~~ bv2b7_8 11.738 0.122   0.122    0.239    0.239
#579 bv2b7_8 ~~ cv2b7_1 10.552 0.114   0.114    0.231    0.231

  # 3rd

configparents_model3 <- paste0(configparents_model2, 'cv2b7_1 ~~ aq3*cv2b7_2 \n')
cat(configparents_model3)

configparents_fit3 <- cfa(configparents_model3, data = subdata, estimator = 'ULSMV')
round(inspect(configparents_fit3, 'fit.measures')[c("npar", "chisq.scaled", "df.scaled", "pvalue.scaled", 
                                                    "cfi.scaled", "tli.scaled", "crmr")], 3)

modificationindices(configparents_fit3, sort = TRUE, minimum.value = 10)
#        lhs op     rhs     mi   epc sepc.lv sepc.all sepc.nox
#494 bv2b7_1 ~~ bv2b7_8 11.786 0.122   0.122    0.240    0.240
#603 cv2b7_2 ~~ cv2b7_3 11.726 0.124   0.124    0.284    0.284

  # 4th

configparents_model4 <- paste0(configparents_model3, 'cv2b7_2 ~~ aq4*cv2b7_3 \n')
cat(configparents_model4)

configparents_fit4 <- cfa(configparents_model4, data = subdata, estimator = 'ULSMV')
round(inspect(configparents_fit4, 'fit.measures')[c("npar", "chisq.scaled", "df.scaled", "pvalue.scaled", 
                                                    "cfi.scaled", "tli.scaled", "crmr")], 3)

modificationindices(configparents_fit4, sort = TRUE, minimum.value = 10) # No more subsequent covariances with MI > 10

# 2.2. Threshold ----------------------------------------------------------

threshparents_model <- '
## LOADINGS
#Freely estimated

parents1 =~ NA*V2B.7_1 + lambda.1_1*V2B.7_1
parents1 =~ NA*V2B.7_2 + lambda.2_1*V2B.7_2
parents1 =~ NA*V2B.7_3 + lambda.3_1*V2B.7_3
parents1 =~ NA*V2B.7_4 + lambda.4_1*V2B.7_4
parents1 =~ NA*V2B.7_5 + lambda.5_1*V2B.7_5
parents1 =~ NA*V2B.7_6 + lambda.6_1*V2B.7_6
parents1 =~ NA*V2B.7_7 + lambda.7_1*V2B.7_7
parents1 =~ NA*V2B.7_8 + lambda.8_1*V2B.7_8
parents1 =~ NA*V2B.7_9 + lambda.9_1*V2B.7_9
parents2 =~ NA*bv2b7_1 + lambda.10_2*bv2b7_1
parents2 =~ NA*bv2b7_2 + lambda.11_2*bv2b7_2
parents2 =~ NA*bv2b7_3 + lambda.12_2*bv2b7_3
parents2 =~ NA*bv2b7_4 + lambda.13_2*bv2b7_4
parents2 =~ NA*bv2b7_5 + lambda.14_2*bv2b7_5
parents2 =~ NA*bv2b7_6 + lambda.15_2*bv2b7_6
parents2 =~ NA*bv2b7_7 + lambda.16_2*bv2b7_7
parents2 =~ NA*bv2b7_8 + lambda.17_2*bv2b7_8
parents2 =~ NA*bv2b7_9 + lambda.18_2*bv2b7_9
parents3 =~ NA*cv2b7_1 + lambda.19_3*cv2b7_1
parents3 =~ NA*cv2b7_2 + lambda.20_3*cv2b7_2
parents3 =~ NA*cv2b7_3 + lambda.21_3*cv2b7_3
parents3 =~ NA*cv2b7_4 + lambda.22_3*cv2b7_4
parents3 =~ NA*cv2b7_5 + lambda.23_3*cv2b7_5
parents3 =~ NA*cv2b7_6 + lambda.24_3*cv2b7_6
parents3 =~ NA*cv2b7_7 + lambda.25_3*cv2b7_7
parents3 =~ NA*cv2b7_8 + lambda.26_3*cv2b7_8
parents3 =~ NA*cv2b7_9 + lambda.27_3*cv2b7_9

## THRESHOLDS:
# Equal thresholds across waves

V2B.7_1 | NA*t1 + V2B.7_1.thr1*t1; V2B.7_1 | NA*t2 + V2B.7_1.thr2*t2; V2B.7_1 | NA*t3 + V2B.7_1.thr3*t3; V2B.7_1 | NA*t4 + V2B.7_1.thr4*t4
V2B.7_2 | NA*t1 + V2B.7_2.thr1*t1; V2B.7_2 | NA*t2 + V2B.7_2.thr2*t2; V2B.7_2 | NA*t3 + V2B.7_2.thr3*t3; V2B.7_2 | NA*t4 + V2B.7_2.thr4*t4
V2B.7_3 | NA*t1 + V2B.7_3.thr1*t1; V2B.7_3 | NA*t2 + V2B.7_3.thr2*t2; V2B.7_3 | NA*t3 + V2B.7_3.thr3*t3; V2B.7_3 | NA*t4 + V2B.7_3.thr4*t4
V2B.7_4 | NA*t1 + V2B.7_4.thr1*t1; V2B.7_4 | NA*t2 + V2B.7_4.thr2*t2; V2B.7_4 | NA*t3 + V2B.7_4.thr3*t3; V2B.7_4 | NA*t4 + V2B.7_4.thr4*t4
V2B.7_5 | NA*t1 + V2B.7_5.thr1*t1; V2B.7_5 | NA*t2 + V2B.7_5.thr2*t2; V2B.7_5 | NA*t3 + V2B.7_5.thr3*t3; V2B.7_5 | NA*t4 + V2B.7_5.thr4*t4
V2B.7_6 | NA*t1 + V2B.7_6.thr1*t1; V2B.7_6 | NA*t2 + V2B.7_6.thr2*t2; V2B.7_6 | NA*t3 + V2B.7_6.thr3*t3; V2B.7_6 | NA*t4 + V2B.7_6.thr4*t4
V2B.7_7 | NA*t1 + V2B.7_7.thr1*t1; V2B.7_7 | NA*t2 + V2B.7_7.thr2*t2; V2B.7_7 | NA*t3 + V2B.7_7.thr3*t3; V2B.7_7 | NA*t4 + V2B.7_7.thr4*t4
V2B.7_8 | NA*t1 + V2B.7_8.thr1*t1; V2B.7_8 | NA*t2 + V2B.7_8.thr2*t2; V2B.7_8 | NA*t3 + V2B.7_8.thr3*t3; V2B.7_8 | NA*t4 + V2B.7_8.thr4*t4
V2B.7_9 | NA*t1 + V2B.7_9.thr1*t1; V2B.7_9 | NA*t2 + V2B.7_9.thr2*t2; V2B.7_9 | NA*t3 + V2B.7_9.thr3*t3; V2B.7_9 | NA*t4 + V2B.7_9.thr4*t4
bv2b7_1 | NA*t1 + V2B.7_1.thr1*t1; bv2b7_1 | NA*t2 + V2B.7_1.thr2*t2; bv2b7_1 | NA*t3 + V2B.7_1.thr3*t3; bv2b7_1 | NA*t4 + V2B.7_1.thr4*t4
bv2b7_2 | NA*t1 + V2B.7_2.thr1*t1; bv2b7_2 | NA*t2 + V2B.7_2.thr2*t2; bv2b7_2 | NA*t3 + V2B.7_2.thr3*t3; bv2b7_2 | NA*t4 + V2B.7_2.thr4*t4
bv2b7_3 | NA*t1 + V2B.7_3.thr1*t1; bv2b7_3 | NA*t2 + V2B.7_3.thr2*t2; bv2b7_3 | NA*t3 + V2B.7_3.thr3*t3; bv2b7_3 | NA*t4 + V2B.7_3.thr4*t4
bv2b7_4 | NA*t1 + V2B.7_4.thr1*t1; bv2b7_4 | NA*t2 + V2B.7_4.thr2*t2; bv2b7_4 | NA*t3 + V2B.7_4.thr3*t3; bv2b7_4 | NA*t4 + V2B.7_4.thr4*t4
bv2b7_5 | NA*t1 + V2B.7_5.thr1*t1; bv2b7_5 | NA*t2 + V2B.7_5.thr2*t2; bv2b7_5 | NA*t3 + V2B.7_5.thr3*t3; bv2b7_5 | NA*t4 + V2B.7_5.thr4*t4
bv2b7_6 | NA*t1 + V2B.7_6.thr1*t1; bv2b7_6 | NA*t2 + V2B.7_6.thr2*t2; bv2b7_6 | NA*t3 + V2B.7_6.thr3*t3; bv2b7_6 | NA*t4 + V2B.7_6.thr4*t4
bv2b7_7 | NA*t1 + V2B.7_7.thr1*t1; bv2b7_7 | NA*t2 + V2B.7_7.thr2*t2; bv2b7_7 | NA*t3 + V2B.7_7.thr3*t3; bv2b7_7 | NA*t4 + V2B.7_7.thr4*t4
bv2b7_8 | NA*t1 + V2B.7_8.thr1*t1; bv2b7_8 | NA*t2 + V2B.7_8.thr2*t2; bv2b7_8 | NA*t3 + V2B.7_8.thr3*t3; bv2b7_8 | NA*t4 + V2B.7_8.thr4*t4
bv2b7_9 | NA*t1 + V2B.7_9.thr1*t1; bv2b7_9 | NA*t2 + V2B.7_9.thr2*t2; bv2b7_9 | NA*t3 + V2B.7_9.thr3*t3; bv2b7_9 | NA*t4 + V2B.7_9.thr4*t4
cv2b7_1 | NA*t1 + V2B.7_1.thr1*t1; cv2b7_1 | NA*t2 + V2B.7_1.thr2*t2; cv2b7_1 | NA*t3 + V2B.7_1.thr3*t3; cv2b7_1 | NA*t4 + V2B.7_1.thr4*t4
cv2b7_2 | NA*t1 + V2B.7_2.thr1*t1; cv2b7_2 | NA*t2 + V2B.7_2.thr2*t2; cv2b7_2 | NA*t3 + V2B.7_2.thr3*t3; cv2b7_2 | NA*t4 + V2B.7_2.thr4*t4
cv2b7_3 | NA*t1 + V2B.7_3.thr1*t1; cv2b7_3 | NA*t2 + V2B.7_3.thr2*t2; cv2b7_3 | NA*t3 + V2B.7_3.thr3*t3; cv2b7_3 | NA*t4 + V2B.7_3.thr4*t4
cv2b7_4 | NA*t1 + V2B.7_4.thr1*t1; cv2b7_4 | NA*t2 + V2B.7_4.thr2*t2; cv2b7_4 | NA*t3 + V2B.7_4.thr3*t3; cv2b7_4 | NA*t4 + V2B.7_4.thr4*t4
cv2b7_5 | NA*t1 + V2B.7_5.thr1*t1; cv2b7_5 | NA*t2 + V2B.7_5.thr2*t2; cv2b7_5 | NA*t3 + V2B.7_5.thr3*t3; cv2b7_5 | NA*t4 + V2B.7_5.thr4*t4
cv2b7_6 | NA*t1 + V2B.7_6.thr1*t1; cv2b7_6 | NA*t2 + V2B.7_6.thr2*t2; cv2b7_6 | NA*t3 + V2B.7_6.thr3*t3; cv2b7_6 | NA*t4 + V2B.7_6.thr4*t4
cv2b7_7 | NA*t1 + V2B.7_7.thr1*t1; cv2b7_7 | NA*t2 + V2B.7_7.thr2*t2; cv2b7_7 | NA*t3 + V2B.7_7.thr3*t3; cv2b7_7 | NA*t4 + V2B.7_7.thr4*t4
cv2b7_8 | NA*t1 + V2B.7_8.thr1*t1; cv2b7_8 | NA*t2 + V2B.7_8.thr2*t2; cv2b7_8 | NA*t3 + V2B.7_8.thr3*t3; cv2b7_8 | NA*t4 + V2B.7_8.thr4*t4
cv2b7_9 | NA*t1 + V2B.7_9.thr1*t1; cv2b7_9 | NA*t2 + V2B.7_9.thr2*t2; cv2b7_9 | NA*t3 + V2B.7_9.thr3*t3; cv2b7_9 | NA*t4 + V2B.7_9.thr4*t4


## INTERCEPTS:
# Only first wave is constrained to 0

V2B.7_1 ~ nu.1*1 + 0*1
V2B.7_2 ~ nu.2*1 + 0*1
V2B.7_3 ~ nu.3*1 + 0*1
V2B.7_4 ~ nu.4*1 + 0*1
V2B.7_5 ~ nu.5*1 + 0*1
V2B.7_6 ~ nu.6*1 + 0*1
V2B.7_7 ~ nu.7*1 + 0*1
V2B.7_8 ~ nu.8*1 + 0*1
V2B.7_9 ~ nu.9*1 + 0*1
bv2b7_1 ~ nu.10*1 + NA*1
bv2b7_2 ~ nu.11*1 + NA*1
bv2b7_3 ~ nu.12*1 + NA*1
bv2b7_4 ~ nu.13*1 + NA*1
bv2b7_5 ~ nu.14*1 + NA*1
bv2b7_6 ~ nu.15*1 + NA*1
bv2b7_7 ~ nu.16*1 + NA*1
bv2b7_8 ~ nu.17*1 + NA*1
bv2b7_9 ~ nu.18*1 + NA*1
cv2b7_1 ~ nu.19*1 + NA*1
cv2b7_2 ~ nu.20*1 + NA*1
cv2b7_3 ~ nu.21*1 + NA*1
cv2b7_4 ~ nu.22*1 + NA*1
cv2b7_5 ~ nu.23*1 + NA*1
cv2b7_6 ~ nu.24*1 + NA*1
cv2b7_7 ~ nu.25*1 + NA*1
cv2b7_8 ~ nu.26*1 + NA*1
cv2b7_9 ~ nu.27*1 + NA*1

## SCALING FACTORS:
# Only first wave is constrained to 1

V2B.7_1 ~*~ 1*V2B.7_1
V2B.7_2 ~*~ 1*V2B.7_2
V2B.7_3 ~*~ 1*V2B.7_3
V2B.7_4 ~*~ 1*V2B.7_4
V2B.7_5 ~*~ 1*V2B.7_5
V2B.7_6 ~*~ 1*V2B.7_6
V2B.7_7 ~*~ 1*V2B.7_7
V2B.7_8 ~*~ 1*V2B.7_8
V2B.7_9 ~*~ 1*V2B.7_9
bv2b7_1 ~*~ NA*bv2b7_1
bv2b7_2 ~*~ NA*bv2b7_2
bv2b7_3 ~*~ NA*bv2b7_3
bv2b7_4 ~*~ NA*bv2b7_4
bv2b7_5 ~*~ NA*bv2b7_5
bv2b7_6 ~*~ NA*bv2b7_6
bv2b7_7 ~*~ NA*bv2b7_7
bv2b7_8 ~*~ NA*bv2b7_8
bv2b7_9 ~*~ NA*bv2b7_9
cv2b7_1 ~*~ NA*cv2b7_1
cv2b7_2 ~*~ NA*cv2b7_2
cv2b7_3 ~*~ NA*cv2b7_3
cv2b7_4 ~*~ NA*cv2b7_4
cv2b7_5 ~*~ NA*cv2b7_5
cv2b7_6 ~*~ NA*cv2b7_6
cv2b7_7 ~*~ NA*cv2b7_7
cv2b7_8 ~*~ NA*cv2b7_8
cv2b7_9 ~*~ NA*cv2b7_9



## UNIQUE-FACTOR COVARIANCES:
# Same item across wave is auto-correlated. 

V2B.7_1 ~~ NA*bv2b7_1 + theta.10_1*bv2b7_1; V2B.7_1 ~~ NA*cv2b7_1 + theta.19_1*cv2b7_1
V2B.7_2 ~~ NA*bv2b7_2 + theta.11_2*bv2b7_2; V2B.7_2 ~~ NA*cv2b7_2 + theta.20_2*cv2b7_2
V2B.7_3 ~~ NA*bv2b7_3 + theta.12_3*bv2b7_3; V2B.7_3 ~~ NA*cv2b7_3 + theta.21_3*cv2b7_3
V2B.7_4 ~~ NA*bv2b7_4 + theta.13_4*bv2b7_4; V2B.7_4 ~~ NA*cv2b7_4 + theta.22_4*cv2b7_4
V2B.7_5 ~~ NA*bv2b7_5 + theta.14_5*bv2b7_5; V2B.7_5 ~~ NA*cv2b7_5 + theta.23_5*cv2b7_5
V2B.7_6 ~~ NA*bv2b7_6 + theta.15_6*bv2b7_6; V2B.7_6 ~~ NA*cv2b7_6 + theta.24_6*cv2b7_6
V2B.7_7 ~~ NA*bv2b7_7 + theta.16_7*bv2b7_7; V2B.7_7 ~~ NA*cv2b7_7 + theta.25_7*cv2b7_7
V2B.7_8 ~~ NA*bv2b7_8 + theta.17_8*bv2b7_8; V2B.7_8 ~~ NA*cv2b7_8 + theta.26_8*cv2b7_8
V2B.7_9 ~~ NA*bv2b7_9 + theta.18_9*bv2b7_9; V2B.7_9 ~~ NA*cv2b7_9 + theta.27_9*cv2b7_9
bv2b7_1 ~~ NA*cv2b7_1 + theta.19_10*cv2b7_1
bv2b7_2 ~~ NA*cv2b7_2 + theta.20_11*cv2b7_2
bv2b7_3 ~~ NA*cv2b7_3 + theta.21_12*cv2b7_3
bv2b7_4 ~~ NA*cv2b7_4 + theta.22_13*cv2b7_4
bv2b7_5 ~~ NA*cv2b7_5 + theta.23_14*cv2b7_5
bv2b7_6 ~~ NA*cv2b7_6 + theta.24_15*cv2b7_6
bv2b7_7 ~~ NA*cv2b7_7 + theta.25_16*cv2b7_7
bv2b7_8 ~~ NA*cv2b7_8 + theta.26_17*cv2b7_8
bv2b7_9 ~~ NA*cv2b7_9 + theta.27_18*cv2b7_9 

## LATENT MEANS/INTERCEPTS:
# Latent means set to 0.

parents1 ~ alpha.1*1 + 0*1
parents2 ~ alpha.2*1 + 0*1
parents3 ~ alpha.3*1 + 0*1

## COMMON-FACTOR VARIANCES:
# Common factor variances set to 1

parents1 ~~ 1*parents1 + psi.1_1*parents1
parents2 ~~ 1*parents2 + psi.2_2*parents2
parents3 ~~ 1*parents3 + psi.3_3*parents3

## COMMON-FACTOR COVARIANCES:
# Autocorrelated factors across time

parents1 ~~ NA*parents2 + psi.2_1*parents2
parents1 ~~ NA*parents3 + psi.3_1*parents3
parents2 ~~ NA*parents3 + psi.3_2*parents3

 ## LOCALIZED ACQUIESCENCE 
 
bv2b7_1 ~~ aq1*bv2b7_2 
V2B.7_1 ~~ aq2*V2B.7_2 
cv2b7_1 ~~ aq3*cv2b7_2 
cv2b7_2 ~~ aq4*cv2b7_3
'

threshparents_fit <- cfa(threshparents_model, data = subdata, estimator = 'ULSMV')
round(inspect(threshparents_fit, 'fit.measures')[c("npar", "chisq.scaled", "df.scaled", "pvalue.scaled", 
                                                    "cfi.scaled", "tli.scaled", "crmr")], 3)


lavTestLRT(threshparents_fit, configparents_fit4) 
#                     Df AIC BIC  Chisq Chisq diff Df diff Pr(>Chisq)
# configparents_fit4 290         431.68                              
# threshparents_fit  326         459.28     27.254      36     0.8527

# We fail to reject Threshold Invariance

# 2.3. Metric -------------------------------------------------------------

metricparents_model <- '
## LOADINGS
# Equal factor loadings across waves

parents1 =~ NA*V2B.7_1 + lambda.1_1*V2B.7_1; parents2 =~ NA*bv2b7_1 + lambda.1_1*bv2b7_1; parents3 =~ NA*cv2b7_1 + lambda.1_1*cv2b7_1  
parents1 =~ NA*V2B.7_2 + lambda.2_1*V2B.7_2; parents2 =~ NA*bv2b7_2 + lambda.2_1*bv2b7_2; parents3 =~ NA*cv2b7_2 + lambda.2_1*cv2b7_2  
parents1 =~ NA*V2B.7_3 + lambda.3_1*V2B.7_3; parents2 =~ NA*bv2b7_3 + lambda.3_1*bv2b7_3; parents3 =~ NA*cv2b7_3 + lambda.3_1*cv2b7_3  
parents1 =~ NA*V2B.7_4 + lambda.4_1*V2B.7_4; parents2 =~ NA*bv2b7_4 + lambda.4_1*bv2b7_4; parents3 =~ NA*cv2b7_4 + lambda.4_1*cv2b7_4  
parents1 =~ NA*V2B.7_5 + lambda.5_1*V2B.7_5; parents2 =~ NA*bv2b7_5 + lambda.5_1*bv2b7_5; parents3 =~ NA*cv2b7_5 + lambda.5_1*cv2b7_5  
parents1 =~ NA*V2B.7_6 + lambda.6_1*V2B.7_6; parents2 =~ NA*bv2b7_6 + lambda.6_1*bv2b7_6; parents3 =~ NA*cv2b7_6 + lambda.6_1*cv2b7_6  
parents1 =~ NA*V2B.7_7 + lambda.7_1*V2B.7_7; parents2 =~ NA*bv2b7_7 + lambda.7_1*bv2b7_7; parents3 =~ NA*cv2b7_7 + lambda.7_1*cv2b7_7  
parents1 =~ NA*V2B.7_8 + lambda.8_1*V2B.7_8; parents2 =~ NA*bv2b7_8 + lambda.8_1*bv2b7_8; parents3 =~ NA*cv2b7_8 + lambda.8_1*cv2b7_8  
parents1 =~ NA*V2B.7_9 + lambda.9_1*V2B.7_9; parents2 =~ NA*bv2b7_9 + lambda.9_1*bv2b7_9; parents3 =~ NA*cv2b7_9 + lambda.9_1*cv2b7_9  


## THRESHOLDS:
# Equal thresholds across waves

V2B.7_1 | NA*t1 + V2B.7_1.thr1*t1; V2B.7_1 | NA*t2 + V2B.7_1.thr2*t2; V2B.7_1 | NA*t3 + V2B.7_1.thr3*t3; V2B.7_1 | NA*t4 + V2B.7_1.thr4*t4
V2B.7_2 | NA*t1 + V2B.7_2.thr1*t1; V2B.7_2 | NA*t2 + V2B.7_2.thr2*t2; V2B.7_2 | NA*t3 + V2B.7_2.thr3*t3; V2B.7_2 | NA*t4 + V2B.7_2.thr4*t4
V2B.7_3 | NA*t1 + V2B.7_3.thr1*t1; V2B.7_3 | NA*t2 + V2B.7_3.thr2*t2; V2B.7_3 | NA*t3 + V2B.7_3.thr3*t3; V2B.7_3 | NA*t4 + V2B.7_3.thr4*t4
V2B.7_4 | NA*t1 + V2B.7_4.thr1*t1; V2B.7_4 | NA*t2 + V2B.7_4.thr2*t2; V2B.7_4 | NA*t3 + V2B.7_4.thr3*t3; V2B.7_4 | NA*t4 + V2B.7_4.thr4*t4
V2B.7_5 | NA*t1 + V2B.7_5.thr1*t1; V2B.7_5 | NA*t2 + V2B.7_5.thr2*t2; V2B.7_5 | NA*t3 + V2B.7_5.thr3*t3; V2B.7_5 | NA*t4 + V2B.7_5.thr4*t4
V2B.7_6 | NA*t1 + V2B.7_6.thr1*t1; V2B.7_6 | NA*t2 + V2B.7_6.thr2*t2; V2B.7_6 | NA*t3 + V2B.7_6.thr3*t3; V2B.7_6 | NA*t4 + V2B.7_6.thr4*t4
V2B.7_7 | NA*t1 + V2B.7_7.thr1*t1; V2B.7_7 | NA*t2 + V2B.7_7.thr2*t2; V2B.7_7 | NA*t3 + V2B.7_7.thr3*t3; V2B.7_7 | NA*t4 + V2B.7_7.thr4*t4
V2B.7_8 | NA*t1 + V2B.7_8.thr1*t1; V2B.7_8 | NA*t2 + V2B.7_8.thr2*t2; V2B.7_8 | NA*t3 + V2B.7_8.thr3*t3; V2B.7_8 | NA*t4 + V2B.7_8.thr4*t4
V2B.7_9 | NA*t1 + V2B.7_9.thr1*t1; V2B.7_9 | NA*t2 + V2B.7_9.thr2*t2; V2B.7_9 | NA*t3 + V2B.7_9.thr3*t3; V2B.7_9 | NA*t4 + V2B.7_9.thr4*t4
bv2b7_1 | NA*t1 + V2B.7_1.thr1*t1; bv2b7_1 | NA*t2 + V2B.7_1.thr2*t2; bv2b7_1 | NA*t3 + V2B.7_1.thr3*t3; bv2b7_1 | NA*t4 + V2B.7_1.thr4*t4
bv2b7_2 | NA*t1 + V2B.7_2.thr1*t1; bv2b7_2 | NA*t2 + V2B.7_2.thr2*t2; bv2b7_2 | NA*t3 + V2B.7_2.thr3*t3; bv2b7_2 | NA*t4 + V2B.7_2.thr4*t4
bv2b7_3 | NA*t1 + V2B.7_3.thr1*t1; bv2b7_3 | NA*t2 + V2B.7_3.thr2*t2; bv2b7_3 | NA*t3 + V2B.7_3.thr3*t3; bv2b7_3 | NA*t4 + V2B.7_3.thr4*t4
bv2b7_4 | NA*t1 + V2B.7_4.thr1*t1; bv2b7_4 | NA*t2 + V2B.7_4.thr2*t2; bv2b7_4 | NA*t3 + V2B.7_4.thr3*t3; bv2b7_4 | NA*t4 + V2B.7_4.thr4*t4
bv2b7_5 | NA*t1 + V2B.7_5.thr1*t1; bv2b7_5 | NA*t2 + V2B.7_5.thr2*t2; bv2b7_5 | NA*t3 + V2B.7_5.thr3*t3; bv2b7_5 | NA*t4 + V2B.7_5.thr4*t4
bv2b7_6 | NA*t1 + V2B.7_6.thr1*t1; bv2b7_6 | NA*t2 + V2B.7_6.thr2*t2; bv2b7_6 | NA*t3 + V2B.7_6.thr3*t3; bv2b7_6 | NA*t4 + V2B.7_6.thr4*t4
bv2b7_7 | NA*t1 + V2B.7_7.thr1*t1; bv2b7_7 | NA*t2 + V2B.7_7.thr2*t2; bv2b7_7 | NA*t3 + V2B.7_7.thr3*t3; bv2b7_7 | NA*t4 + V2B.7_7.thr4*t4
bv2b7_8 | NA*t1 + V2B.7_8.thr1*t1; bv2b7_8 | NA*t2 + V2B.7_8.thr2*t2; bv2b7_8 | NA*t3 + V2B.7_8.thr3*t3; bv2b7_8 | NA*t4 + V2B.7_8.thr4*t4
bv2b7_9 | NA*t1 + V2B.7_9.thr1*t1; bv2b7_9 | NA*t2 + V2B.7_9.thr2*t2; bv2b7_9 | NA*t3 + V2B.7_9.thr3*t3; bv2b7_9 | NA*t4 + V2B.7_9.thr4*t4
cv2b7_1 | NA*t1 + V2B.7_1.thr1*t1; cv2b7_1 | NA*t2 + V2B.7_1.thr2*t2; cv2b7_1 | NA*t3 + V2B.7_1.thr3*t3; cv2b7_1 | NA*t4 + V2B.7_1.thr4*t4
cv2b7_2 | NA*t1 + V2B.7_2.thr1*t1; cv2b7_2 | NA*t2 + V2B.7_2.thr2*t2; cv2b7_2 | NA*t3 + V2B.7_2.thr3*t3; cv2b7_2 | NA*t4 + V2B.7_2.thr4*t4
cv2b7_3 | NA*t1 + V2B.7_3.thr1*t1; cv2b7_3 | NA*t2 + V2B.7_3.thr2*t2; cv2b7_3 | NA*t3 + V2B.7_3.thr3*t3; cv2b7_3 | NA*t4 + V2B.7_3.thr4*t4
cv2b7_4 | NA*t1 + V2B.7_4.thr1*t1; cv2b7_4 | NA*t2 + V2B.7_4.thr2*t2; cv2b7_4 | NA*t3 + V2B.7_4.thr3*t3; cv2b7_4 | NA*t4 + V2B.7_4.thr4*t4
cv2b7_5 | NA*t1 + V2B.7_5.thr1*t1; cv2b7_5 | NA*t2 + V2B.7_5.thr2*t2; cv2b7_5 | NA*t3 + V2B.7_5.thr3*t3; cv2b7_5 | NA*t4 + V2B.7_5.thr4*t4
cv2b7_6 | NA*t1 + V2B.7_6.thr1*t1; cv2b7_6 | NA*t2 + V2B.7_6.thr2*t2; cv2b7_6 | NA*t3 + V2B.7_6.thr3*t3; cv2b7_6 | NA*t4 + V2B.7_6.thr4*t4
cv2b7_7 | NA*t1 + V2B.7_7.thr1*t1; cv2b7_7 | NA*t2 + V2B.7_7.thr2*t2; cv2b7_7 | NA*t3 + V2B.7_7.thr3*t3; cv2b7_7 | NA*t4 + V2B.7_7.thr4*t4
cv2b7_8 | NA*t1 + V2B.7_8.thr1*t1; cv2b7_8 | NA*t2 + V2B.7_8.thr2*t2; cv2b7_8 | NA*t3 + V2B.7_8.thr3*t3; cv2b7_8 | NA*t4 + V2B.7_8.thr4*t4
cv2b7_9 | NA*t1 + V2B.7_9.thr1*t1; cv2b7_9 | NA*t2 + V2B.7_9.thr2*t2; cv2b7_9 | NA*t3 + V2B.7_9.thr3*t3; cv2b7_9 | NA*t4 + V2B.7_9.thr4*t4


## INTERCEPTS:
# Only first wave is constrained to 0

V2B.7_1 ~ nu.1*1 + 0*1
V2B.7_2 ~ nu.2*1 + 0*1
V2B.7_3 ~ nu.3*1 + 0*1
V2B.7_4 ~ nu.4*1 + 0*1
V2B.7_5 ~ nu.5*1 + 0*1
V2B.7_6 ~ nu.6*1 + 0*1
V2B.7_7 ~ nu.7*1 + 0*1
V2B.7_8 ~ nu.8*1 + 0*1
V2B.7_9 ~ nu.9*1 + 0*1
bv2b7_1 ~ nu.10*1 + NA*1
bv2b7_2 ~ nu.11*1 + NA*1
bv2b7_3 ~ nu.12*1 + NA*1
bv2b7_4 ~ nu.13*1 + NA*1
bv2b7_5 ~ nu.14*1 + NA*1
bv2b7_6 ~ nu.15*1 + NA*1
bv2b7_7 ~ nu.16*1 + NA*1
bv2b7_8 ~ nu.17*1 + NA*1
bv2b7_9 ~ nu.18*1 + NA*1
cv2b7_1 ~ nu.19*1 + NA*1
cv2b7_2 ~ nu.20*1 + NA*1
cv2b7_3 ~ nu.21*1 + NA*1
cv2b7_4 ~ nu.22*1 + NA*1
cv2b7_5 ~ nu.23*1 + NA*1
cv2b7_6 ~ nu.24*1 + NA*1
cv2b7_7 ~ nu.25*1 + NA*1
cv2b7_8 ~ nu.26*1 + NA*1
cv2b7_9 ~ nu.27*1 + NA*1

## SCALING FACTORS:
# Only first wave is constrained to 1

V2B.7_1 ~*~ 1*V2B.7_1
V2B.7_2 ~*~ 1*V2B.7_2
V2B.7_3 ~*~ 1*V2B.7_3
V2B.7_4 ~*~ 1*V2B.7_4
V2B.7_5 ~*~ 1*V2B.7_5
V2B.7_6 ~*~ 1*V2B.7_6
V2B.7_7 ~*~ 1*V2B.7_7
V2B.7_8 ~*~ 1*V2B.7_8
V2B.7_9 ~*~ 1*V2B.7_9
bv2b7_1 ~*~ NA*bv2b7_1
bv2b7_2 ~*~ NA*bv2b7_2
bv2b7_3 ~*~ NA*bv2b7_3
bv2b7_4 ~*~ NA*bv2b7_4
bv2b7_5 ~*~ NA*bv2b7_5
bv2b7_6 ~*~ NA*bv2b7_6
bv2b7_7 ~*~ NA*bv2b7_7
bv2b7_8 ~*~ NA*bv2b7_8
bv2b7_9 ~*~ NA*bv2b7_9
cv2b7_1 ~*~ NA*cv2b7_1
cv2b7_2 ~*~ NA*cv2b7_2
cv2b7_3 ~*~ NA*cv2b7_3
cv2b7_4 ~*~ NA*cv2b7_4
cv2b7_5 ~*~ NA*cv2b7_5
cv2b7_6 ~*~ NA*cv2b7_6
cv2b7_7 ~*~ NA*cv2b7_7
cv2b7_8 ~*~ NA*cv2b7_8
cv2b7_9 ~*~ NA*cv2b7_9


## UNIQUE-FACTOR COVARIANCES:
# Same item across wave is auto-correlated. 

V2B.7_1 ~~ NA*bv2b7_1 + theta.10_1*bv2b7_1; V2B.7_1 ~~ NA*cv2b7_1 + theta.19_1*cv2b7_1
V2B.7_2 ~~ NA*bv2b7_2 + theta.11_2*bv2b7_2; V2B.7_2 ~~ NA*cv2b7_2 + theta.20_2*cv2b7_2
V2B.7_3 ~~ NA*bv2b7_3 + theta.12_3*bv2b7_3; V2B.7_3 ~~ NA*cv2b7_3 + theta.21_3*cv2b7_3
V2B.7_4 ~~ NA*bv2b7_4 + theta.13_4*bv2b7_4; V2B.7_4 ~~ NA*cv2b7_4 + theta.22_4*cv2b7_4
V2B.7_5 ~~ NA*bv2b7_5 + theta.14_5*bv2b7_5; V2B.7_5 ~~ NA*cv2b7_5 + theta.23_5*cv2b7_5
V2B.7_6 ~~ NA*bv2b7_6 + theta.15_6*bv2b7_6; V2B.7_6 ~~ NA*cv2b7_6 + theta.24_6*cv2b7_6
V2B.7_7 ~~ NA*bv2b7_7 + theta.16_7*bv2b7_7; V2B.7_7 ~~ NA*cv2b7_7 + theta.25_7*cv2b7_7
V2B.7_8 ~~ NA*bv2b7_8 + theta.17_8*bv2b7_8; V2B.7_8 ~~ NA*cv2b7_8 + theta.26_8*cv2b7_8
V2B.7_9 ~~ NA*bv2b7_9 + theta.18_9*bv2b7_9; V2B.7_9 ~~ NA*cv2b7_9 + theta.27_9*cv2b7_9
bv2b7_1 ~~ NA*cv2b7_1 + theta.19_10*cv2b7_1
bv2b7_2 ~~ NA*cv2b7_2 + theta.20_11*cv2b7_2
bv2b7_3 ~~ NA*cv2b7_3 + theta.21_12*cv2b7_3
bv2b7_4 ~~ NA*cv2b7_4 + theta.22_13*cv2b7_4
bv2b7_5 ~~ NA*cv2b7_5 + theta.23_14*cv2b7_5
bv2b7_6 ~~ NA*cv2b7_6 + theta.24_15*cv2b7_6
bv2b7_7 ~~ NA*cv2b7_7 + theta.25_16*cv2b7_7
bv2b7_8 ~~ NA*cv2b7_8 + theta.26_17*cv2b7_8
bv2b7_9 ~~ NA*cv2b7_9 + theta.27_18*cv2b7_9 

## LATENT MEANS/INTERCEPTS:
# Latent means set to 0.

parents1 ~ alpha.1*1 + 0*1
parents2 ~ alpha.2*1 + 0*1
parents3 ~ alpha.3*1 + 0*1

## COMMON-FACTOR VARIANCES:
# Only first common factor variance set to 1

parents1 ~~ 1*parents1 + psi.1_1*parents1
parents2 ~~ NA*parents2 + psi.2_2*parents2
parents3 ~~ NA*parents3 + psi.3_3*parents3

## COMMON-FACTOR COVARIANCES:
# Autocorrelated factors across time

parents1 ~~ NA*parents2 + psi.2_1*parents2
parents1 ~~ NA*parents3 + psi.3_1*parents3
parents2 ~~ NA*parents3 + psi.3_2*parents3

 ## LOCALIZED ACQUIESCENCE 
 
bv2b7_1 ~~ aq1*bv2b7_2 
V2B.7_1 ~~ aq2*V2B.7_2 
cv2b7_1 ~~ aq3*cv2b7_2 
cv2b7_2 ~~ aq4*cv2b7_3
'

metricparents_fit <- cfa(metricparents_model, data = subdata, estimator = 'ULSMV')
round(inspect(metricparents_fit, 'fit.measures')[c("npar", "chisq.scaled", "df.scaled", "pvalue.scaled", 
                                                   "cfi.scaled", "tli.scaled", "crmr")], 3)

lavTestLRT(metricparents_fit, threshparents_fit)

#                     Df AIC BIC  Chisq Chisq diff Df diff Pr(>Chisq)    
# threshparents_fit 326         459.28                                  
# metricparents_fit 342         558.06     97.362      16  1.079e-13 ***

# We reject Metric Invariance Assumption
# Threshparents_fit and threshpeers_fit are the last models.

# Summary
#   npar  chisq.scaled     df.scaled pvalue.scaled    cfi.scaled    tli.scaled          crmr 
#165.000      1220.376       294.000         0.000         0.959         0.951         0.039  
#166.000      1162.440       293.000         0.000         0.961         0.954         0.038 # Started specification search
#167.000      1106.865       292.000         0.000         0.964         0.957         0.037 
#168.000      1083.025       291.000         0.000         0.965         0.958         0.037 
#169.000      1059.201       290.000         0.000         0.966         0.959         0.036 # Stopped Specificaiton Search
#133.000       850.441       326.000         0.000         0.977         0.975         0.037  # Threshold Invariant
#117.000       823.702       342.000         0.000         0.979         0.978         0.040  # Metric Invariant
