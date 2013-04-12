ng = angular.module 'viewport', []

ng.directive 'threeViewport', ($log) -> 

    restrict: 'E'

    compile: (elem, attrs) -> 

        $log.info 'initialize threeViewport at elem:', elem, ' with attrs:', attrs
