
Tiles from [here](http://dds.cr.usgs.gov/srtm/version2_1)


### SRTM3 summary

[of this](http://dds.cr.usgs.gov/srtm/version2_1/Documentation/SRTM_Topo.pdf)

* 3arc second resolution
* each tile spans 1 degree
* elevation in meters
* row major
* signed int16
* big endian

```bash

wget http://dds.cr.usgs.gov/srtm/version2_1/SRTM3/Africa/S33E018.hgt.zip
wget http://dds.cr.usgs.gov/srtm/version2_1/SRTM3/Africa/S34E018.hgt.zip

unzip S33E018.hgt.zip 
unzip S34E018.hgt.zip 

```