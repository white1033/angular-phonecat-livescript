'use strict'

const URL = 'http://localhost:3333'
# http://docs.angularjs.org/guide/dev_guide.e2e-testing
describe 'my app' (,) !->
  beforeEach !->
    browser.get URL

  it 'should filter the phone list as user type into the search box', !->
    phoneList = element.all by.repeater 'phone in phones'
    query = element by.model 'query'

    expect phoneList.count! .toBe 3

    query.sendKeys 'nexus'
    expect phoneList.count! .toBe 1

    # query.clear!
    # query.sendKeys 'motorola'
    # expect phoneList.count! .toBe 2
