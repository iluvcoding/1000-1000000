library(raster)
library(rgdal)
# Kharif(Jowar)
# Kharif(Rice)
# Rabi(Wheat)
# Rabi(Rapeseed & Mustard)
kh.jowar.file = "/home/rishu/Projects/1000/10000000/csv_mnt/Jowar/03_Kharif_season_correlation_computed.csv"
kh.rice.file = "/home/rishu/Projects/1000/10000000/csv_mnt/Rice/03_Kharif_season_correlation_computed.csv"
ra.wheat.file = "/home/rishu/Projects/1000/10000000/csv_mnt/Wheat/03_Rabi_season_correlation_computed.csv"
ra.r_and_m.file = "/home/rishu/Projects/1000/10000000/csv_mnt/Rapeseed &Mustard/03_Rabi_season_correlation_computed.csv"
kh.soya.file = "/home/rishu/Projects/1000/10000000/csv_mnt/Soyabean/03_Kharif_season_correlation_computed.csv"
kh.soya = as.data.frame(read.csv(kh.soya.file))

kh.jowar <- as.data.frame(read.csv(kh.jowar.file))
kh.rice <- as.data.frame(read.csv(kh.rice.file))
ra.wheat <- as.data.frame(read.csv(ra.wheat.file))
ra.r_and_m <- as.data.frame(read.csv(ra.r_and_m.file))

kh.soya = kh.soya[kh.soya$State_Name == "Madhya Pradesh",]
kh.jowar = kh.jowar[kh.jowar$State_Name == "Madhya Pradesh",]
kh.rice = kh.rice[kh.rice$State_Name == "Madhya Pradesh",]
ra.wheat = ra.wheat[ra.wheat$State_Name == "Madhya Pradesh",]
ra.r_and_m = ra.r_and_m[ra.r_and_m$State_Name == "Madhya Pradesh",]

mp.dist.shp = readOGR("/home/rishu/Projects/1000/shapezzz/districts/MP_dist.shp")
index <- which(is.na(kh.jowar$Slope)==FALSE)
kh.jowar = kh.jowar[index,c(4,16)]
colnames(kh.jowar)[1] <- "DISTRICT"
kh.jowar$DISTRICT = tolower(kh.jowar$DISTRICT)
mp.dist.shp$DISTRICT = tolower(mp.dist.shp$DISTRICT)
districts_kh_jowar<- merge(mp.dist.shp, kh.jowar, by='DISTRICT',duplicateGeoms = TRUE)
shapefile(districts_kh_jowar,'/home/rishu/Projects/1000/10000000/out/shp/kh_jowar.shp',overwrite=TRUE)
