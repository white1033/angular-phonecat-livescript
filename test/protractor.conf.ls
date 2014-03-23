exports.config = do
  chromeOnly: true
  chromeDriver: '../node_modules/protractor/selenium/chromedriver'

  all-scripts-timeout: 11000

  base-url: 'http://localhost:3333'

  capabilities:
    browser-name: 'phantomjs'
    'phantomjs.binary.path': 'node_modules/karma-phantomjs-launcher/node_modules/phantomjs/bin/phantomjs'

  specs:
    'e2e/app/*.ls'
    ...

  framework: 'mocha'

  mocha-opts:
    reporter: 'spec'
