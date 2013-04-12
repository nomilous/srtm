ng = angular.module 'viewport', []

ng.factory 'scene', ($log) -> 

    $log.info 'initialize scene service'
    

ng.factory 'firstPerson', ($log) -> 

    $log.info 'initialize firstPerson service'


ng.directive 'threeViewport', ($log, scene, firstPerson) -> 

    restrict: 'E'

    compile: (elem, attrs) -> 

        $log.info 'initialize threeViewport at elem:', elem, ' with attrs:', attrs
