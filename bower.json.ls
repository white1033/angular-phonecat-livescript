#!/usr/bin/env lsc -c
name: 'angular-gulp-livescript'
repo: 'white1033/angular-gulp-livescript'
version: '0.1.1'
main: '_public/js/app.js'
ignore: ['**/.*', 'node_modules', 'components']
dependencies:
  'console-polyfill': '~0.1.0'
  jquery: '~2.0.3'
  'bootstrap-less': '~2.3.2'
  'bootstrap-less-themes': 'https://github.com/angular-brunch/bootstrap-less-themes.git'
  'angular-bootstrap': '~0.5.0'
  angular: '1.2.12'
  'angular-sanitize': '1.2.12'
  'angular-resource': '1.2.12'
  'angular-route': '1.2.12'
  'angular-cookies': '1.2.12'
  'angular-mocks': '1.2.12'
overrides:
  angular:
    dependencies: jquery: '*'
  'angular-mocks':
    main: 'README.md'
  'bootstrap-less':
    ignore:
      '*'
      ...
