app = angular.module 'SRTM', ['viewport']

app.config ($routeProvider) -> 

    $routeProvider.when '/',

        controller: srtm.MainController
        templateUrl: 'main_controller.html'

    $routeProvider.otherwise 

        redirectTo: '/'