############################################################
## A. Data import and data cleaning - 2017 ##
############################################################

## 1. Set working directory

## 2. Import data set from excel

X875_2017_copia <- read_excel("875_2017 copia.xlsx")
View(X875_2017_copia)


## 3. Save the first data set - "X875_2017"

save(X875_2017_copia, file = "X875_2017_copia.Rds")
save(X875_2017_copia, file = "X875_2017_copia.Rds")

## 4. First raw description and original names of the variables 

summary(X875_2017_copia)
names(X875_2017_copia)


## 5. First selection of all variables that could be useful according to my protocol and the previous exploratory analysis

# I decided to take all that could be useful for the future: 38 variables 
# New dataset: "vio.2017.a"
# For this part of the data cleaning and selection we will continue using the original database names and labels in Spanish. 

vio.2017.a <-select(X875_2017_copia,  "FEC_NOT",      "ANO", 
                                      "EDAD",         "SEXO",        "COD_PAIS_O", 
                                      "OCUPACION",    "TIP_SS",       "PER_ETN", 
                                      "GP_DISCAPA",   "GP_DESPLAZ" , 
                                      "GP_MIGRANT",   "GP_CARCELA" ,  "GP_GESTAN" , 
                                      "GP_INDIGEN",   "GP_POBICFB",   "GP_MAD_COM" , 
                                      "GP_DESMOVI",   "GP_PSIQUIA",   "GP_VIC_VIO", 
                                      "GP_OTROS",     "Departamento_ocurrencia", 
                                      "naturaleza",   "nat_viosex",   "actividad", 
                                      "orient_sex",   "ident_gene",   "consum_spa", 
                                      "mujer_cabf",   "antec",        "sust_vict",  
                                      "sexo_agre",    "r_fam_vic", 
                                      "conv_agre",    "r_nofiliar",    "zona_conf", 
                                      "arma",         "fec_hecho",    "escenario")  
                                      
                                      
                                      

# Corroboration: 
# - Number of observationss: 
# - Number of variables: 


## 6. Names of the selected variables 

names(vio.2017.a)
names(vio.2017.a)=c("fech.not",     "año",              "edad", 
                    "sexo",         "cod.pais",         "ocup", 
                    "ss",           "etnia",                       
                    "gp.disca",     "gp.despla",        "gp.migra",     
                    "gp.carce",     "gp.gest",          "gp.indi", 
                    "gp.icbf",      "gp.mad.com",       "gp.desmo",     
                    "gp.psi",       "gp.vic.vio",       "gp.otros", 
                    "dep.ocu",      "naturaleza", 
                    "v.sexual",     "activi",           "orient.sex", 
                    "ident.gen",    "consumo.spa",      "jefe.h", 
                    "antec.vio",    "oh.otros",         "sexo.agre",    
                    "rel.fami",     "conv.agre",        "r.no.flia",     
                    "zona.conf.arm", "mecanismo",       "fech.hech", 
                    "escena")

names(vio.2017.a)
str(vio.2017.a)


## 7. Label variables and categories 1x1 & check the missings
# Check the type of variable: 

# 7.1. "fech.not" --- Must be a date: year, month, day (ymd)

vio.2017.a$fech.not <-ymd(vio.2017.a$fech.not)
class(vio.2017.a$fech.not)
str(vio.2017.a$fech.not)

# Missings
is.na(vio.2017.a$fech.not)
sum(is.na(vio.2017.a$fech.not))
# No missings


# 7.2. "año"   ---- must be a date but we leave it as an integer for the future 

vio.2017.a$año <-as.integer(vio.2017.a$año)
class(vio.2017.a$año)
str(vio.2017.a$año)

# Missings
is.na(vio.2017.a$año)
sum(is.na(vio.2017.a$año))
# No missings


# 7.3. "edad"  --- integer 

vio.2017.a$edad <-as.integer(vio.2017.a$edad)
class(vio.2017.a$edad)
str(vio.2017.a$edad)

# Missings
is.na(vio.2017.a$edad)
sum(is.na(vio.2017.a$edad))

# No missings


# 7.4. "sexo"   ---- factor  (only two: F, M)

vio.2017.a$sexo<-factor(vio.2017.a$sexo)
levels(vio.2017.a$sexo)
vio.2017.a$sexo<-factor(vio.2017.a$sexo, levels=c("F","M"), labels=c("Femenino", "Masculino"))
str(vio.2017.a$sexo)
class(vio.2017.a$sexo)
levels(vio.2017.a$sexo)

