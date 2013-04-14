namespace 'srtm'

    MainController: ($log, $http, actorService, animateService) -> 

        $http.get('/topology/S34E018').success (tile) -> 


            light = new THREE.PointLight 0xffffff, 1, 10000
            light.position.set 2000, 2000, 2000

            actorService.add

                    _id: 'light'
                    object: light


            width = tile.count
            depth = tile.count

            scale = tile.length / tile.count

            #
            # create flat plane then adjust heights and scale horizontal plane
            #

            geometry = new THREE.PlaneGeometry width, depth, width - 1, depth - 1

            i = 0
            for vertex in geometry.vertices

                vertex.z = tile.elevations[ i++ ]
                vertex.x *= scale
                vertex.y *= scale


                

            topology = new THREE.Mesh geometry, new THREE.MeshLambertMaterial color: 0xffffff

            actorService.add

                    _id: 'topology'
                    object: topology

            # material = new THREE.LineBasicMaterial color: 0x000000

            # step     = tile.length * 1.0 / tile.count
            # rowStart = -step * (tile.count - 1) / 2
            # colStart = rowStart

            # #
            # # render as line for each row
            # # on the XZ plane (Y as elevation)
            # #

            # z = colStart

            # for row in [0..tile.count-1]

            #     geometry = new THREE.Geometry()

            #     x = rowStart

            #     for col in [0..tile.count-1]

            #         offset = row * tile.count  

            #         height = tile.elevations[offset + col]

            #         geometry.vertices.push new THREE.Vector3 x, height, z
                    
            #         x += step

            #     z += step

            #     line = new THREE.Line geometry, material

            #     actorService.add

            #         _id: 'row' + row
            #         object: line


        #
        # animate it
        #

        animateService.animate -> 


