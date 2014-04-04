'use strict'

angular.module 'phonecatControllers' []
  .controller 'PhoneListCtrl' <[ $scope $http ]> ++ ($scope, $http) !->
    $http.get 'phones/phones.json' .success (data) ->
      $scope.phones = data

    $scope.orderProp = 'age'

  .controller 'PhoneDetailCtrl' <[ $scope $routeParams ]> ++ ($scope, $routeParams) ->
    $scope.phoneId = $routeParams.phoneId
