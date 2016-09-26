// Offcanvas navigacija
(function offCanvasNavigation() {
    'use strict';

    var querySelector = document.querySelector.bind(document); // selectori
    var querySelectorAll = document.querySelectorAll.bind(document); // selectori za each / ponavljajuce elemente

    var html = document.documentElement; //
    var body = document.body; //
    var navdrawerContainer = querySelector('#nav-mobile'); // klasa za mobilnu navigaciju
    var appbarElement = querySelector('.c-page-head'); // klasa za header
    var menuBtn = querySelector('.mobile-menu--box'); // klasa za navigacijski botun
    var overlay = querySelector('.mobile-overlay '); // klasa za overlay
    var main = querySelector('.c-page-content'); // klasa za glavni sadrzaj stranice
    var subMenuBtn = querySelectorAll('.js-btn-sub-nav');

    function closeMenu() {
        menuBtn.classList.remove('is-active');
        html.classList.remove('js-mobile-nav-active');
        body.classList.remove('is-active@sm');
        appbarElement.classList.remove('is-active');
        navdrawerContainer.classList.remove('is-active');
        overlay.classList.remove('is-active');
    }

    function toggleMenu() {
        this.classList.toggle('is-active');
        html.classList.toggle('js-mobile-nav-active');
        body.classList.toggle('is-active@sm');
        appbarElement.classList.toggle('is-active');
        navdrawerContainer.classList.toggle('is-active');
        navdrawerContainer.classList.add('is-opened');
        overlay.classList.toggle('is-active');
        overlay.classList.add('is-opened');
    }

    overlay.addEventListener('click', closeMenu);
    menuBtn.addEventListener('click', toggleMenu);
    navdrawerContainer.addEventListener('click', function (event) {
        if (event.target.nodeName === 'A' || event.target.nodeName === 'LI') {
            closeMenu();
        }
    });

    // Has sub-nav
    function toggleSideMenu() {
        this.classList.toggle('is-active');
        this.parentElement.classList.toggle('is-active');
    }

    for (var i = 0; i < subMenuBtn.length; i++) {
        subMenuBtn[i].addEventListener('click', toggleSideMenu);
    }

})();
