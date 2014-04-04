'use strict'

angular.module 'phonecatControllers' []
  .controller 'PhoneListCtrl' <[ $scope $http ]> ++ ($scope, $http) !->
    $http.get 'phones/phones.json' .success (data) ->
      $scope.phones = data

    $scope.orderProp = 'age'

  .controller 'PhoneDetailCtrl' <[ $scope $routeParams $http ]> ++ ($scope, $routeParams, $http) ->
    $http.get "phones/#{$routeParams.phoneId}.json" .success (data) !->
      $scope.phone = data
      $scope.mainImageUrl = data.images.0

    $scope.setImage = (imageUrl) !->
      $scope.mainImageUrl = imageUrl
