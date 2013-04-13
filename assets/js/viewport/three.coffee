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

            $log.info 'init Scene with', arguments


            #
            # set renderer type from directive
            # 
            # <three-viewport renderer="CanvasRenderer" /> 
            #

            type = attrs.renderer || 'CanvasRenderer'
            scene.renderer = new THREE[type]()


            #
            # append THREE canvas into the directive
            #

            elem[0].appendChild scene.renderer.domElement


        add: (object) ->

             threeScene.add object

    return scene


FirstPersonService = ($log, sceneService) -> 

    return {

        init: (elem, attrs) -> 

            $log.info 'init FirstPerson with', arguments

    }


ng.factory 'sceneService', SceneService
ng.factory 'firstPersonService', FirstPersonService



ng.directive 'threeViewport', ($log, sceneService, firstPersonService) -> 

    restrict: 'E'

    compile: (elem, attrs) -> 

        $log.info 'compile threeViewport'

        sceneService.init elem, attrs
        firstPersonService.init elem, attrs

