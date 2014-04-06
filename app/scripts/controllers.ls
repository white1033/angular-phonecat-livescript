'use strict'

angular.module 'phonecatControllers' []
  .controller 'PhoneListCtrl' <[ $scope Phone ]> ++ ($scope, Phone) !->
    $scope.phones = Phone.query!
    $scope.orderProp = 'age'

  .controller 'PhoneDetailCtrl' <[ $scope $stateParams Phone ]> ++ ($scope, $stateParams, Phone) ->
    $scope.phone = Phone.get phoneId: $stateParams.phoneId, (phone) !->
      $scope.mainImageUrl = phone.images.0

    $scope.setImage = (imageUrl) !->
      $scope.mainImageUrl = imageUrl
