'use strict'

describe "PhoneCat controllers" !->

  beforeEach !->
    chai.Assertion.addMethod 'equalData' (matcher) ->
      @assert angular.equals @_obj, matcher

  beforeEach module "phonecatApp"
  beforeEach module 'phonecatServices'

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
      expect scope.phones .to.be.equalData []
      $httpBackend.flush!

      expect(scope.phones).to.be.equalData [
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

    beforeEach inject (_$httpBackend_, $rootScope, $stateParams, $controller) !->
      $httpBackend := _$httpBackend_
      $httpBackend.expectGET 'phones/xyz.json' .respond xyzPhoneData!

      $stateParams.phoneId = 'xyz'
      scope := $rootScope.$new!
      ctrl := $controller 'PhoneDetailCtrl' $scope: scope

    it 'should fetch phone detail' !->
      expect scope.phone .to.be.equalData {}
      $httpBackend.flush!

      expect scope.phone .to.be.equalData xyzPhoneData!
