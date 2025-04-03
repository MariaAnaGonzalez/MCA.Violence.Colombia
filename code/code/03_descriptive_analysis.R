############################################################
##           E. Data Description - Male/Female            ##
############################################################

## We are going to:

# 1) Based on the datasets: "before" (Prepandemic) and "pandemic" we will create 4 new databases accordingly to the category "sex" ("female", "male)
# 2) Describe the new filtered databases accordingly to the selected study variables


## 1. Set working directory


## 2. Import the databases for each period 

load("vio.pandemic.Rds")
load("vio.before.Rds")


## 3. We are going to create a subset of databases for the "before" period stratified by sex

# 3.1  For "before"- Prepandemic

vio.before.female <- subset(vio.before,sexo == "Female")
vio.before.male <- subset(vio.before,sexo == "Male")

# 3.2 For "pandemic" - Pandemic 

vio.pandemic.female <- subset(vio.pandemic,sexo == "Female")
vio.pandemic.male <- subset(vio.pandemic,sexo == "Male")


## 4. Descriptions of the new filtered databases accordingly to the study variables

# 4.1  -- Database:  "vio.before.female"

# A. variable "edad" --- Survivor's age 

describe(vio.before.female$edad)

# B. variable "edad.cat"      --- Survivor's life cycle

tabyl(vio.before.female$edad.cat, show_na = TRUE)%>%
  adorn_pct_formatting(digits = 1)


# C. variable "cod.pais"      --- Survivor's nationality