# Missings
is.na(vio.2017.a$sexo)
sum(is.na(vio.2017.a$sexo))



# 7.5. "cod.pais"   ----- factor 

vio.2017.a$cod.pais<-factor(vio.2017.a$cod.pais)
levels(vio.2017.a$cod.pais)

# "000" "032" "068" "076" "132" "152" "170" "218" "249" "446" "484" "580" "724" "792" "862"
# I'm only interested in Colombia, Venezuela and Others 
# - "170": Colombia
# - "862": Venezuela 
# - The rest: Otro

# Define levels and labels (including 'Other' for all countries that are neither Colombia nor Venezuela)
new_levels <- c("170", "862", "Otro")
new_labels <- c("Colombia", "Venezuela", "Otro")

vio.2017.a$cod.pais<-factor(vio.2017.a$cod.pais, levels=new_levels, 
                                                 labels=new_labels, 
                                                 exclude = NULL)

# Replace any factor levels that are not Colombia or Venezuela with "Other"
levels(vio.2017.a$cod.pais)[levels(vio.2017.a$cod.pais) == "Colombia"] <- "Colombia"
levels(vio.2017.a$cod.pais)[levels(vio.2017.a$cod.pais) == "Venezuel"] <- "Venezuela"
vio.2017.a$cod.pais[!(vio.2017.a$cod.pais %in% c("Colombia", "Venezuela"))] <- "Otro"

# Check the structure
str(vio.2017.a$cod.pais)
class(vio.2017.a$cod.pais)
levels(vio.2017.a$cod.pais)

# Missings
is.na(vio.2017.a$cod.pais)
sum(is.na(vio.2017.a$cod.pais))


# 7.6. "ocup"      ----- factor (ISO Codes)

vio.2017.a$ocup<-factor(vio.2017.a$ocup)
str(vio.2017.a$ocup)
class(vio.2017.a$ocup)
levels(vio.2017.a$ocup)

# Missings
is.na(vio.2017.a$ocup)
sum(is.na(vio.2017.a$ocup))

# 7.7.  "ss" ---  factor (social security type)

vio.2017.a$ss<-factor(vio.2017.a$ss)
str(vio.2017.a$ss)
levels(vio.2017.a$ss)

vio.2017.a$ss<-factor(vio.2017.a$ss, levels=c("C","S", "P", "E", "N", "I"), labels=c("Contributivo", "Subsidiado", "Excepción", "Especial", "No asegurado", "Indeterminado/Pendiente"))
class(vio.2017.a$ss)
levels(vio.2017.a$ss)


# Missings
is.na(vio.2017.a$ss)
sum(is.na(vio.2017.a$ss))



# 7.8. "etnia"  ------ factor 

vio.2017.a$etnia<-factor(vio.2017.a$etnia)
str(vio.2017.a$etnia)

levels(vio.2017.a$etnia)

vio.2017.a$etnia<-factor(vio.2017.a$etnia, 
                           levels=c("1","2", "3", "4", "5", "6"), 
                           labels=c("Indígena", "Rom/gitano", "Raizal", "Palenquero", 
                                    "Mulato/afro colombiano", "Otro"))
class(vio.2017.a$etnia)
levels(vio.2017.a$etnia)

# Missings
is.na(vio.2017.a$etnia)
sum(is.na(vio.2017.a$etnia))


# 7.9 "gp.disca"  ---- factor/binary

vio.2017.a$gp.disca<-factor(vio.2017.a$gp.disca)
str(vio.2017.a$gp.disca)
levels(vio.2017.a$gp.disca)

vio.2017.a$gp.disca<-factor(vio.2017.a$gp.disca, levels=c("1","2"), labels=c("Sí", "No"))
class(vio.2017.a$gp.disca)
levels(vio.2017.a$gp.disca)

# Missings
is.na(vio.2017.a$gp.disca)
sum(is.na(vio.2017.a$gp.disca))
sum(is.na(vio.2017.a$gp.disca))


# 7.10. "gp.despla" ---- factor/binary 

vio.2017.a$gp.despla <-factor(vio.2017.a$gp.despla)
str(vio.2017.a$gp.despla)
levels(vio.2017.a$gp.despla)

vio.2017.a$gp.despla<-factor(vio.2017.a$gp.despla, levels=c("1","2"), labels=c("Sí", "No"))
class(vio.2017.a$gp.despla)
levels(vio.2017.a$gp.despla)

