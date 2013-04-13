module.exports = 

    getTile: (id) -> 

        length: 500  # arbitrary 'real' length of side
        count:  4    # count of readings along side
        
        elevations: [

            100, 0, 0, 0
            0,   0, 0, 0
            0,   0, 0, 0
            0,   0, 0, -100

        ]
