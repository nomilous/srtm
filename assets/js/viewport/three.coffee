ng = angular.module 'viewport', [], ($provide) -> 


#
# Scene (service factory)
#

Scene = ($log) -> 

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


FirstPerson = ($log) -> 

    return {

        init: -> 

            $log.info 'init FirstPerson with', arguments

    }


ng.factory 'scene', Scene
ng.factory 'firstPerson', FirstPerson



ng.directive 'threeViewport', ($log, scene, firstPerson) -> 

    restrict: 'E'

    compile: (elem, attrs) -> 

        $log.info 'compile threeViewport'

        scene.init elem, attrs
        firstPerson.init elem, attrs
