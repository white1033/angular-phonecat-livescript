'use strict'

# jasmine specs for filters go here
describe "filter" ->
  beforeEach module "app.filters"

  describe "interpolate" (,) ->

    beforeEach(module(($provide) !->
      $provide.value "version" "TEST_VER"
    ))

    it "should replace VERSION" inject((interpolateFilter) ->
      interpolateFilter 'before %VERSION% after' .should.equal 'before TEST_VER after'
    )
