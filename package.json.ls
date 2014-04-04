#!/usr/bin/env lsc -c
author: 'Yen-Ying Lee'
name: 'angular-gulp-livescript'
description: 'AngularJS + gulp.js + Bower + LiveScript'
version: '0.0.1'
homepage: 'https://github.com/white1033/angular-gulp-livescript'
repository:
  type: 'git'
  url: 'https://github.com/white1033/angular-gulp-livescript'
engines:
  node: '0.10.x'
  npm: '1.3.x'
scripts:
  prepublish: 'lsc -c package.json.ls && lsc -c bower.json.ls'
  build: 'gulp --require LiveScript build server'
  dev: 'gulp --require LiveScript dev'
  test: 'gulp --require LiveScript build test:unit'
  protractor: 'gulp --require LiveScript test:e2e'
dependencies: {}
devDependencies:
  jade: '1.3.x'
  LiveScript: '1.2.x'

  'bower': '1.2.x'

  'karma': '>= 0.12.0'
  'karma-live-preprocessor': '>= 0.2.0'
  'karma-phantomjs-launcher': "^0.1.2"
  'karma-mocha': '~0.1.0'
  'karma-chai': '~0.1.0'

  'mocha': '~1.14.0'
  'chai': '~1.8.0'
  'protractor': '~0.20.x'
  'chai-as-promised': '~4.1.0'
  streamqueue: '~0.0.5'

  gulp: '~3.5.0'
  'gulp-util': 'latest'
  'gulp-exec': '~1.0.4'
  'gulp-protractor': '^0.0.7'
  'gulp-livescript': '~0.1.1'
  'gulp-stylus': '~0.1.0'
  'gulp-concat': '~2.1.7'
  'gulp-jade': '~0.4.1'
  'gulp-angular-templatecache': '^1.1.0'
  'gulp-bower': '~0.0.2'
  'gulp-bower-files': '>= 0.1.8'
  'gulp-filter': '~0.2.1'
  'gulp-mocha': '~0.4.1'
  'gulp-karma': '~0.0.4'
  'gulp-livereload': '~1.1.1'
  'tiny-lr': '~0.0.5'
  connect: '2.14.x'
