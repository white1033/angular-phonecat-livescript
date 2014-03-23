module.exports = (karma) ->
  karma.set do
    base-path: '../'
    frameworks: <[mocha chai]>
    files:
      * "_public/js/vendor.js"
      * "_public/js/partial.js"
      * "_public/js/app.js"
      * "bower_components/angular-mocks/angular-mocks.js"
      * "test/unit/**/*.spec.ls"
    exclude: []
    reprorters: ['progress']
    port:9876
    runner-port: 9100
    colors: true
    log-level: karma.LOG_INFO
    auto-watch: true
    browsers: ['Chrome']
    capture-timeout: 60000
    preprocessors:
      '**/*.ls': ['live']
    single-run: false
