namespace 'srtm'

    MainController: ($log, actorService, animateService) -> 


        #
        # insert a 'cube'
        #

        geometry = new THREE.CubeGeometry 200, 200, 200

        material = new THREE.MeshBasicMaterial

            color: 0xff0000
            wireframe: true


        actorService.add

            _id: 'cube'

            object: new THREE.Mesh geometry, material




        #
        # animate it
        #

        animateService.animate -> 

            cube = actorService.get 'cube'
            cube.object.rotation.x += 0.01
            cube.object.rotation.y += 0.02

