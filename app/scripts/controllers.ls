'use strict'

angular.module 'phonecatApp' []
  .controller 'PhoneListCtrl' ($scope) !->
    $scope.phones =
      * name: 'Nexus S'
        snippet: 'Motorola XOOM™ with Wi-Fi'
      * name: 'Motorola XOOM™ with Wi-Fi'
        snippet: 'The Next, Next Generation tablet.'
      * name: 'MOTOROLA XOOM™'
        snippet: 'The Next, Next Generation tablet.'
