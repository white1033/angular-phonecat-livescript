'use strict'

describe "PhoneCat controllers" !->

  beforeEach module "phonecatApp"

  describe "PhoneListCtrl" (,) !->
    var scope, ctrl, $httpBackend

    beforeEach inject (_$httpBackend_, $rootScope, $controller) !->
      $httpBackend := _$httpBackend_
      $httpBackend.expectGET 'phones/phones.json' .respond [
        {name: 'Nexus S'}
        {name: 'Motorola DROID'}
      ]
      scope := $rootScope.$new!
      ctrl := $controller "PhoneListCtrl" $scope: scope

    it 'should create "phones" model with 2 phones fetched from xhr' !->
      expect scope.phones .to.be.undefined
      $httpBackend.flush!

      expect scope.phones .to.eql [
        {name: 'Nexus S'}
        {name: 'Motorola DROID'}
      ]

    it 'should set the default value of orderProp model' !->
      expect scope.orderProp .to.equal 'age'

  describe 'PhoneDetailCtrl' (,) !->
    var scope, $httpBackend, ctrl
    xyzPhoneData = ->
      name: 'phone xyz'
      images:
        'image/url1.png'
        'image/url2.png'

    beforeEach inject (_$httpBackend_, $rootScope, $routeParams, $controller) !->
      $httpBackend := _$httpBackend_
      $httpBackend.expectGET 'phones/xyz.json' .respond xyzPhoneData!

      $routeParams.phoneId = 'xyz'
      scope := $rootScope.$new!
      ctrl := $controller 'PhoneDetailCtrl' $scope: scope

    it 'should fetch phone detail' !->
      expect scope.phone .to.be.undefined
      $httpBackend.flush!

      expect scope.phone .to.eql xyzPhoneData!
