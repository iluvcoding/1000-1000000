library(raster)
library(rgdal)

dates_kh = seq(as.Date("2018-06-01"), as.Date("2018-09-30"), by="days")
doys.kh = strftime(dates_kh, format = "%Y%j")
files.kh <- c()
for(dy in doys.kh)
{
  file.name = paste0("/home/rishu/Projects/1000/10000000/inp_mnt/",dy,".nc")
  files.kh <- c(files.kh, file.name)
}

dates_ra = seq(as.Date("2018-10-01"), as.Date("2019-01-31"), by="days")
doys.ra = strftime(dates_ra, format = "%Y%j")
files.ra <- c()
for(dy in doys.ra)
{
  file.name = paste0("/home/rishu/Projects/1000/10000000/inp_mnt/",dy,".nc")
  files.ra <- c(files.ra, file.name)
}
files.kh <- files.kh[file.exists(files.kh)]
files.ra <- files.ra[file.exists(files.ra)]
r.kh =stack(files.kh)
r.ra =stack(files.ra)
shp.MH = readOGR('/home/rishu/Projects/1000/shapezzz/states/MP_state.shp')
crop.kh = crop(r.kh, shp.MH)
crop.ra = crop(r.ra, shp.MH)

crop.kh[crop.kh > 100] <- NA
crop.ra[crop.ra > 100] <- NA
max.kh <- max(crop.kh, na.rm = T)
max.ra <- max(crop.ra, na.rm = T)
raster::writeRaster(max.kh, '/home/rishu/Projects/1000/10000000/out/kharif_max_ndvi_2018.tif', overwrite=T)
raster::writeRaster(max.ra, '/home/rishu/Projects/1000/10000000/out/Rab_max_ndvi_2018.tif', overwrite=T)


ndvi.ra.2017=raster('/home/rishu/Projects/1000/10000000/out/Rab_max_ndvi_2017.tif')
ndvi.ra.2018=raster('/home/rishu/Projects/1000/10000000/out/Rab_max_ndvi_2018.tif')
ndvi.kh.2017=raster('/home/rishu/Projects/1000/10000000/out/kharif_max_ndvi_2017.tif')
ndvi.kh.2018=raster('/home/rishu/Projects/1000/10000000/out/kharif_max_ndvi_2018.tif')
ndvi.ra.diff = ndvi.ra.2018 - ndvi.ra.2017
ndvi.kh.diff = ndvi.kh.2018 - ndvi.kh.2017
raster::writeRaster(ndvi.ra.diff,'/home/rishu/Projects/1000/10000000/out/Rabi_ndvi_diff_2017-18.tif',, overwrite=T)
raster::writeRaster(ndvi.kh.diff,'/home/rishu/Projects/1000/10000000/out/Kharif_ndvi_diff_2017-18.tif', overwrite = T)

