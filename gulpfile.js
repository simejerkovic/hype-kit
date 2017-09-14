// Include Gulp & Tools We'll Use
// ==========================================================================

// Include Gulp
var gulp = require('gulp');

// Include plugins
var cache = require('gulp-cache');
var eslint = require('gulp-eslint');
//var if = require('gulp-if');
var imagemin = require('gulp-imagemin');
var plumber = require('gulp-plumber');
var sass = require('gulp-sass');
var postcss = require('gulp-postcss');
var nano = require('gulp-cssnano');
var size = require('gulp-size');
var sourcemaps = require('gulp-sourcemaps');
var uglify = require('gulp-uglify');
var util = require('gulp-util');
var pxtorem = require('postcss-pxtorem');
var browserSync = require('browser-sync').create();
var autoprefixer = require('autoprefixer');

var sassdoc = require('sassdoc'); // Sass documentation

//----------------------------------------------------------------------
//	Setup
//----------------------------------------------------------------------

var skinPathDev = 'app';

// Settings for Autoprefixer plugin,
// adds basic browser support + ios 7+ for older iPads
// ==========================================================================
var processors = [
  autoprefixer({ browsers: ['> 1%', 'last 2 versions', 'ie > 6', 'ff ESR', 'bb >= 7', 'ios >= 7'] }),
];

// TODO: Make const paths
// ==========================================================================

// const paths = {
//     ascx: './source/views/*.ascx',
//     js: './source/assets/javascripts/**/*.js',
//     scss: './source/assets/stylesheets/**/*.scss',
//     images: './source/assets/images/*',
//     fonts: './source/assets/fonts/*',
//     //
//     skin: 'app'
// };

// Minify PNG, JPEG, GIF and SVG images with imagemin
// ==========================================================================
// gulp.task('minify-all-images', () =>
// 	gulp.src('Website/Portals/0/Images/**/*')
// 		.pipe(imagemin())
// 		.pipe(gulp.dest('Website/Portals/0/dist/images'))
// );

// Compile Sass to CSS
// ==========================================================================

// Use only for Development environment!
// For production see task build
gulp.task('styles:dev', function () {

    return gulp.src(skinPathDev + '/styles/skin.scss')
        .pipe(plumber())
        .pipe(sourcemaps.init())
        .pipe(sass.sync().on('error', sass.logError))
        .pipe(postcss(processors))
        // Nano is hidden in dev envirement to speed up Sass generation
        //.pipe(nano({ safe: true, autoprefixer: false, zindex: false }))
        .pipe(sourcemaps.write('.'))
        .pipe(gulp.dest(skinPathDev))
        .pipe(browserSync.stream({ match: '**/*.css' }));
});

// Use only for Production / Live environment!
// For development see task styles:dev
gulp.task('build', function () {

    return gulp.src(skinPathDev + '/styles/skin.scss')
        .pipe(plumber())
        .pipe(sass.sync().on('error', sass.logError))
        .pipe(postcss(processors))
        .pipe(nano({ safe: true, autoprefixer: false, zindex: false }))
        .pipe(gulp.dest(skinPathDev));
});

// Watch files for changes & reload
// ==========================================================================

gulp.task('serve:dev', ['styles:dev'], function () {
    browserSync.init({
        injectChanges: true,
        proxy: 'http://dev.sistemi.hr'
    });
    gulp.watch([skinPathDev + '/styles/**/*.{scss,css}'], ['styles:dev']);
});



// Generate Sass documentation
// ==========================================================================
gulp.task('sassdoc', function () {
    var options = {
        dest: 'resources/sassdoc/',
    };

    return gulp.src(skinPathDev + '/styles/**/*.scss')
        .pipe(sassdoc(options));
});