# Missings
is.na(vio.2017.a$gp.despla)
sum(is.na(vio.2017.a$gp.despla))
sum(is.na(vio.2017.a$gp.despla))


# 7.11. "gp.migra"  ---- factor/binary 

vio.2017.a$gp.migra<-factor(vio.2017.a$gp.migra)
str(vio.2017.a$gp.migra)
levels(vio.2017.a$gp.migra)

vio.2017.a$gp.migra<-factor(vio.2017.a$gp.migra, levels=c("1","2"), labels=c("Sí", "No"))
class(vio.2017.a$gp.migra)
levels(vio.2017.a$gp.migra)

# Missings
is.na(vio.2017.a$gp.migra)
sum(is.na(vio.2017.a$gp.migra))
sum(is.na(vio.2017.a$gp.migra))


# 7.12.  "gp.carce"     ---- factor/binary

vio.2017.a$gp.carce<-factor(vio.2017.a$gp.carce)
str(vio.2017.a$gp.carce)
levels(vio.2017.a$gp.carce)

vio.2017.a$gp.carce<-factor(vio.2017.a$gp.carce, levels=c("1","2"), labels=c("Sí", "No"))
class(vio.2017.a$gp.carce)
levels(vio.2017.a$gp.carce)

# Missings
is.na(vio.2017.a$gp.carce)
sum(is.na(vio.2017.a$gp.carce))
sum(is.na(vio.2017.a$gp.carce))


# 7.13.  "gp.gest"      ---- factor/binary 

vio.2017.a$gp.gest<-factor(vio.2017.a$gp.gest)
str(vio.2017.a$gp.gest)
levels(vio.2017.a$gp.gest)

vio.2017.a$gp.gest<-factor(vio.2017.a$gp.gest, levels=c("1","2"), labels=c("Sí", "No"))
class(vio.2017.a$gp.gest)
levels(vio.2017.a$gp.gest)

# Missings
is.na(vio.2017.a$gp.gest)
sum(is.na(vio.2017.a$gp.gest))
sum(is.na(vio.2017.a$gp.gest))


# 7.14. "gp.indi"       ---- factor/binary 


vio.2017.a$gp.indi<-factor(vio.2017.a$gp.indi)
str(vio.2017.a$gp.indi)
levels(vio.2017.a$gp.indi)

vio.2017.a$gp.indi<-factor(vio.2017.a$gp.indi, levels=c("1","2"), labels=c("Sí", "No"))
class(vio.2017.a$gp.indi)
levels(vio.2017.a$gp.indi)

# Missings
is.na(vio.2017.a$gp.indi)
sum(is.na(vio.2017.a$gp.indi))
sum(is.na(vio.2017.a$gp.indi))


# 7.15. "gp.icbf"       ---- factor/binary

vio.2017.a$gp.icbf<-factor(vio.2017.a$gp.icbf)
str(vio.2017.a$gp.icbf)
levels(vio.2017.a$gp.icbf)

vio.2017.a$gp.icbf<-factor(vio.2017.a$gp.icbf, levels=c("1","2"), labels=c("Sí", "No"))
class(vio.2017.a$gp.icbf)
levels(vio.2017.a$gp.icbf)

# Missings
is.na(vio.2017.a$gp.icbf)
sum(is.na(vio.2017.a$gp.icbf))
sum(is.na(vio.2017.a$gp.icbf))


# 7.16. "gp.mad.com"    ---- factor/binary 

vio.2017.a$gp.mad.com<-factor(vio.2017.a$gp.mad.com)
str(vio.2017.a$gp.mad.com)
levels(vio.2017.a$gp.mad.com)

vio.2017.a$gp.mad.com<-factor(vio.2017.a$gp.mad.com, levels=c("1","2"), labels=c("Sí", "No"))
class(vio.2017.a$gp.mad.com)
levels(vio.2017.a$gp.mad.com)

# Missings
is.na(vio.2017.a$gp.mad.com)
sum(is.na(vio.2017.a$gp.mad.com))
sum(is.na(vio.2017.a$gp.mad.com))


# 7.17. "gp.desmo"      ---- factor/binary 

vio.2017.a$gp.desmo<-factor(vio.2017.a$gp.desmo)
str(vio.2017.a$gp.desmo)
levels(vio.2017.a$gp.desmo)

vio.2017.a$gp.desmo<-factor(vio.2017.a$gp.desmo, levels=c("1","2"), labels=c("Sí", "No"))
class(vio.2017.a$gp.desmo)
levels(vio.2017.a$gp.desmo)

