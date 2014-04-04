'use strict'

describe "PhoneCat controllers" !->
  beforeEach module "phonecatApp"

  describe "PhoneListCtrl" (,) !->

    it 'should create "phones" model with 3 phones' inject ($controller) !->
      scope = {}
      ctrl = $controller "PhoneListCtrl" $scope: scope
      expect scope.phones.length .to.equal 3
