/*
This file in the main entry point for defining Gulp tasks and using Gulp plugins.
Click here to learn more. http://go.microsoft.com/fwlink/?LinkId=518007
*/

// Include Gulp & Tools We'll Use
// ==========================================================================
// Include Gulp
var gulp = require("gulp");

// Include plugins
var cache = require("gulp-cache");
var eslint = require("gulp-eslint");
//var if = require("gulp-if");
var imagemin = require('gulp-imagemin');
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
var skinPathHNK = 'Portals/0-System/Skins/HNK'; // HNK Split
var skinPathSL = 'Portals/2-System/Skins/62-Splitskoljeto'; // Splitsko ljeto
var skinPathMD = 'Portals/3-System/Skins/27-MaruliceviDani'; // Marulićevi dani

/*******************************************************************************
    ERROR HANDLER FOR GULP PLUMBER
*******************************************************************************/
var onError = function (err) {
    console.log('An error occurred:', err.message);
    this.emit('end');
};

/*******************************************************************************
 Compile Sass to CSS
*******************************************************************************/
// HNK Split
gulp.task('styles:hnk', function () {
    var processors = [
        autoprefixer({browsers: ['> 1%', 'last 2 versions', 'ie > 6', 'ff ESR', 'bb >= 7', 'ios >= 7']}),
        pxtorem({
            root_value: 10,
            replace: true,
            prop_white_list: [],
            selector_black_list: ['html']
        })
    ];

    return gulp.src(skinPathHNK + '/styles/skin.scss')
        .pipe(plumber())
        .pipe(sourcemaps.init())
        .pipe(sass.sync().on('error', sass.logError))
        .pipe(postcss(processors)) // px-to-rem & autoprefixer
        // .pipe(nano({ safe: true, autoprefixer: false, discardComments: { removeAll: false }, zindex: false }))
        .pipe(nano({ safe: true, autoprefixer: false, zindex: false }))
        .pipe(sourcemaps.write('.'))
        .pipe(gulp.dest(skinPathHNK))
        .pipe(browserSync.stream({ match: '**/*.css' }));
});

// Splitsko ljeto
gulp.task('styles:sl', function () {
    var processors = [
        autoprefixer({browsers: ['> 1%', 'last 2 versions', 'ie > 6', 'ff ESR', 'bb >= 7', 'ios >= 7']}),
        pxtorem({
            root_value: 10,
            replace: true,
            prop_white_list: [],
            selector_black_list: ['html']
        })
    ];

    return gulp.src(skinPathSL + '/styles/skin.scss')
        .pipe(plumber())
        .pipe(sourcemaps.init())
        .pipe(sass.sync().on('error', sass.logError))
        .pipe(postcss(processors)) // px-to-rem & autoprefixer
        .pipe(nano({ safe: true, discardComments: { removeAll: false }, zindex: false }))
        .pipe(sourcemaps.write('.'))
        .pipe(gulp.dest(skinPathSL))
        .pipe(browserSync.stream({ match: '**/*.css' }));
});

// Marulicevi dani
gulp.task('styles:md', function () {
    var processors = [
        autoprefixer({browsers: ['> 1%', 'last 2 versions', 'ie > 6', 'ff ESR', 'bb >= 7', 'ios >= 7']}),
        pxtorem({
            root_value: 10,
            replace: true,
            prop_white_list: [],
            selector_black_list: ['html']
        })
    ];

    return gulp.src(skinPathMD + '/styles/skin.scss')
        .pipe(plumber())
        .pipe(sourcemaps.init())
        .pipe(sass.sync().on('error', sass.logError))
        .pipe(postcss(processors)) // px-to-rem & autoprefixer
        // .pipe(nano({ safe: true, autoprefixer: false, discardComments: { removeAll: false }, zindex: false }))
        .pipe(nano({ safe: true, autoprefixer: false, zindex: false }))
        .pipe(sourcemaps.write('.'))
        .pipe(gulp.dest(skinPathMD))
        .pipe(browserSync.stream({ match: '**/*.css' }));
});

/*******************************************************************************
 Watch files for changes & reload
*******************************************************************************/
// HNK Split
gulp.task('serve:hnk', ['styles:hnk'], function () {
  browserSync.init({
        injectChanges: true,
        proxy: "http://hnksplit.dev.sistemi.hr"
    });
    gulp.watch([skinPathHNK + '/styles/**/*.{scss,css}'], ['styles:hnk']);
});

// Splitsko ljeto
gulp.task('serve:sl', ['styles:sl'], function () {
  browserSync.init({
        injectChanges: true,
        proxy: "http://splitsko-ljeto.dev.sistemi.hr"
    });
    gulp.watch([skinPathSL + '/styles/**/*.{scss,css}'], ['styles:sl']);
});

// Marulicevi dani
gulp.task('serve:md', ['styles:md'], function () {
  browserSync.init({
        injectChanges: true,
        proxy: "http://marulicevi-dani.dev.sistemi.hr"
    });
    gulp.watch([skinPathMD + '/styles/**/*.{scss,css}'], ['styles:md']);
});