# Missings
is.na(vio.2017.a$gp.desmo)
sum(is.na(vio.2017.a$gp.desmo))
sum(is.na(vio.2017.a$gp.desmo))


# 7.18. "gp.psi"        ---- factor/binary 

vio.2017.a$gp.psi <-factor(vio.2017.a$gp.psi)
str(vio.2017.a$gp.psi)
levels(vio.2017.a$gp.psi)

vio.2017.a$gp.psi <-factor(vio.2017.a$gp.psi, levels=c("1","2"), labels=c("Sí", "No"))
class(vio.2017.a$gp.psi)
levels(vio.2017.a$gp.psi)

# Missings
is.na(vio.2017.a$gp.psi)
sum(is.na(vio.2017.a$gp.psi))
sum(is.na(vio.2017.a$gp.psi))


# 7.19. "gp.vic.vio"    ---- factor/binary 

vio.2017.a$gp.vic.vio<-factor(vio.2017.a$gp.vic.vio)
str(vio.2017.a$gp.vic.vio)
levels(vio.2017.a$gp.vic.vio)

vio.2017.a$gp.vic.vio<-factor(vio.2017.a$gp.vic.vio, levels=c("1","2"), labels=c("Sí", "No"))
class(vio.2017.a$gp.vic.vio)
levels(vio.2017.a$gp.vic.vio)

# Missings
is.na(vio.2017.a$gp.vic.vio)
sum(is.na(vio.2017.a$gp.vic.vio))
sum(is.na(vio.2017.a$gp.vic.vio))


# 7.20. "gp.otros"      ---- factor/binary 

vio.2017.a$gp.otros<-factor(vio.2017.a$gp.otros)
str(vio.2017.a$gp.otros)
levels(vio.2017.a$gp.otros)

vio.2017.a$gp.otros <-factor(vio.2017.a$gp.otros, levels=c("1","2"), labels=c("Sí", "No"))
class(vio.2017.a$gp.otros)
levels(vio.2017.a$gp.otros)

# Missings
is.na(vio.2017.a$gp.otros)
sum(is.na(vio.2017.a$gp.otros))
sum(is.na(vio.2017.a$gp.otros))



# 7.21. "dep.ocu"  ----- Categorical 


vio.2017.a$dep.ocu<-factor(vio.2017.a$dep.ocu)
str(vio.2017.a$dep.ocu)
levels(vio.2017.a$dep.ocu)


# 35 levels - 


vio.2017.a$dep.ocu<-factor(vio.2017.a$dep.ocu, 
                           levels=c("AMAZONAS",              "ANTIOQUIA" , 
                                    "ARAUCA",               "ATLANTICO",               
                                    "BOGOTA",                "BOLIVAR" ,               
                                    "BOYACA",                 "CALDAS" ,                
                                    "CAQUETA",                "CASANARE" ,              
                                    "CAUCA" ,                 "CESAR"  ,            
                                    "CHOCO"  ,                "CORDOBA" ,             
                                    "CUNDINAMARCA" ,           "EXTERIOR" ,             
                                    "GUAINIA"      ,           "GUAJIRA" ,           
                                    "GUAVIARE"     ,           "HUILA" ,          
                                    "MAGDALENA"   ,            "META"  ,          
                                    "NARIÑO"    ,               "NORTE SANTANDER" ,       
                                    "PROCEDENCIA DESCONOCIDA", "PUTUMAYO",       
                                    "QUINDIO"    ,             "RISARALDA" ,      
                                    "SAN ANDRES"  ,            "SANTANDER" ,     
                                    "SUCRE"    ,               "TOLIMA"    ,    
                                    "VALLE"     ,              "VAUPES",  
                                    "VICHADA"),   
                           
                           
                           labels=c( "Amazonas",                "Antioquia",               "Arauca",                  "Atlántico" ,             
                                     "Bogotá",                  "Bolivar"    ,             "Boyacá"  ,                "Caldas"      ,           
                                     "Caquetá",                 "Casanare"    ,            "Cauca"    ,               "Cesar"        ,          
                                     "Chocó",                   "Córdoba"      ,           "Cundinamarca",            "Exterior"      ,         
                                     "Guainía",                 "Guajira"       ,          "Guaviare"     ,           "Huila"          ,        
                                     "Magdalena",               "Meta"           ,         "Nariño"        ,          "Norte de Santander","Procedencia desconocida",         
                                     "Putumayo"        ,        "Quindío"        ,         "Risaralda"         ,     
                                     "San Andrés",              "Santander"       ,        "Sucre"          ,         "Tolima"            ,     
                                     "Valle del Cauca",         "Vaupés"           ,       "Vichada"    ))





