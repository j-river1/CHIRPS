#libraries 
library("bitops")
library("RCurl")
library("heavyRain")
library("devtools")
library("heavyRain")
library("raster")
install_github("environmentalinformatics-marburg/chirps")
library("R.utils")
library(here)


rm(list = ls())

#Variables
star_date <- c("1982-01-01")
end_date <- c("1982-12-31")
continente <- c("africa")
#x= longitude, y= latitude;
y= data.frame(x=36.874260, y =-1.291514)


#Download CHIRPS data 
chirps <- getCHIRPS("africa", tres = "monthly"
                 , format = "tifs" 
                 ,begin = as.Date(star_date)
                 , end = as.Date(end_date)
                 , dsn = file.path(here(), "data"))

#Descompresed files
lapply(chirps, gunzip)

#Separte_backsla
#@param x is name of directory
#@return the name file
open_file <- function(x)
{
  name_file <- sub(".*/", "", x)
  file <- gsub(".gz", "", name_file)
  path <- file.path(here(), "data", file)
  prec <- raster::stack(path)
  cor <- raster::extract(prec, y= data.frame(x=36.874260, y =-1.291514))
  return(cor)
}






files <- lapply(chirps,separte_backsla)
name_file <- paste0(getwd(), "/")


prec <- raster::stack("//dapadfs/data_cluster_4/observed/gridded_products/chirps/daily/32bits/chirps-v2.0.2018.03.31.tif")

cor <- raster::extract(prec, y= data.frame(x=-76.3566666666666, y =3.50472220000000  ))