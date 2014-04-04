'use strict'

const URL = 'http://localhost:3333'
# http://docs.angularjs.org/guide/dev_guide.e2e-testing
describe 'my app' (,) !->
  beforeEach !->
    browser.get URL

  it 'should filter the phone list as user type into the search box', !->
    phoneList = element.all by.repeater 'phone in phones'
    query = element by.model 'query'

    expect phoneList.count! .toBe 20

    query.sendKeys 'nexus'
    expect phoneList.count! .toBe 1

    query.clear!
    query.sendKeys 'motorola'
    expect phoneList.count! .toBe 8

  it 'should be possible to control phone order via the drop down select box' !->
    phoneNameColumn = element.all(by.repeater 'phone in phones' .column '{{phone.name}}')
    query = element by.model 'query'

    getNames = ->
      phoneNameColumn.map (elm) ->
        elm.getText!

    query.sendKeys 'tablet' # let's narrow the dataset to make the test assertions shorter

    expect getNames! .toEqual [
      "Motorola XOOM\u2122 with Wi-Fi"
      "MOTOROLA XOOM\u2122"
    ]

    element(by.model 'orderProp').findElement(by.css 'option[value="name"').click!

    expect getNames! .toEqual [
      "MOTOROLA XOOM\u2122"
      "Motorola XOOM\u2122 with Wi-Fi"
    ]
  it 'should render phone specific links' !->
    query = element by.model 'query'
    query.sendKeys 'nexus'
    element(by.css '.phones li a').click!
    browser.getLocationAbsUrl!then (url) ->
      expect(url.split '#' .1).toBe '/phones/nexus-s'