# Missings
is.na(vio.2017.a$dep.ocu)
sum(is.na(vio.2017.a$dep.ocu))
sum(is.na(vio.2017.a$dep.ocu))


# 7.22. "naturaleza"  ---- factor 

vio.2017.a$naturaleza <-factor(vio.2017.a$naturaleza)
str(vio.2017.a$naturaleza)
levels(vio.2017.a$naturaleza)


## Check categories 
table(vio.2017.a$naturaleza,vio.2017.a$v.sexual,useNA = "ifany" )

# Unknown categories: 11,12,4,5,6,7
# August 2024, meeting with INS data expert - unknown categories - different surveillance systems during that time.
# Early recollection system not standardized 
# Don't consider them - We will treat them as missing values 

vio.2017.a$naturaleza <-factor(vio.2017.a$naturaleza, levels=c( "1", "2", "3"), labels=c("Violencia física", "Violencia psicológica", "Negligencia y abandono"))
class(vio.2017.a$naturaleza)
levels(vio.2017.a$naturaleza)


# Missings
is.na(vio.2017.a$naturaleza)
sum(is.na(vio.2017.a$naturaleza))
sum(is.na(vio.2017.a$naturaleza))


# Table to check categories
table(vio.2017.a$naturaleza, useNA = "ifany")


# 7.23.  "v.sexual" 

vio.2017.a$v.sexual <-factor(vio.2017.a$v.sexual)
str(vio.2017.a$v.sexual)
levels(vio.2017.a$v.sexual)

## Check categories - all perfect! Same as dictionaries 
table(vio.2017.a$v.sexual)



vio.2017.a$v.sexual <-factor(vio.2017.a$v.sexual, levels=c( "4", "5", "6", "7", "10", "12", "14", "15"), 
                             labels=c("Abuso sexual", "Acoso sexual", "Violación", 
                                      "Explotación sexual comercial de niños, niñas y adolescentes", 
                                      "Trata de personas","Actos sexuales con uso de la fuerza", 
                                      "Otros actos sexuales (desnudez, esterilización, planificación)",
                                      "Mutilación genital"))  

class(vio.2017.a$v.sexual)
levels(vio.2017.a$v.sexual)

# Missings
is.na(vio.2017.a$v.sexual)
sum(is.na(vio.2017.a$v.sexual))
sum(is.na(vio.2017.a$v.sexual))



# 7.24. "activi" ---- factor 

vio.2017.a$activi<-factor(vio.2017.a$activi)
str(vio.2017.a$activi)
levels(vio.2017.a$activi)


## Check categories -  Digitization mistakes  
table(vio.2017.a$activi)

# We don't know what is: # 15, 16, 17, 8) Total of: 127 observations (Missing: 127 observations)
# August 2024, meeting with INS data expert - unknown categories - different surveillance systems during that time.
# Early recollection system not standardized 
# Don't consider them - We will treat them as missing values 

# List of correct categories (as characters)
categorias_correctas <- c("13", "24", "26", "28", "29", "30", "31", "32", "33")

# Reasign the unknown categories as "missing" 
vio.2017.a$activi <- as.character(vio.2017.a$activi)
vio.2017.a$activi <- ifelse(vio.2017.a$activi %in% categorias_correctas, 
                            vio.2017.a$activi, 
                            NA)

# Asign labels to the valid and add the "missings" 

vio.2017.a$activi <- factor(vio.2017.a$activi, 
                            levels = categorias_correctas, 
                            labels = c("Líderes cívicos", "Estudiantes", "Otros", 
                                       "Trabajador/a doméstico", "Persona en situación de prostitución", 
                                       "Campesino/a", "Persona dedicada al cuidado del hogar", "Persona que cuida a otras", "Ninguna"))


# Check the structure
str(vio.2017.a$activi)
levels(vio.2017.a$activi)

# Table to check categories
table(vio.2017.a$activi, useNA = "ifany")


# Missings
is.na(vio.2017.a$activi)
sum(is.na(vio.2017.a$activi))
sum(is.na(vio.2017.a$activi))



# 7.25. "orient.sex" ---- factor 

vio.2017.a$orient.sex<-factor(vio.2017.a$orient.sex)
str(vio.2017.a$orient.sex)
levels(vio.2017.a$orient.sex)

## Check categories -  Digitization mistakes  
table(vio.2017.a$orient.sex)


