// Helper navigation
(function helperNavigacija() {
    'use strict';

    var querySelector = document.querySelector.bind(document); // selectori
    var querySelectorAll = document.querySelectorAll.bind(document); // selectori za each / ponavljajuce elemente

    var html = document.documentElement; //
    var body = document.body; //
    var helperContainer = querySelector('.js-nav-helper-expand'); // klasa za mobilnu navigaciju
    var helperBtn = querySelector('.js-nav-helper-expand__btn'); // klasa za navigacijski botun

    function closeMenu() {
        helperBtn.classList.remove('is-active');
        helperContainer.classList.remove('is-active');
    }

    function toggleMenu() {
        this.classList.toggle('is-active');
        helperContainer.classList.toggle('is-active');
        helperContainer.classList.add('is-opened');
    }

    helperBtn.addEventListener('click', toggleMenu);

})();
