library(raster)
library(rgdal)

dates_kh = seq(as.Date("2018-06-01"), as.Date("2018-09-30"), by="days")
doys.kh = strftime(dates_kh, format = "%Y%m%d")
files.kh <- c()
for(dy in doys.kh)
{
  file.name = paste0("/home/rishu/Projects/1000/10000000/data_mnt/",dy,".nc")
  files.kh <- c(files.kh, file.name)
}
dates_ra = seq(as.Date("2018-10-01"), as.Date("2019-01-31"), by="days")
doys.ra = strftime(dates_ra, format = "%Y%m%d")
files.ra <- c()
for(dy in doys.ra)
{
  file.name = paste0("/home/rishu/Projects/1000/10000000/data_mnt/",dy,".nc")
  files.ra <- c(files.ra, file.name)
}
files.kh <- files.kh[file.exists(files.kh)]
files.ra <- files.ra[file.exists(files.ra)]
r.kh =stack(files.kh)
r.ra =stack(files.ra)
r.ra[r.ra > 100] <- NA
mean.kh <- mean(, )
mean.ra <- mean(r.ra)

