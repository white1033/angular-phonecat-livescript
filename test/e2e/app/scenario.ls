'use strict'

const URL = 'http://localhost:3333'
# http://docs.angularjs.org/guide/dev_guide.e2e-testing
describe 'PhoneCat App' (,) !->

  it 'should redirect index.html to index.html#/phones' !->
    browser.get URL
    browser.getLocationAbsUrl!then (url) !->
      expect(url.split '#' .1).toBe '/phones'

  describe 'Phone list view' (,) !->

    beforeEach !->
      browser.get "#{URL}/#/phones"

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

  describe 'Phone detail view' (,) !->

    beforeEach !->
      browser.get "#{URL}/#/phones/nexus-s"

    it 'should display nexus-s page' ->
      expect(element(by.binding 'phone.name').getText!).toBe 'Nexus S'

    it 'should display the first phone image as the main phone image' !->
      expect(element by.css 'img.phone' .getAttribute 'src').toMatch /img\/phones\/nexus-s.0.jpg/

    it 'should swap main image if a thumbnail image is clicked on' !->
      element(by.css '.phone-thumbs li:nth-child(3) img').click!
      expect(element by.css 'img.phone' .getAttribute 'src').toMatch /img\/phones\/nexus-s.2.jpg/

      element(by.css '.phone-thumbs li:nth-child(1) img').click!
      expect(element by.css 'img.phone' .getAttribute 'src').toMatch /img\/phones\/nexus-s.0.jpg/
