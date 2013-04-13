namespace 'srtm'

    MainController: ($log, $http, actorService, animateService) -> 

        $http.get('/topology/S34E018').success (tile) -> 

            material = new THREE.LineBasicMaterial color: 0x000000

            step     = tile.length * 1.0 / tile.count
            rowStart = -step * (tile.count - 1) / 2
            colStart = rowStart

            #
            # render as line for each row
            # on the XZ plane (Y as elevation)
            #

            z = colStart

            for row in [0..tile.count-1]

                geometry = new THREE.Geometry()

                x = rowStart

                for col in [0..tile.count-1]

                    offset = row * tile.count  

                    height = tile.elevations[offset + col]

                    geometry.vertices.push new THREE.Vector3 x, height, z
                    
                    x += step

                z += step

                line = new THREE.Line geometry, material

                actorService.add

                    _id: 'row' + row
                    object: line


        #
        # animate it
        #

        animateService.animate -> 


