'use strict'

# Services

angular.module 'phonecatServices' <[ ngResource ]>
  .factory 'Phone' <[ $resource ]> ++ ($resource) ->
    $resource 'phones/:phoneId.json' {} do
      query:
        method: 'GET'
        params:
          phoneId: 'phones'
        isArray: true
