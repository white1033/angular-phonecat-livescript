'use strict'

describe "PhoneCat controllers" !->

  describe "PhoneListCtrl" (,) !->
    var scope, ctrl
    beforeEach module "phonecatApp"

    beforeEach inject ($controller) !->
      scope := {}
      ctrl := $controller "PhoneListCtrl" $scope: scope

    it 'should create "phones" model with 3 phones' !->
      expect scope.phones.length .to.equal 3

    it 'should set the default value of orderProp model' !->
      expect scope.orderProp .to.equal 'age'
