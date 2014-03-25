# Declare app level module which depends on filters, and services
App = angular.module \app <[ngCookies ngResource app.controllers app.directives app.filters app.services partials ui.router]>

App.config <[$stateProvider $urlRouterProvider $locationProvider]> ++ ($stateProvider, $urlRouterProvider, $locationProvider, config) ->
  $stateProvider
    .state 'todo' do
      url: '/todo'
      template-url: 'partials/todo.html'
      controller: 'TodoCtrl'
    .state 'view1' do
      url: '/view1'
      template-url: 'partials/partial1.html'
    .state 'view2' do
      url: '/view2'
      template-url: 'partials/partial2.html'
  $urlRouterProvider
    .otherwise '/todo'

  # Without serve side support html5 must be disabled.
  $locationProvider.html5Mode false
