require! <[gulp gulp-util gulp-stylus gulp-mocha gulp-karma gulp-livereload]>
require! <[gulp-bower gulp-bower-files gulp-filter]>
require! <[gulp-angular-templatecache gulp-jade]>
require! <[gulp-concat streamqueue connect]>
gutil = gulp-util
{protractor, webdriver_update} = require \gulp-protractor
livereload-server = require('tiny-lr')!
livereload = -> gulp-livereload livereload-server
livescript = require \gulp-livescript

gulp.task 'bower' ->
  gulp-bower!

gulp.task 'template' ->
  gulp.src 'app/partials/*.jade'
    .pipe gulp-jade!
    .pipe gulp-angular-templatecache 'partials.js' do
      base: "#{process.cwd()}/app"
      filename: 'partials.js'
      module: 'partials'
      standalone: true
    .pipe gulp.dest '_public/js'
    .pipe livereload!

gulp.task 'js:app' ->
  app = gulp.src 'app/**/*.ls'
    .pipe livescript({+bare}).on 'error', gutil.log

  app.pipe gulp-concat 'app.js'
    .pipe gulp.dest '_public/js'
    .pipe livereload!

gulp.task 'js:vendor' <[bower]> ->
  bower = gulp-bower-files!
    .pipe gulp-filter -> it.path is /\.js$/
    .pipe gulp-concat 'vendor.js'
    .pipe gulp.dest '_public/js'
    .pipe livereload!

gulp.task 'css' ->
  bower = gulp-bower-files!
    .pipe gulp-filter -> it.path is /\.styl$/
    .pipe gulp-stylus use: <[nib]>

  styl = gulp.src 'app/styles/**/*.styl'
    .pipe gulp-filter -> it.path isnt /_[^/]+\.styl$/
    .pipe gulp-stylus use: <[nib]>

  streamqueue { +objectMode }
    .done bower, styl
    .pipe gulp-concat 'app.css'
    .pipe gulp.dest '_public/css'
    .pipe livereload!

gulp.task 'assets' ->
  gulp.src 'app/assets/**'
    .pipe gulp.dest '_public'

gulp.task 'dev' <[server template js:app js:vendor css assets]> ->
  LIVERELOADPORT = 35729
  livereload-server.listen LIVERELOADPORT, ->
    return gutil.log it if it
  gulp.watch ['app/partials/*.jade'] <[template]>
  gulp.watch ['app/**/*.ls'] <[js:app]>
  gulp.watch ['app/styles/**/*.styl'] <[css]>
  gulp.watch ['app/index.jade'] <[jade:app]>

gulp.task 'jade:app' ->
  gulp.src 'app/index.jade'
    .pipe gulp-jade!
    .pipe gulp.dest '_public'
    .pipe livereload!

var dev-server
gulp.task 'server' ->
  dev-app = connect!use connect.logger \dev
    .use connect.static '_public'

  dev-server := require 'http' .create-server dev-app .listen 3333

  dev-server.on \error ->
    gutil.log 'Unable to start server!'

  dev-server.on \listening ->
    gutil.log "Running on http://localhost:3333"

gulp.task 'test:unit' <[build]> ->
  gulp.src [
    '_public/js/vendor.js'
    '_public/js/partials.js'
    '_public/js/app.js'
    'bower_components/angular-mocks/angular-mocks.js'
    'test/unit/**/*.spec.ls'
  ]
    .pipe gulp-karma do
      config-file: 'test/karma.conf.ls'
      action: 'run'
      browsers: <[PhantomJS]>
    .on \error ->
      throw it

gulp.task 'build' <[template bower assets js:vendor js:app css]>

gulp.task 'webdriver_update' webdriver_update

gulp.task 'protractor' <[server webdriver_update]> ->
  gulp.src 'test/e2e/app/*.ls'
    .pipe protractor config-file: 'test/protractor.conf.ls'
    .on \error ->
      throw it

gulp.task 'test:e2e' <[protractor]> ->
  dev-server.close!