# List of correct categories (as characters)
categorias_correctas_orient.sex <- c("1", "2", "5", "6")

# Reasign the unknown categories as "missing",  if the case
vio.2017.a$orient.sex <- as.character(vio.2017.a$orient.sex)
vio.2017.a$orient.sex <- ifelse(vio.2017.a$orient.sex %in% categorias_correctas_orient.sex, 
                                vio.2017.a$orient.sex, 
                                NA)

# Asign labels to the valid and add the "missings" 

vio.2017.a$orient.sex <- factor(vio.2017.a$orient.sex, 
                                levels = categorias_correctas_orient.sex, 
                                labels = c("Homosexual", "Bisexual", "Heterosexual",  "Asexual"))




# Table to check categories
table(vio.2017.a$orient.sex,X875_2017_copia$orient_sex, useNA = "ifany")


# Missings

is.na(vio.2017.a$orient.sex)
sum(is.na(vio.2017.a$orient.sex))
sum(is.na(vio.2017.a$orient.sex))


# 7.26. "ident.gen" ---- factor 

vio.2017.a$ident.gen<-factor(vio.2017.a$ident.gen)
str(vio.2017.a$ident.gen)
levels(vio.2017.a$ident.gen)

## Check categories -  Digitization mistakes  
# We don't know what is: # 4, 5) Total of: 1262 observations (Missing: 1262 observations)
table(vio.2017.a$ident.gen,X875_2017_copia$ident_gene, useNA = "ifany")

# List of correct categories (as characters)
categorias_correctas_ident.gen <- c("1", "2", "3")

# Reasign the unknown categories as "missing" 
vio.2017.a$ident.gen <- as.character(vio.2017.a$ident.gen)
vio.2017.a$ident.gen <- ifelse(vio.2017.a$ident.gen %in% categorias_correctas_ident.gen, 
                                vio.2017.a$ident.gen, 
                                NA)

# Asign labels to the valid and add the "missings" 

vio.2017.a$ident.gen <- factor(vio.2017.a$ident.gen, 
                                levels = categorias_correctas_ident.gen, 
                                labels = c("Masculino", "Femenino", "Transgénero"))




# Check the structure
str(vio.2017.a$ident.gen)
levels(vio.2017.a$ident.gen)

# Table to check categories
table(vio.2017.a$ident.gen, useNA = "ifany")


# Missings

is.na(vio.2017.a$ident.gen)
sum(is.na(vio.2017.a$ident.gen))
sum(is.na(vio.2017.a$ident.gen))



# 7.27. "consumo.spa"  --- factor 

vio.2017.a$consumo.spa<-factor(vio.2017.a$consumo.spa)
str(vio.2017.a$consumo.spa)
levels(vio.2017.a$consumo.spa)

vio.2017.a$consumo.spa <-factor(vio.2017.a$consumo.spa, levels=c("1","2"), labels=c("Sí", "No"))
class(vio.2017.a$consumo.spa)
levels(vio.2017.a$consumo.spa)

# Missings
is.na(vio.2017.a$consumo.spa)
sum(is.na(vio.2017.a$consumo.spa))
sum(is.na(vio.2017.a$consumo.spa))


# 7.28. "jefe.h" ---- factor 

vio.2017.a$jefe.h<-factor(vio.2017.a$jefe.h)
str(vio.2017.a$jefe.h)
levels(vio.2017.a$jefe.h)

vio.2017.a$jefe.h<-factor(vio.2017.a$jefe.h, levels=c("1","2"), labels=c("Sí", "No"))
class(vio.2017.a$jefe.h)
levels(vio.2017.a$jefe.h)

# Missings
is.na(vio.2017.a$jefe.h)
sum(is.na(vio.2017.a$jefe.h))
sum(is.na(vio.2017.a$jefe.h))


# 7.29.  "antec.vio" --- factor 

vio.2017.a$antec.vio <-factor(vio.2017.a$antec.vio)
str(vio.2017.a$antec.vio)
levels(vio.2017.a$antec.vio)

vio.2017.a$antec.vio <-factor(vio.2017.a$antec.vio, levels=c("1","2"), labels=c("Sí", "No"))
class(vio.2017.a$antec.vio)
levels(vio.2017.a$antec.vio)

# Missings
is.na(vio.2017.a$antec.vio)
sum(is.na(vio.2017.a$antec.vio))
sum(is.na(vio.2017.a$antec.vio))

# 7.30.   "oh.otros" --- factor 

