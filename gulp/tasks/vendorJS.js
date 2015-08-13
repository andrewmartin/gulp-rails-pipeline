var gulp   = require('gulp');
var concat = require('gulp-concat');
var watch  = require('gulp-watch');
var uglify  = require('gulp-uglify');
var config     = require('../config').vendorJS;

gulp.task('vendorJS', function(callback) {
  return gulp.src(config.src)
    .pipe(concat('vendor.js'))
    .pipe(uglify())
    .pipe(gulp.dest(config.dest));
});
