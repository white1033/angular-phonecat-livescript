angular.module 'phonecatApp' <[ ngRoute phonecatControllers partials phonecatFilters ]>
  .config <[ $routeProvider ]> ++ ($routeProvider) !->
    $routeProvider
      .when '/phones' do
        templateUrl: 'partials/phone-list.html'
        controller: 'PhoneListCtrl'
      .when '/phones/:phoneId' do
        templateUrl: 'partials/phone-detail.html'
        controller: 'PhoneDetailCtrl'
      .otherwise redirectTo: '/phones'