vio.2017.a$oh.otros <-factor(vio.2017.a$oh.otros)
str(vio.2017.a$oh.otros)
levels(vio.2017.a$oh.otros)

vio.2017.a$oh.otros <-factor(vio.2017.a$oh.otros, levels=c("1","2"), labels=c("Sí", "No"))
class(vio.2017.a$oh.otros)
levels(vio.2017.a$oh.otros)

# Missings
is.na(vio.2017.a$oh.otros)
sum(is.na(vio.2017.a$oh.otros))
sum(is.na(vio.2017.a$oh.otros))


# 7.31. "sexo.agre"  ----- 


vio.2017.a$sexo.agre <-factor(vio.2017.a$sexo.agre)
str(vio.2017.a$sexo.agre)
levels(vio.2017.a$sexo.agre)


# Categories:  I: Intersexual, SD: Indeterminado, F: Femenino,  M: Masculino

vio.2017.a$sexo.agre <-factor(vio.2017.a$sexo.agre, levels=c( "F", "M", "SD", "I"), 
                              labels=c( "Femenino", "Masculino", "Indeterminado", "Indeterminado"
                              ))


# Table to check categories
table(vio.2017.a$sexo.agre, useNA = "ifany")


# Missings

is.na(vio.2017.a$sexo.agre)
sum(is.na(vio.2017.a$sexo.agre))
sum(is.na(vio.2017.a$sexo.agre))


# 7.32. "rel.fami"  

vio.2017.a$rel.fami <-factor(vio.2017.a$rel.fami)
str(vio.2017.a$rel.fami)
levels(vio.2017.a$rel.fami)

## Check categories -  Digitization mistakes
table(vio.2017.a$rel.fami, useNA = "ifany")


# We don't know  a lot of categories - 

# List of correct categories (as characters)
categorias_correctas_rel.fami <- c("9", "10", "22", "23", "24", "25")

# Reasign the unknown categories as "missing" 
vio.2017.a$rel.fami <- as.character(vio.2017.a$rel.fami)
vio.2017.a$rel.fami <- ifelse(vio.2017.a$rel.fami %in% categorias_correctas_rel.fami, 
                               vio.2017.a$rel.fami, 
                               NA)

# Asign labels to the valid and add the "missings" 

vio.2017.a$rel.fami <- factor(vio.2017.a$rel.fami, 
                               levels = categorias_correctas_rel.fami, 
                               labels = c("Padre", "Madre", "Pareja", 
                                          "Ex-pareja", "Familiar",  
                                          "Ninguna"))


# Check the structure
str(vio.2017.a$rel.fami)
levels(vio.2017.a$rel.fami)

# Table to check categories
table(vio.2017.a$rel.fami, useNA = "ifany")


# Missings
is.na(vio.2017.a$rel.fami)
sum(is.na(vio.2017.a$rel.fami))
sum(is.na(vio.2017.a$rel.fami))


# 7.33. "conv.agre"  --- factor 

vio.2017.a$conv.agre<-factor(vio.2017.a$conv.agre)
str(vio.2017.a$conv.agre)
levels(vio.2017.a$conv.agre)

vio.2017.a$conv.agre<-factor(vio.2017.a$conv.agre, levels=c("1","2"), labels=c("Sí", "No"))
class(vio.2017.a$conv.agre)
levels(vio.2017.a$conv.agre)


# Table to check categories
table(vio.2017.a$conv.agre,X875_2017_copia$conv_agre, useNA = "ifany")

# Missings - There's missing values 

is.na(vio.2017.a$conv.agre)
sum(is.na(vio.2017.a$conv.agre))
sum(is.na(vio.2017.a$conv.agre))


# 7.34. "r.no.flia"   --- factor 

vio.2017.a$ r.no.flia <-factor(vio.2017.a$ r.no.flia )
str(vio.2017.a$ r.no.flia)
levels(vio.2017.a$ r.no.flia)

vio.2017.a$r.no.flia<-factor(vio.2017.a$ r.no.flia, levels=c(    "1", "2", "3", 
                                                                 "4", "6", "7", 
                                                                 "8", "10", "11", 
                                                                 "12", "13"), 
                                
                                labels=c("Profesor/a", "Amigo/a", "Compañero/a de trabajo", 
                                         "Compañero/a de estudio", "Desconocido/a", "Vecino/a", 
                                         "Conocido/a sin ningún trato" , "Otro/a", "Jefe/a", 
                                         "Sacerdote/pastor/a", "Servidor/a público/a"))
