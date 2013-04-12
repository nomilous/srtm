app = angular.module 'SRTM', []

app.config ($routeProvider) -> 

    $routeProvider.when '/',

        controller: srtm.MainController
        templateUrl: 'main_controller.html'

    $routeProvider.otherwise 

        redirectTo: '/'