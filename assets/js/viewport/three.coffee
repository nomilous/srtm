ng = angular.module 'viewport', [], ($provide) -> 


#
# Scene (service factory)
#

SceneService = ($log) -> 

    threeScene = new THREE.Scene()

    #
    # double tap to gain access to self in definition.
    #

    scene = _scene =

        init: (elem, attrs) -> 

            #
            # set renderer type from directive
            # 
            # <three-viewport renderer-type="CanvasRenderer" /> 
            #

            type = attrs.rendererType || 'CanvasRenderer'
            scene.renderer = new THREE[type]()


            #
            # append THREE canvas into the directive
            #

            elem[0].appendChild scene.renderer.domElement


        add: (object) ->

             threeScene.add object

    return scene


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

            $log.info 'init camera:'

                type: type
                fov: fov
                aspect: aspect
                nearClip: near 
                farClip: far

            firstPerson.camera = new THREE[type] fov, aspect, near, far

            #
            # insert camera into scene
            #

            sceneService.add firstPerson.camera

    return firstPerson


ng.factory 'sceneService', SceneService
ng.factory 'firstPersonService', FirstPersonService


ng.directive 'threeViewport', ($log, sceneService, firstPersonService) -> 

    restrict: 'E'

    compile: (elem, attrs) -> 

        $log.info 'compile threeViewport'

        sceneService.init elem, attrs
        firstPersonService.init elem, attrs