tabyl(vio.before.female$cod.pais, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# D. variable "ident.gen"     --- Survivor's gender identity

tabyl(vio.before.female$ident.gen, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# E. variable "orient.sex"    --- Survivor's sexual orientation

tabyl(vio.before.female$orient.sex, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# F. variable "ocup.cat"      --- Survivor's occupation 

tabyl(vio.before.female$ocup.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# G. variable "activi.cat"    --- Survivor's main activity  

tabyl(vio.before.female$activi.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# H. variable "gp.gest"       --- Survivor’s pregnant at the moment of the event 

tabyl(vio.before.female$gp.gest, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# I. variable "jefe.h"        --- Survivor who is the head of the household 

tabyl(vio.before.female$jefe.h, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# J. variable "tipo.viol".    --- Main type of violence 

tabyl(vio.before.female$tipo.viol, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# K. variable "v.sexual.cat"  --- Main type of sexual violence 

tabyl(vio.before.female$v.sexual.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# L. variable "sexo.agre"     --- Sex of the aggressor

tabyl(vio.before.female$sexo.agre, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# M. variable "relacion"      --- Relationship with the aggressor

tabyl(vio.before.female$relacion, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# N. variable "conv.agre"     --- Coliving with the aggressor

tabyl(vio.before.female$conv.agre, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# O. variable "mecanismo.cat" --- Mechanism of injury

tabyl(vio.before.female$mecanismo.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# P. variable "escena.cat"    --- Event’s location 

tabyl(vio.before.female$escena.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# Q. variable "antec.vio" --- History of violence

tabyl(vio.before.female$antec.vio, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)



# 4.2 -- Database:  "vio.before.male"

# A. variable "edad" --- Survivor's age 

describe(vio.before.male$edad)

# B. variable "edad.cat"      --- Survivor's life cycle

tabyl(vio.before.male$edad.cat, show_na = TRUE)%>%
  adorn_pct_formatting(digits = 1)


# C. variable "cod.pais"      --- Survivor's nationality

tabyl(vio.before.male$cod.pais, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# D. variable "ident.gen"     --- Survivor's gender identity

tabyl(vio.before.male$ident.gen, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# E. variable "orient.sex"    --- Survivor's sexual orientation

tabyl(vio.before.male$orient.sex, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# F. variable "ocup.cat"      --- Survivor's occupation 

tabyl(vio.before.male$ocup.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# G. variable "activi.cat"    --- Survivor's main activity  

tabyl(vio.before.male$activi.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# H. variable "gp.gest"       --- Survivor’s pregnant at the moment of the event 

tabyl(vio.before.male$gp.gest, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# I. variable "jefe.h"        --- Survivor who is the head of the household 

tabyl(vio.before.male$jefe.h, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# J. variable "tipo.viol".    --- Main type of violence 

tabyl(vio.before.male$tipo.viol, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# K. variable "v.sexual.cat"  --- Main type of sexual violence 

tabyl(vio.before.male$v.sexual.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# L. variable "sexo.agre"     --- Sex of the aggressor

tabyl(vio.before.male$sexo.agre, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# M. variable "relacion"      --- Relationship with the aggressor

tabyl(vio.before.male$relacion, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# N. variable "conv.agre"     --- Coliving with the aggressor

tabyl(vio.before.male$conv.agre, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# O. variable "mecanismo.cat" --- Mechanism of injury

tabyl(vio.before.male$mecanismo.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# P. variable "escena.cat"    --- Event’s location 

tabyl(vio.before.male$escena.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# Q. variable "antec.vio" --- History of violence

tabyl(vio.before.male$antec.vio, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)



# 4.3  -- Database:  "vio.pandemic.female"

# A. variable "edad" --- Survivor's age 

# Check proportions, frequencies and missings (with 1 rounded proportions)

describe(vio.pandemic.female$edad)


# B. variable "edad.cat"      --- Survivor's life cycle

tabyl(vio.pandemic.female$edad.cat, show_na = TRUE)%>%
  adorn_pct_formatting(digits = 1)


# C. variable "cod.pais"      --- Survivor's nationality

tabyl(vio.pandemic.female$cod.pais, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# D. variable "ident.gen"     --- Survivor's gender identity

tabyl(vio.pandemic.female$ident.gen, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# E. variable "orient.sex"    --- Survivor's sexual orientation

tabyl(vio.pandemic.female$orient.sex, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# F. variable "ocup.cat"      --- Survivor's occupation 

tabyl(vio.pandemic.female$ocup.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# G. variable "activi.cat"    --- Survivor's main activity  

tabyl(vio.pandemic.female$activi.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# H. variable "gp.gest"       --- Survivor’s pregnant at the moment of the event 

tabyl(vio.pandemic.female$gp.gest, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# I. variable "jefe.h"        --- Survivor who is the head of the household 

tabyl(vio.pandemic.female$jefe.h, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# J. variable "tipo.viol".    --- Main type of violence 

tabyl(vio.pandemic.female$tipo.viol, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# K. variable "v.sexual.cat"  --- Main type of sexual violence 

tabyl(vio.pandemic.female$v.sexual.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# L. variable "sexo.agre"     --- Sex of the aggressor

tabyl(vio.pandemic.female$sexo.agre, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# M. variable "relacion"      --- Relationship with the aggressor

tabyl(vio.pandemic.female$relacion, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# N. variable "conv.agre"     --- Coliving with the aggressor

tabyl(vio.pandemic.female$conv.agre, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# O. variable "mecanismo.cat" --- Mechanism of injury

tabyl(vio.pandemic.female$mecanismo.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# P. variable "escena.cat"    --- Event’s location 

tabyl(vio.pandemic.female$escena.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# Q. variable "antec.vio" --- History of violence

tabyl(vio.pandemic.female$antec.vio, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# 4.4  -- Database:  "vio.pandemic.male"

# A. variable "edad" --- Survivor's age 

# Check proportions, frequencies and missings (with 1 rounded proportions)

describe(vio.pandemic.male$edad)


# B. variable "edad.cat"      --- Survivor's life cycle

tabyl(vio.pandemic.male$edad.cat, show_na = TRUE)%>%
  adorn_pct_formatting(digits = 1)


# C. variable "cod.pais"      --- Survivor's nationality

tabyl(vio.pandemic.male$cod.pais, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# D. variable "ident.gen"     --- Survivor's gender identity

tabyl(vio.pandemic.male$ident.gen, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# E. variable "orient.sex"    --- Survivor's sexual orientation

tabyl(vio.pandemic.male$orient.sex, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# F. variable "ocup.cat"      --- Survivor's occupation 

tabyl(vio.pandemic.male$ocup.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# G. variable "activi.cat"    --- Survivor's main activity  

tabyl(vio.pandemic.male$activi.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# H. variable "gp.gest"       --- Survivor’s pregnant at the moment of the event 

tabyl(vio.pandemic.male$gp.gest, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# I. variable "jefe.h"        --- Survivor who is the head of the household 

tabyl(vio.pandemic.male$jefe.h, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# J. variable "tipo.viol".    --- Main type of violence 

tabyl(vio.pandemic.male$tipo.viol, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# K. variable "v.sexual.cat"  --- Main type of sexual violence 

tabyl(vio.pandemic.male$v.sexual.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# L. variable "sexo.agre"     --- Sex of the aggressor

tabyl(vio.pandemic.male$sexo.agre, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# M. variable "relacion"      --- Relationship with the aggressor

tabyl(vio.pandemic.male$relacion, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# N. variable "conv.agre"     --- Coliving with the aggressor

tabyl(vio.pandemic.male$conv.agre, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# O. variable "mecanismo.cat" --- Mechanism of injury

tabyl(vio.pandemic.male$mecanismo.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# P. variable "escena.cat"    --- Event’s location 

tabyl(vio.pandemic.male$escena.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# Q. variable "antec.vio" --- History of violence

tabyl(vio.pandemic.male$antec.vio, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


### Save new databases: 

save(vio.before.female,    file = "vio.before.female.Rds")
save(vio.before.male,  file = "vio.before.male.Rds")
save(vio.pandemic.female,      file = "vio.pandemic.female.Rds")
save(vio.pandemic.male,      file = "vio.pandemic.male.Rds")

########################################################################################################################################################################################
########################################################################################################################################################################################


############################################################
##      F. Data Description - Age cohorts                 ##
############################################################

## We are going to:

# 1) Based on the stratified datasets (by sex and by period) we will create 4 new databases accordingly to age cohorts:

# **  0 - 17 years old (Early childhood, childhood, adolescence) 
# **  18  +  years  (Youth, adulthood, older adults)

# 2) Describe the new filtered databases accordingly to the study variables
# 3) Check if there's any difference with the initial analysis (not considering the age limit of + 18) 


## 1. Set working directory

## 2. Import the databases for each period ("Prepandemic" & "Pandemic") stratified by sex

load("vio.pandemic.male.Rds")
load("vio.pandemic.female.Rds")
load("vio.before.male.Rds")
load("vio.before.female.Rds")


## 3. Subset and create new databases for the categories 

##### Before we subset the "Children categories" (Early childhood, Childhood, Adolescence)

# 3.1 For "vio.before.children.female"

vio.before.children.female <- vio.before.female %>%
  filter(edad.cat %in% c("Early childhood", "Childhood", "Adolescence")) %>%
  mutate(edad.cat = droplevels(edad.cat))  # Drop unused factor levels

# Check it
levels(vio.before.children.female$edad.cat)


# 3.2 For "vio.before.children.male"

vio.before.children.male <- vio.before.male %>%
  filter(edad.cat %in% c("Early childhood", "Childhood", "Adolescence")) %>%
  mutate(edad.cat = droplevels(edad.cat))  # Drop unused factor levels

# Check it
levels(vio.before.children.male$edad.cat)


# 3.3 For "vio.pandemic.children.female"

vio.pandemic.children.female <- vio.pandemic.female %>%
  filter(edad.cat %in% c("Early childhood", "Childhood", "Adolescence")) %>%
  mutate(edad.cat = droplevels(edad.cat))  # Drop unused factor levels

# Check it
levels(vio.pandemic.children.female$edad.cat)

# 3.4 For "vio.pandemic.children.male"

vio.pandemic.children.male <- vio.before.male %>%
  filter(edad.cat %in% c("Early childhood", "Childhood", "Adolescence")) %>%
  mutate(edad.cat = droplevels(edad.cat))  # Drop unused factor levels

# Check it
levels(vio.pandemic.children.male$edad.cat)


##### Now we subset the "Adults categories" (Youth, adulthood, older adults)


# 3.5 For "vio.before.adults.female"

vio.before.adults.female <- vio.before.female %>%
  filter(edad.cat %in% c("Youth", "Adulthood", "Older adult")) %>%
  mutate(edad.cat = droplevels(edad.cat))  # Drop unused factor levels

# Check it
levels(vio.before.adults.female$edad.cat)


# 3.6 For "vio.before.adults.male"

vio.before.adults.male <- vio.before.male %>%
  filter(edad.cat %in% c("Youth", "Adulthood", "Older adult")) %>%
  mutate(edad.cat = droplevels(edad.cat))  # Drop unused factor levels

# Check it
levels(vio.before.adults.male$edad.cat)


# 3.6 For "vio.pandemic.adults.female"

vio.pandemic.adults.female <- vio.pandemic.female %>%
  filter(edad.cat %in% c("Youth", "Adulthood", "Older adult")) %>%
  mutate(edad.cat = droplevels(edad.cat))  # Drop unused factor levels

# Check it
levels(vio.pandemic.adults.female$edad.cat)


# 3.6 For "vio.pandemic.adults.male"

vio.pandemic.adults.male <- vio.pandemic.male %>%
  filter(edad.cat %in% c("Youth", "Adulthood", "Older adult")) %>%
  mutate(edad.cat = droplevels(edad.cat))  # Drop unused factor levels

# Check it
levels(vio.pandemic.adults.male$edad.cat)


## 4. Descriptions of the new filtered databases accordingly to the study variables

# 4.1  -- Database:  "vio.before.children.female"

# A. variable "edad" --- Survivor's age 

describe(vio.before.children.female$edad)

# B. variable "edad.cat"      --- Survivor's life cycle

tabyl(vio.before.children.female$edad.cat, show_na = TRUE)%>%
  adorn_pct_formatting(digits = 1)


# C. variable "cod.pais"      --- Survivor's nationality

tabyl(vio.before.children.female$cod.pais, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# D. variable "ident.gen"     --- Survivor's gender identity

tabyl(vio.before.children.female$ident.gen, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# E. variable "orient.sex"    --- Survivor's sexual orientation

tabyl(vio.before.children.female$orient.sex, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# F. variable "ocup.cat"      --- Survivor's occupation 

tabyl(vio.before.children.female$ocup.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# G. variable "activi.cat"    --- Survivor's main activity  

tabyl(vio.before.children.female$activi.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# H. variable "gp.gest"       --- Survivor’s pregnant at the moment of the event 

tabyl(vio.before.children.female$gp.gest, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# I. variable "jefe.h"        --- Survivor who is the head of the household 

tabyl(vio.before.children.female$jefe.h, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# J. variable "tipo.viol".    --- Main type of violence 

tabyl(vio.before.children.female$tipo.viol, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# K. variable "v.sexual.cat"  --- Main type of sexual violence 

tabyl(vio.before.children.female$v.sexual.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# L. variable "sexo.agre"     --- Sex of the aggressor

tabyl(vio.before.children.female$sexo.agre, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# M. variable "relacion"      --- Relationship with the aggressor

tabyl(vio.before.children.female$relacion, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# N. variable "conv.agre"     --- Coliving with the aggressor

tabyl(vio.before.children.female$conv.agre, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# O. variable "mecanismo.cat" --- Mechanism of injury

tabyl(vio.before.children.female$mecanismo.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# P. variable "escena.cat"    --- Event’s location 

tabyl(vio.before.children.female$escena.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# Q. variable "antec.vio" --- History of violence

tabyl(vio.before.children.female$antec.vio, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# 4.2  -- Database:  "vio.pandemic.children.female"

# A. variable "edad" --- Survivor's age 

describe(vio.pandemic.children.female$edad)

# B. variable "edad.cat"      --- Survivor's life cycle

tabyl(vio.pandemic.children.female$edad.cat, show_na = TRUE)%>%
  adorn_pct_formatting(digits = 1)


# C. variable "cod.pais"      --- Survivor's nationality

tabyl(vio.pandemic.children.female$cod.pais, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# D. variable "ident.gen"     --- Survivor's gender identity

tabyl(vio.pandemic.children.female$ident.gen, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# E. variable "orient.sex"    --- Survivor's sexual orientation

tabyl(vio.pandemic.children.female$orient.sex, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# F. variable "ocup.cat"      --- Survivor's occupation 

tabyl(vio.pandemic.children.female$ocup.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# G. variable "activi.cat"    --- Survivor's main activity  

tabyl(vio.pandemic.children.female$activi.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# H. variable "gp.gest"       --- Survivor’s pregnant at the moment of the event 

tabyl(vio.pandemic.children.female$gp.gest, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# I. variable "jefe.h"        --- Survivor who is the head of the household 

tabyl(vio.pandemic.children.female$jefe.h, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# J. variable "tipo.viol".    --- Main type of violence 

tabyl(vio.pandemic.children.female$tipo.viol, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# K. variable "v.sexual.cat"  --- Main type of sexual violence 

tabyl(vio.pandemic.children.female$v.sexual.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# L. variable "sexo.agre"     --- Sex of the aggressor

tabyl(vio.pandemic.children.female$sexo.agre, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# M. variable "relacion"      --- Relationship with the aggressor

tabyl(vio.pandemic.children.female$relacion, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# N. variable "conv.agre"     --- Coliving with the aggressor

tabyl(vio.pandemic.children.female$conv.agre, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# O. variable "mecanismo.cat" --- Mechanism of injury

tabyl(vio.pandemic.children.female$mecanismo.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# P. variable "escena.cat"    --- Event’s location 

tabyl(vio.pandemic.children.female$escena.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# Q. variable "antec.vio" --- History of violence

tabyl(vio.pandemic.children.female$antec.vio, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# 4.3  -- Database:  "vio.before.children.male"

# A. variable "edad" --- Survivor's age 

describe(vio.before.children.male$edad)

# B. variable "edad.cat"      --- Survivor's life cycle

tabyl(vio.before.children.male$edad.cat, show_na = TRUE)%>%
  adorn_pct_formatting(digits = 1)


# C. variable "cod.pais"      --- Survivor's nationality

tabyl(vio.before.children.male$cod.pais, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# D. variable "ident.gen"     --- Survivor's gender identity

tabyl(vio.before.children.male$ident.gen, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# E. variable "orient.sex"    --- Survivor's sexual orientation

tabyl(vio.before.children.male$orient.sex, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# F. variable "ocup.cat"      --- Survivor's occupation 

tabyl(vio.before.children.male$ocup.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# G. variable "activi.cat"    --- Survivor's main activity  

tabyl(vio.before.children.male$activi.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# H. variable "gp.gest"       --- Survivor’s pregnant at the moment of the event 

tabyl(vio.before.children.male$gp.gest, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# I. variable "jefe.h"        --- Survivor who is the head of the household 

tabyl(vio.before.children.male$jefe.h, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# J. variable "tipo.viol".    --- Main type of violence 

tabyl(vio.before.children.male$tipo.viol, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# K. variable "v.sexual.cat"  --- Main type of sexual violence 

tabyl(vio.before.children.male$v.sexual.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# L. variable "sexo.agre"     --- Sex of the aggressor

tabyl(vio.before.children.male$sexo.agre, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# M. variable "relacion"      --- Relationship with the aggressor

tabyl(vio.before.children.male$relacion, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# N. variable "conv.agre"     --- Coliving with the aggressor

tabyl(vio.before.children.male$conv.agre, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# O. variable "mecanismo.cat" --- Mechanism of injury

tabyl(vio.before.children.male$mecanismo.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# P. variable "escena.cat"    --- Event’s location 

tabyl(vio.before.children.male$escena.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# Q. variable "antec.vio" --- History of violence

tabyl(vio.before.children.male$antec.vio, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# 4.4  -- Database:  "vio.pandemic.children.male"

# A. variable "edad" --- Survivor's age 

describe(vio.pandemic.children.male$edad)

# B. variable "edad.cat"      --- Survivor's life cycle

tabyl(vio.pandemic.children.male$edad.cat, show_na = TRUE)%>%
  adorn_pct_formatting(digits = 1)

# C. variable "cod.pais"      --- Survivor's nationality

tabyl(vio.pandemic.children.male$cod.pais, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# D. variable "ident.gen"     --- Survivor's gender identity

tabyl(vio.pandemic.children.male$ident.gen, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# E. variable "orient.sex"    --- Survivor's sexual orientation

tabyl(vio.pandemic.children.male$orient.sex, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# F. variable "ocup.cat"      --- Survivor's occupation 

tabyl(vio.pandemic.children.male$ocup.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# G. variable "activi.cat"    --- Survivor's main activity  

tabyl(vio.pandemic.children.male$activi.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# H. variable "gp.gest"       --- Survivor’s pregnant at the moment of the event 

tabyl(vio.pandemic.children.male$gp.gest, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# I. variable "jefe.h"        --- Survivor who is the head of the household 

tabyl(vio.pandemic.children.male$jefe.h, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# J. variable "tipo.viol".    --- Main type of violence 

tabyl(vio.pandemic.children.male$tipo.viol, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# K. variable "v.sexual.cat"  --- Main type of sexual violence 

tabyl(vio.pandemic.children.male$v.sexual.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# L. variable "sexo.agre"     --- Sex of the aggressor

tabyl(vio.pandemic.children.male$sexo.agre, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# M. variable "relacion"      --- Relationship with the aggressor

tabyl(vio.pandemic.children.male$relacion, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# N. variable "conv.agre"     --- Coliving with the aggressor

tabyl(vio.pandemic.children.male$conv.agre, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# O. variable "mecanismo.cat" --- Mechanism of injury

tabyl(vio.pandemic.children.male$mecanismo.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# P. variable "escena.cat"    --- Event’s location 

tabyl(vio.pandemic.children.male$escena.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# Q. variable "antec.vio" --- History of violence

tabyl(vio.pandemic.children.male$antec.vio, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)




# 4.5  -- Database:  "vio.before.adults.female"

# A. variable "edad" --- Survivor's age 

describe(vio.before.adults.female$edad)

# B. variable "edad.cat"      --- Survivor's life cycle

tabyl(vio.before.adults.female$edad.cat, show_na = TRUE)%>%
  adorn_pct_formatting(digits = 1)


# C. variable "cod.pais"      --- Survivor's nationality

tabyl(vio.before.adults.female$cod.pais, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# D. variable "ident.gen"     --- Survivor's gender identity

tabyl(vio.before.adults.female$ident.gen, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# E. variable "orient.sex"    --- Survivor's sexual orientation

tabyl(vio.before.adults.female$orient.sex, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# F. variable "ocup.cat"      --- Survivor's occupation 

tabyl(vio.before.adults.female$ocup.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# G. variable "activi.cat"    --- Survivor's main activity  

tabyl(vio.before.adults.female$activi.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# H. variable "gp.gest"       --- Survivor’s pregnant at the moment of the event 

tabyl(vio.before.adults.female$gp.gest, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# I. variable "jefe.h"        --- Survivor who is the head of the household 

tabyl(vio.before.adults.female$jefe.h, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# J. variable "tipo.viol".    --- Main type of violence 

tabyl(vio.before.adults.female$tipo.viol, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# K. variable "v.sexual.cat"  --- Main type of sexual violence 

tabyl(vio.before.adults.female$v.sexual.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# L. variable "sexo.agre"     --- Sex of the aggressor

tabyl(vio.before.adults.female$sexo.agre, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# M. variable "relacion"      --- Relationship with the aggressor

tabyl(vio.before.adults.female$relacion, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# N. variable "conv.agre"     --- Coliving with the aggressor

tabyl(vio.before.adults.female$conv.agre, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# O. variable "mecanismo.cat" --- Mechanism of injury

tabyl(vio.before.adults.female$mecanismo.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# P. variable "escena.cat"    --- Event’s location 

tabyl(vio.before.adults.female$escena.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# Q. variable "antec.vio" --- History of violence

tabyl(vio.before.adults.female$antec.vio, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)



# 4.6  -- Database:  "vio.before.adults.male"

# A. variable "edad" --- Survivor's age 

describe(vio.before.adults.male$edad)

# B. variable "edad.cat"      --- Survivor's life cycle

tabyl(vio.before.adults.male$edad.cat, show_na = TRUE)%>%
  adorn_pct_formatting(digits = 1)


# C. variable "cod.pais"      --- Survivor's nationality

tabyl(vio.before.adults.male$cod.pais, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# D. variable "ident.gen"     --- Survivor's gender identity

tabyl(vio.before.adults.male$ident.gen, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# E. variable "orient.sex"    --- Survivor's sexual orientation

tabyl(vio.before.adults.male$orient.sex, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# F. variable "ocup.cat"      --- Survivor's occupation 

tabyl(vio.before.adults.male$ocup.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# G. variable "activi.cat"    --- Survivor's main activity  

tabyl(vio.before.adults.male$activi.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# H. variable "gp.gest"       --- Survivor’s pregnant at the moment of the event 

tabyl(vio.before.adults.male$gp.gest, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# I. variable "jefe.h"        --- Survivor who is the head of the household 

tabyl(vio.before.adults.male$jefe.h, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# J. variable "tipo.viol".    --- Main type of violence 

tabyl(vio.before.adults.male$tipo.viol, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# K. variable "v.sexual.cat"  --- Main type of sexual violence 

tabyl(vio.before.adults.male$v.sexual.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# L. variable "sexo.agre"     --- Sex of the aggressor

tabyl(vio.before.adults.male$sexo.agre, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# M. variable "relacion"      --- Relationship with the aggressor

tabyl(vio.before.adults.male$relacion, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# N. variable "conv.agre"     --- Coliving with the aggressor

tabyl(vio.before.adults.male$conv.agre, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# O. variable "mecanismo.cat" --- Mechanism of injury

tabyl(vio.before.adults.male$mecanismo.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# P. variable "escena.cat"    --- Event’s location 

tabyl(vio.before.adults.male$escena.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# Q. variable "antec.vio" --- History of violence

tabyl(vio.before.adults.male$antec.vio, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)





# 4.7  -- Database:  "vio.pandemic.adults.female"

# A. variable "edad" --- Survivor's age 

describe(vio.pandemic.adults.female$edad)

# B. variable "edad.cat"      --- Survivor's life cycle

tabyl(vio.pandemic.adults.female$edad.cat, show_na = TRUE)%>%
  adorn_pct_formatting(digits = 1)


# C. variable "cod.pais"      --- Survivor's nationality

tabyl(vio.pandemic.adults.female$cod.pais, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# D. variable "ident.gen"     --- Survivor's gender identity

tabyl(vio.pandemic.adults.female$ident.gen, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# E. variable "orient.sex"    --- Survivor's sexual orientation

tabyl(vio.pandemic.adults.female$orient.sex, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# F. variable "ocup.cat"      --- Survivor's occupation 

tabyl(vio.pandemic.adults.female$ocup.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# G. variable "activi.cat"    --- Survivor's main activity  

tabyl(vio.pandemic.adults.female$activi.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# H. variable "gp.gest"       --- Survivor’s pregnant at the moment of the event 

tabyl(vio.pandemic.adults.female$gp.gest, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# I. variable "jefe.h"        --- Survivor who is the head of the household 

tabyl(vio.pandemic.adults.female$jefe.h, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# J. variable "tipo.viol".    --- Main type of violence 

tabyl(vio.pandemic.adults.female$tipo.viol, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# K. variable "v.sexual.cat"  --- Main type of sexual violence 

tabyl(vio.pandemic.adults.female$v.sexual.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# L. variable "sexo.agre"     --- Sex of the aggressor

tabyl(vio.pandemic.adults.female$sexo.agre, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# M. variable "relacion"      --- Relationship with the aggressor

tabyl(vio.pandemic.adults.female$relacion, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# N. variable "conv.agre"     --- Coliving with the aggressor

tabyl(vio.pandemic.adults.female$conv.agre, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# O. variable "mecanismo.cat" --- Mechanism of injury

tabyl(vio.pandemic.adults.female$mecanismo.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# P. variable "escena.cat"    --- Event’s location 

tabyl(vio.pandemic.adults.female$escena.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# Q. variable "antec.vio" --- History of violence

tabyl(vio.pandemic.adults.female$antec.vio, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# 4.5  -- Database:  "vio.pandemic.adults.male"

# A. variable "edad" --- Survivor's age 

describe(vio.pandemic.adults.male$edad)

# B. variable "edad.cat"      --- Survivor's life cycle

tabyl(vio.pandemic.adults.male$edad.cat, show_na = TRUE)%>%
  adorn_pct_formatting(digits = 1)


# C. variable "cod.pais"      --- Survivor's nationality

tabyl(vio.pandemic.adults.male$cod.pais, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# D. variable "ident.gen"     --- Survivor's gender identity

tabyl(vio.pandemic.adults.male$ident.gen, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# E. variable "orient.sex"    --- Survivor's sexual orientation

tabyl(vio.pandemic.adults.male$orient.sex, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# F. variable "ocup.cat"      --- Survivor's occupation 

tabyl(vio.pandemic.adults.male$ocup.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# G. variable "activi.cat"    --- Survivor's main activity  

tabyl(vio.pandemic.adults.male$activi.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# H. variable "gp.gest"       --- Survivor’s pregnant at the moment of the event 

tabyl(vio.pandemic.adults.male$gp.gest, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# I. variable "jefe.h"        --- Survivor who is the head of the household 

tabyl(vio.pandemic.adults.male$jefe.h, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# J. variable "tipo.viol".    --- Main type of violence 

tabyl(vio.pandemic.adults.male$tipo.viol, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# K. variable "v.sexual.cat"  --- Main type of sexual violence 

tabyl(vio.pandemic.adults.male$v.sexual.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# L. variable "sexo.agre"     --- Sex of the aggressor

tabyl(vio.pandemic.adults.male$sexo.agre, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# M. variable "relacion"      --- Relationship with the aggressor

tabyl(vio.pandemic.adults.male$relacion, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# N. variable "conv.agre"     --- Coliving with the aggressor

tabyl(vio.pandemic.adults.male$conv.agre, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# O. variable "mecanismo.cat" --- Mechanism of injury

tabyl(vio.pandemic.adults.male$mecanismo.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# P. variable "escena.cat"    --- Event’s location 

tabyl(vio.pandemic.adults.male$escena.cat, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# Q. variable "antec.vio" --- History of violence

tabyl(vio.pandemic.adults.male$antec.vio, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)












