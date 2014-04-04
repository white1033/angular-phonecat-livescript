'use strict'

# Filters

angular.module 'phonecatFilters' []
  .filter 'checkmark' ->
    -> if it then '\u2713' else '\u2718'
