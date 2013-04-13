ng = angular.module 'viewport', [], ($provide) -> 


SceneService = ($log) -> 

    scene = _scene =

        scene: new THREE.Scene()

        init: (elem, attrs) -> 

            #
            # set renderer type from directive
            # 
            # <three-viewport renderer-type="CanvasRenderer" /> 
            #

            type = attrs.rendererType || 'CanvasRenderer'
            scene.renderer = new THREE[type]()
            scene.renderer.setSize elem[0].clientWidth, elem[0].clientHeight

            elem[0].appendChild scene.renderer.domElement


        add: (object) ->

             scene.scene.add object


ActorService = ($log, sceneService) -> 

    actors = {}

    service = _service = 

        init: (elem, attrs) -> 

        add: (name, object) -> 

            sceneService.add object
            actors[name] = object

        get: (name) -> 

            return actors[name]


FirstPersonService = ($log, sceneService) -> 

    firstPerson = _firstPerson =

        init: (elem, attrs) -> 

            #
            # TODO: different cams have different construction args
            #

            type   = attrs.cameraType  || 'PerspectiveCamera'
            fov    = parseInt attrs.fieldOfView || 75
            aspect = elem[0].clientWidth / elem[0].clientHeight
            near   = parseInt attrs.nearClip    || 1
            far    = parseInt attrs.farClip     || 10000

            firstPerson.camera = new THREE[type] fov, aspect, near, far

            firstPerson.camera.position.z = 1000


AnimateService = ($log, sceneService, actorService, firstPersonService) -> 

    animate = _animate = 

        init: (elem, attrs) -> 

        loop: -> 

            cube = actorService.get 'cube'       
            cube.rotation.x += 0.01
            cube.rotation.y += 0.02

            requestAnimationFrame animate.loop
            sceneService.renderer.render sceneService.scene, firstPersonService.camera



ng.factory 'sceneService',       SceneService
ng.factory 'actorService',       ActorService
ng.factory 'firstPersonService', FirstPersonService
ng.factory 'animateService',     AnimateService


ng.directive 'threeViewport', ($log, sceneService, actorService, firstPersonService, animateService) -> 

    restrict: 'E'

    compile: (elem, attrs) -> 

        $log.info 'compile threeViewport'

        sceneService.init elem, attrs
        actorService.init elem, attrs
        firstPersonService.init elem, attrs
        animateService.init elem, attrs

        geometry = new THREE.CubeGeometry 200, 200, 200
        material = new THREE.MeshBasicMaterial 
            color: 0xff0000
            wireframe: true
        cube     = new THREE.Mesh geometry, material

        actorService.add 'cube', cube

        animateService.loop()
