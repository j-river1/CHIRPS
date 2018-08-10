#Get info data form CHIRPS
#Juan Camilo Rivera
#9 agosto del 2018

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
install_github("ropensci/plotly")

rm(list = ls())

#Variables
star_date <- c("1981-01-01")
end_date <- c("1981-12-31")
place <- c("global")
#x_lon= longitude, y_lat= latitude;
x_lon = 36.874260
y_lat = -1.291514
y_dat= data.frame(x=x_lon, y = y_lat)


#Download CHIRPS data 
chirps <- getCHIRPS(place, tres = "daily"                    
                    ,format = "tifs" 
                    ,begin = as.Date(star_date)
                    ,end = as.Date(end_date)
                    ,sres = 0.05
                    ,dsn = file.path(here(), "data"))

#Descompresed files
lapply(chirps, gunzip)
lapply(chirps, gunzip)

folder <- lapply(list.files(here("global_data")), function(x){ path <- paste0(file.path(here("global_data")),"/",x)
                                                    return(path)})
lapply(folder, gunzip)



#open_file
open_file <- function(x)
{
  path <- file.path(here(), "global_data", x)
  prec <- raster::stack(path)
  cor <- raster::extract(prec, y= y_dat)
  date <- substr(colnames(cor), 13, 23)
  date <- as.Date(date, format = "%Y.%m.%d")
  table <- data.frame(Date= date, Value = cor[1])
  
  return( table)
}

#Join the files
data <- lapply(list.files(here("global_data")), open_file)
complete_data <- do.call(rbind, data)




lapply(drs, getSplitURL)

for (i  in 1:15)
{
  onl <- RCurl::getURL(drs[1], dirlistonly = TRUE)
}

cl <- parallel::makePSOCKcluster(1L)



