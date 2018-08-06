#libraries 
library("bitops")
library("RCurl")
library("heavyRain")
library("devtools")
library("heavyRain")
install_github("environmentalinformatics-marburg/chirps")
library(here)





rm(list = ls())

#Download CHIRPS data 
chirps <- getCHIRPS("africa", tres = "monthly"
                 , format = "tifs" 
                 ,begin = as.Date("1982-01-01")
                 , end = as.Date("1983-12-31")
                 , dsn = file.path(getwd(), "data"))


#Separte_backsla
#@param x is name of directory
#@return the name file
open_file <- function(x)
{
  name_file <- sub(".*/", "", x)
  file <- gsub(".gz", "", name_file)
  #open_file <- paste0(getwd(), "/", name_file)
  prec <- raster::stack(paste0(getwd))
  return(file )
}

open_file <- function(x)
{
  prec <- raster::stack(x)
  return(prec)
}





files <- lapply(chirps,separte_backsla)
name_file <- paste0(getwd(), "/")


prec <- raster::stack("//dapadfs/data_cluster_4/observed/gridded_products/chirps/daily/32bits/chirps-v2.0.2018.03.31.tif")

cor <- raster::extract(prec, y= data.frame(x=-76.3566666666666, y =3.50472220000000  ))