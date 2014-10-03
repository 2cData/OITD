# Data files
# http://www.ars.usda.gov/Services/docs.htm?docid=24912

#United States Department of Agriculture
#National Nutrient Database for Standard Reference
#http://ndb.nal.usda.gov/ndb/

#http://www.ars.usda.gov/SP2UserFiles/Place/12354500/Data/SR27/sr27_doc.pdf
#pg 32 of src_27.pdf describes files

#                   Table Name      # of records
# Food Description  FOOD_DES        8,618
# Nutrient Data     NUT_DATA        654,572
# Weight            WEIGHT          15,228
# Food Group Desc   FD_GROUP        25


# FOOD_DES links to 
#   FD_GROUP by FdGrp_Cd field
#   NUT_DATA by NDB_No field
#   WEIGHT by NDB_No field 

# ASCII Files are delimited
# fields are separated by carets (^)
# text fields are surrounded by tilde (~)
# a double caret (^^) or two carets and two tildes (~~) are used when the field is null or blank

# Dietary Reference Intake Tables
# http://fnic.nal.usda.gov/dietary-guidance/dietary-reference-intakes/dri-tables
# These PDF files are generate from the 


# multi vitamins

library(dplyr)
library(assertthat) # correctedness checks

setwd("/home/dave/workspace/OITD")

foodDesciption <- fread("data/FOOD_DES.txt", sep="^", stringsAsFactors = FALSE)


foodDesciption <- read.table('./data/FOOD_DES.txt', stringsAsFactors = FALSE)

colClasses <- c(col)
colnames <- c('NDB_No', 'FdGrp_Cd', 'Long_Desc', 'Shrt_Desc', 'ComName', 'ManufacName', 'Survey', 'Ref_desc', 'Refuse', 'SciName', 'N_Factor', 'Pro_Factor', 'Fat_Factor', 'CHO_Factor')   

foodDescription <- read.table('data/FOOD_DES.txt', 
           header = FALSE, 
           sep = "^", 
           quote = "~",
           col.names  = c("NDB_No",     "FdGrp_Cd", "Long_Desc", "Shrt_Desc", "ComName",  "ManufacName", "Survey",    "Ref_desc",  "Refuse", "SciName",    "N_Factor", "Pro_Factor", "Fat_Factor", "CHO_Factor"), 
           colClasses = c("character", "character", "character", "character", "character", "character",  "character", "character", "numeric", "character", "numeric",  "numeric",     "numeric",   "numeric"),                                                                           
           nrows = 8618,
           stringsAsFactors = FALSE
        )


assert_that(nrow(foodDescription) == 8618)
# Food Description  FOOD_DES        8,618


# Nutrient Data     NUT_DATA        654,572
# Weight            WEIGHT          15,228
# Food Group Desc   FD_GROUP        25
