'use strict'

mod = {}

mod.AppCtrl = <[$scope $location $resource $rootScope]> ++ (s, $location, $resource, $rootScope) ->

  # Uses the url to determine if the selected
  # menu item should have the class active.
  s <<< {$location}
  s.$watch '$location.path()' (activeNavId or '/') ->
    s <<< {activeNavId}

  # getClass compares the current url with the id.
  # If the current url starts with the id it returns 'active'
  # otherwise it will return '' an empty string. E.g.
  #
  #   # current url = '/products/1'
  #   getClass('/products') # returns 'active'
  #   getClass('/orders') # returns ''
  #
  s.getClass = (id) ->
    if s.activeNavId.substring 0 id.length is id
      'active'
    else
      ''

mod.MyCtrl1 = <[$scope]> ++ (s) ->
  s.Title = "MyCtrl1"

  s.onePlusOne = 2

mod.MyCtrl2 = <[$scope]> ++ (s) ->
  s.Title = "MyCtrl2"

mod.TodoCtrl = <[$scope]> ++ (s) ->
  s.todos =
    * text: 'learn angular'
      done: true
    * text: 'build an angular app'
      done: false

  s.add-todo = ->
    s.todos.push do
      text: s.todo-text
      done: false

    s.todo-text = ''

  s.remaining = ->
    count = 0
    angular.for-each s.todos, (todo) ->
      count += (if todo.done then 0 else 1)

    count

  s.archive = ->
    old-todos = s.todos
    s.todos = []
    angular.for-each old-todos, (todo) ->
      s.todos.push todo unless todo.done

angular.module 'app.controllers' [] .controller mod