# Missings
is.na(vio.2017.a$r.no.flia)
sum(is.na(vio.2017.a$r.no.flia))
sum(is.na(vio.2017.a$r.no.flia))


# Table to check categories
table(vio.2017.a$r.no.flia, useNA = "ifany")


# 7.35.  "zona.conf.arm" ---factor 

vio.2017.a$zona.conf.arm<-factor(vio.2017.a$zona.conf.arm)
str(vio.2017.a$zona.conf.arm)
levels(vio.2017.a$zona.conf.arm)

vio.2017.a$zona.conf.arm<-factor(vio.2017.a$zona.conf.arm, levels=c("1","2"), labels=c("Sí", "No"))
class(vio.2017.a$zona.conf.arm)
levels(vio.2017.a$zona.conf.arm)

# Missings
is.na(vio.2017.a$zona.conf.arm)
sum(is.na(vio.2017.a$zona.conf.arm))
sum(is.na(vio.2017.a$zona.conf.arm))


# 7.36.  "mecanismo" --- factor

vio.2017.a$mecanismo <-factor(vio.2017.a$mecanismo )
str(vio.2017.a$mecanismo)
levels(vio.2017.a$mecanismo)

vio.2017.a$mecanismo<-factor(vio.2017.a$mecanismo, levels=c(      "1", "2", "3", 
                                                                  "4", "11", "12", 
                                                                  "13", "14", "15", 
                                                                  "16"), 
                               
                               labels=c("Ahorcamiento, estrangulamiento, sofocación", "Caídas", 
                                        "Contundente, cortocontundente","Cortante, cortopunzante, punzante", "Proyectil arma de fuego", "Quemaduras por fuego o llamas", 
                                        "Quemaduras por ácido, álcalis o sustancias corrosivas", "Quemaduras por líquido hirviente" , "Otros mecanismos", 
                                       "Sustancias de uso doméstico que causen irritación"))

# Table to check categories
table(vio.2017.a$mecanismo, useNA = "ifany")


# Missings
is.na(vio.2017.a$mecanismo)
sum(is.na(vio.2017.a$mecanismo))
sum(is.na(vio.2017.a$mecanismo))



# 7.37. "fech.hech"  --- Must be a date: year, month, day (ymd) it has the hours, I have to renove them, not useful 

# Convert the column to a format with date and hour: ymd_hms
vio.2017.a$fech.hech <- ymd_hms(vio.2017.a$fech.hech) 

# Then I have to remove the hours
vio.2017.a$fech.hech <- as.Date(vio.2017.a$fech.hech)

# Now check the rest 
class(vio.2017.a$fech.hech)
str(vio.2017.a$fech.hech)

# Missings
is.na(vio.2017.a$fech.hech)
sum(is.na(vio.2017.a$fech.hech))
sum(is.na(vio.2017.a$fech.hech))



# 7.38.  "escena"  ---- factor

vio.2017.a$escena<-factor(vio.2017.a$escena)
str(vio.2017.a$escena)
levels(vio.2017.a$escena)

vio.2017.a$escena <-factor(vio.2017.a$escena, levels=c(    "1", "2", "3", 
                                                            "4", "7", "8", 
                                                            "9", "10", "11", 
                                                            "12"),
                            
                            labels=c("Vía pública","Vivienda", "Establecimiento educativo", 
                                     "Lugar de trabajo","Otro", "Comercio y áreas de servicios (tiendas y centros comerciales)", 
                                     "Otros espacios abiertos","Lugar de esparcimiento con expendio de alcohol", 
                                     "Institución de salud", "Área deportiva y recreativa" ))
# Missings
is.na(vio.2017.a$escena)
sum(is.na(vio.2017.a$escena))
sum(is.na(vio.2017.a$escena))



# Table to check categories
table(vio.2017.a$escena,X875_2017_copia$escenario,useNA = "ifany")


####### Save new database "vio.2017.a"

save(vio.2017.a, file = "vio.2017.a.Rds")
save(vio.2017.a, file = "vio.2017.a.RData")


########################################################################
## NOTE: The same cleaning and preprocessing pipeline was applied     ##
##       to the datasets from 2017 to 2022, using equivalent steps:   ##
##       - Import and inspection                                       ##
##       - Variable selection and renaming                             ##
##       - Type conversion and labeling                                ##
##       - Handling of missing and unknown categories                  ##
##       - Export of cleaned datasets                                  ##
##                                                                    ##
##       Only variable names and structures were adjusted if needed   ##
##       to accommodate small yearly differences in data layout.      ##
########################################################################


