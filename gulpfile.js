// This file in the main entry point for defining Gulp tasks and using Gulp plugins.
// Click here to learn more. http://go.microsoft.com/fwlink/?LinkId=518007

// Include Gulp & Tools We'll Use
// ==========================================================================

// Include Gulp
var gulp = require("gulp");

// Include plugins
var cache = require("gulp-cache");
var eslint = require("gulp-eslint");
//var if = require("gulp-if");
//var imagemin = require('gulp-imagemin');
var plumber = require('gulp-plumber');
var sass = require("gulp-sass");
var postcss = require('gulp-postcss');
var nano = require('gulp-cssnano');
var size = require("gulp-size");
var sourcemaps = require('gulp-sourcemaps');
var uglify = require('gulp-uglify');
var util = require('gulp-util');
var pxtorem = require('postcss-pxtorem');
var browserSync = require('browser-sync').create();
var autoprefixer = require('autoprefixer');

// Local directory path
// ==========================================================================

var skinPathDev = 'app';

// TODO: Make const paths
// ==========================================================================

const paths = {
  haml: './source/views/*.haml',
  coffee: './source/assets/javascripts/**/*.coffee',
  scss: './source/assets/stylesheets/**/*.scss',
  images: './source/assets/images/*',
  fonts: './source/assets/fonts/*',
  //
  skin: 'app'
};

// Compile Sass to CSS
// ==========================================================================

gulp.task('styles:dev', function () {
  
    // px-to-rem & autoprefixer
    var processors = [
        autoprefixer({browsers: ['> 1%', 'last 2 versions', 'ie > 6', 'ff ESR', 'bb >= 7', 'ios >= 7']}),
        pxtorem({
            root_value: 10,
            replace: true,
            prop_white_list: [],
            selector_black_list: ['html']
        })
    ];

    return gulp.src(skinPathDev + '/styles/skin.scss')
        .pipe(plumber())
        .pipe(sourcemaps.init())
        .pipe(sass.sync().on('error', sass.logError))
        .pipe(postcss(processors))
        //.pipe(nano({ safe: true, autoprefixer: false, zindex: false }))
        .pipe(sourcemaps.write('.'))
        .pipe(gulp.dest(skinPathDev))
        .pipe(browserSync.stream({ match: '**/*.css' }));
});

// Watch files for changes & reload
// ==========================================================================

gulp.task('serve:dev', ['styles:dev'], function () {
  browserSync.init({
        injectChanges: true,
        proxy: "http://dev.sistemi.hr"
    });
    gulp.watch([skinPathDev + '/styles/**/*.{scss,css}'], ['styles:dev']);
});
