fs    = require 'fs'
tiles = {}

topology =

    getTile: (path, id, callback) -> 

        callback null, tiles[id] if tiles[id]

        topology.readTile path, id, callback


    readTile: (path, id, callback) -> 

        file   = path + '/' + id + '.hgt'

        fs.readFile file, (err, buf) -> 

            step       = 2
            readings   = buf.length / step
            count      = Math.sqrt readings
            elevations = []
            offset     = 0 

            try

                while true

                    elevation = buf.readInt16BE offset
                    elevations.push elevation
                    offset += step

            catch error

                callback error, [] unless error.message == 'Trying to read beyond buffer length'


            callback null

                length:     5000
                count:      count
                elevations: elevations


            # callback null
            #     length: 500  # arbitrary 'real' length of side
            #     count:  4    # count of readings along side
            #     elevations: [
            #         100, 0, 0, 0
            #         0,   0, 0, 0
            #         0,   0, 0, 0
            #         0,   0, 0, -100
            #     ]

module.exports = topology