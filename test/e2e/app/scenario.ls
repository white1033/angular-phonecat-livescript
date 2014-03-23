'use strict'
require! {
  chai
  'chai-as-promised'
  chai.expect
}

chai.use chai-as-promised

const URL = 'http://localhost:3333'
# http://docs.angularjs.org/guide/dev_guide.e2e-testing
describe 'my app' (,) !->
  beforeEach ->
    browser.get URL

  it 'should automatically redirect to /todo when location hash/fragment is empty' !->
    url <-! browser.get-current-url!then
    expect url .to.equal "#{URL}/#/todo"

  # it 'should navigate to /view1 when the View 1 link in nav is clicked' !->
  #   element by.css '.nav a[href="#/view1"]' .click!
  #   expect browser.get-current-url! .to.eventually.equal '#{URL}/#/view1'

  describe 'todo' (,) !->

    it 'should list 2 items' !->
      expect(element.all by.repeater 'todo in todos' .count!).to.eventually.equal 2

    it 'should display checked items with a line-through' !->
      expect(element by.css 'ul li input:checked + span' .get-css-value 'text-decoration').to.eventually.contain 'line-through'

    it 'should sync done status with checkbox state' !->
      element by.css 'ul li input:not(:checked)' .click!
      expect(element by.css 'ul li span' .get-attribute 'class').to.eventually.equal 'donetrue'
      element by.css 'ul li input:checked' .click!
      expect(element by.css 'ul li span' .get-attribute 'class').to.eventually.equal 'donefalse'

    it 'should remove checked items when the archive link is clicked' !->
      element by.css 'a[ng-click="archive()"]' .click!
      expect(element.all by.repeater 'todo in todos' .count!).to.eventually.equal 1

    it 'should add a newly submitted item to the end of the list and empty the text input' !->
      newItemLabel = 'test newly added item'
      element by.model 'todoText' .send-keys newItemLabel
      element by.css 'input[type="submit"]' .click!
      expect(element.all by.repeater 'todo in todos' .count!).to.eventually.equal 3
      expect(element.all by.css 'ul li' .last!$ 'span' .get-text!).to.eventually.equal newItemLabel
      expect(element by.model 'todoText' .get-attribute 'value').to.eventually.equal ''


  describe 'view1' (,) !->
    beforeEach !->
      browser.get "#/view1"

    it 'should render view1 when user navigates to /view1' !->
      expect(element.all by.css 'p' .first!get-text!).to.eventually.match /partial for view 1/


  describe 'view2' (,) !->
    beforeEach !->
      browser.get '#/view2'

    it 'should render view2 when user navigates to /view2' !->
      expect(element.all by.css 'p' .first!get-text!).to.eventually.match /partial for view 2/
