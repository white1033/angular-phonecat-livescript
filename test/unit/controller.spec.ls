'use strict'
# jasmine specs for controllers go here

# TODO figure out how to test Controllers that use modules
describe "controllers" ->

  beforeEach module "app.controllers"

  describe "MyCtrl1" (,) ->

    it "should make scope testable" inject ($rootScope, $controller) ->
      scope = $rootScope.$new!
      ctrl = $controller "MyCtrl1" $scope: scope
      scope.onePlusOne.should.equal 2

  describe "MyCtrl2" (,) ->

    it "should " inject ($rootScope, $controller) ->
      scope = $rootScope.$new!
      ctrl = $controller 'MyCtrl2' $scope: scope
      scope.Title.should.equal 'MyCtrl2'
