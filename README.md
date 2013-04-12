srtm
====

play with [SRTM](http://en.wikipedia.org/wiki/Shuttle_Radar_Topography_Mission) terrain data

### setup

* clone this repo `git clone git@github.com:nomilous/srtm.git && cd srtm`
* [download and unzip the tiles](https://github.com/nomilous/srtm/tree/master/tiles)

```bash

#
# start server
# 

./server


#
# start dev runtime - [nez](https://github.com/nomilous/nez)
# 
# - assumes coffee-script installed globally
#   
#   sudo npm install coffee-script -g
#    
# - compiles serverside changes from ./src to ./lib
# - does not restart server after changes (yet)
#

./objective

```


### client

in browser

[http://localhost:3000](http://localhost:3000)
