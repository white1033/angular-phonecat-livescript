'use strict'

describe "PhoneCat controllers" !->

  describe "PhoneListCtrl" (,) !->
    var scope, ctrl, $httpBackend
    beforeEach module "phonecatApp"

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
