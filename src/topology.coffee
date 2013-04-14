fs    = require 'fs'
tiles = {}

topology =

    getTile: (path, id, callback) -> 

        if tiles[id]

            callback null, tiles[id]
            return


        topology.readTile path, id, callback


    readTile: (path, id, callback) -> 

        file   = path + '/' + id + '.hgt'

        fs.readFile file, (err, buf) -> 

            step       = 2
            readings   = buf.length / step
            count      = Math.sqrt readings
            elevations = []
            offset     = 0


            #
            # pull 256x256 square from tile
            # 

            side  = 255
            start = 1201 - side - 1

           
            for row in [start..1200]

                for col in [400..400+side]

                    offset = row * count + col
                    elevation = buf.readInt16BE offset * 2
                    elevations.push elevation


            #
            # too much to render
            #

            # try
            #     while true
            #         elevation = buf.readInt16BE offset
            #         elevations.push elevation
            #         offset += step

            # catch error

            #     callback error, [] unless error.message == 'Trying to read beyond buffer length'

            console.log 'count;', Math.sqrt elevations.length

            tiles[id] = 

                length:     12000
                count:      Math.sqrt elevations.length
                elevations: elevations

            callback null, tiles[id]


            # callback null
            #     length: 2000  # arbitrary 'real' length of side
            #     count:  5    # count of readings along side
            #     elevations: [
            #         0, 0, 0, 0, 0
            #         0, 0, 0, 0, 0
            #         0, 0, 500, 0, 0
            #         0, 0, 0, 0, 0
            #         0, 0, 0, 0, 0
            #     ]

module.exports = topology