angular.module 'phonecatApp' <[ ui.router phonecatControllers partials phonecatFilters phonecatServices ]>
  .config <[ $stateProvider $urlRouterProvider ]> ++ ($stateProvider, $urlRouterProvider) !->
    $urlRouterProvider.otherwise '/phones'

    $stateProvider
      .state 'phone-list' do
        url: '/phones'
        templateUrl: 'partials/phone-list.html'
        controller: 'PhoneListCtrl'
      .state 'phone-detail' do
        url: '/phones/:phoneId'
        templateUrl: 'partials/phone-detail.html'
        controller: 'PhoneDetailCtrl'
