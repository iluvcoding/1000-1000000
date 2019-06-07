library(raster)
library(rgdal)
ndvi_diff = raster('/home/rishu/Projects/1000/10000000/out/Rabi_ndvi_diff_2017-18.tif')
slope = raster('/home/rishu/Projects/1000/10000000/out/slope/ra_rapeseed_and_mustard_slope.tif')
yield_change = ndvi_diff * slope * 10
MP.shp = readOGR('/home/rishu/Projects/1000/shapezzz/districts/MP_dist.shp')
mean_yield_change = extract(x=yield_change, y=MP.shp, fun=mean, df=TRUE)
mean_yield_change$DISTRICT = MP.shp$DISTRICT
new_shp = merge(MP.shp,mean_yield_change, by='DISTRICT',duplicateGeoms = TRUE)
shapefile(new_shp, '/home/rishu/Projects/1000/10000000/out/final/ra_rapeseed_and_mustard_yield_change.shp',overwrite=TRUE)






