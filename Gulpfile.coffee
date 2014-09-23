gulp = require('gulp')
coffee = require('gulp-coffee')
gutil = require('gulp-util')
concat = require('gulp-concat')
stylus = require('gulp-stylus')
nib = require('nib')

gulp.task 'coffee', ->
  gulp.src(paths.js + '*.coffee')
  .pipe(coffee({bare: true}).on('error', gutil.log))
  .pipe(concat('all.js'))
  .pipe(gulp.dest(paths.build))

gulp.task 'stylus', ->
  gulp.src(paths.styles + '*.styl')
  .pipe(stylus(
    use: nib()
    compres: true
    linenos: true
    sourcemap:
      inline: true
      sourceRoot: '..'
      basePath: 'css'
  ))
  .pipe(concat('all.css'))
  .pipe(gulp.dest(paths.build))

paths =
  js: './src/js/',
  styles: './src/styles/'
  build: './dist/'


gulp.task('default', ['coffee', 'stylus'])
