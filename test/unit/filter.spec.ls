'use strict'

# jasmine specs for filters go here
describe "filter" (,) !->

  beforeEach module "phonecatFilters"

  describe "checkmark" (,) !->

    it 'should convert boolean value to unicode checkmark or cross' inject (checkmarkFilter) !->
      expect(checkmarkFilter true).to.equal '\u2713'
      expect(checkmarkFilter false).to.equal '\u2718'
