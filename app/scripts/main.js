$(document).ready(function() {

    // Fix for browsers that do not support picture tag and responsive images
    function loadJS(u) {
        var r = document.getElementsByTagName("script")[0],
            s = document.createElement("script");
        s.src = u;
        r.parentNode.insertBefore(s, r);
    }

    if (!window.HTMLPictureElement) {
        loadJS("/Portals/0-System/Skins/HNK/scripts/lazysizes/respimg/ls.respimg.min.js");
    }

    // LazySizes responsive image values
    window.lazySizesConfig = window.lazySizesConfig || {};
    window.lazySizesConfig.customMedia = {
        '--small': '(max-width: 489px)',
        '--medium': '(max-width: 739px)',
        '--large': '(max-width: 979px)',
        '--xlarge': '(max-width: 1219px)',
    };

    // Search module

    // Open search module on desktop
    document.getElementById("js-open-search-box").addEventListener("click", function(){
      $('.js-search-input-box').removeClass('is-hidden');
      $('body').addClass('Lightbox--body-open');
      $('#dnn_avtSearch_pnlInput input.search-box').focus();
    });

    // Open search module on mobile
    document.getElementById("js-open-search-box--mobile").addEventListener("click", function(){
      //
      $('html').removeClass('js-mobile-nav-active');
      $('body').removeClass('is-active@sm');
      $('.mobile-overlay').removeClass('is-active');
      $('#nav-mobile').removeClass('is-active');
      $('.c-nav-mobile__button').removeClass('is-active');
      //
      $('.js-search-input-box').removeClass('is-hidden');
      $('body').addClass('Lightbox--body-open');
      $('#dnn_avtSearch_pnlInput input.search-box').focus();
    });

    // Close search module
    document.getElementById("js-close-search-box").addEventListener("click", function(){
      $('.js-search-input-box').addClass('is-hidden');
      $('body').removeClass('Lightbox--body-open');
    });

    // IE 9 fix for placeholders
    var ua = window.navigator.userAgent;
    var msie = ua.indexOf("MSIE ");

    if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))  // If Internet Explorer 9 activate placeholder plugin
    {
        var IeVersion = parseInt(ua.substring(msie + 5, ua.indexOf(".", msie)));
        if (IeVersion < 10) {
            $('input, textarea').placeholder();
        }
    }
});
