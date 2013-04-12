
Tiles from [here](http://dds.cr.usgs.gov/srtm/version2_1)


### SRTM3 summary

[of this](http://dds.cr.usgs.gov/srtm/version2_1/Documentation/SRTM_Topo.pdf)

* 3arc second resolution
* each tile spans 1 degree square
* row major
* 1201 rows of 1201 samples
* elevation in meters
* signed int16
* big endian

Server will be looking for these tiles specifially (in this directory)

```bash

cd ./tiles

wget http://dds.cr.usgs.gov/srtm/version2_1/SRTM3/Africa/S33E018.hgt.zip
wget http://dds.cr.usgs.gov/srtm/version2_1/SRTM3/Africa/S34E018.hgt.zip

unzip S33E018.hgt.zip 
unzip S34E018.hgt.zip 

```
