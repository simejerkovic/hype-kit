<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">

  <symbol id="hnk-logo" viewBox="0 0 20 20">
    <g fill-rule="evenodd" clip-rule="evenodd">
      <path d="M11.475 7.032H13v1.525h-1.525V7.032z"/>
      <path d="M1 3.98V1.033h3.05v1.525h1.526V1.032H7c.047.496-.106 1.19.102 1.525h1.424V3.98c.3.278 1.233-.08 1.525.204v8.848c.432.054 1.205-.077 1.323 0-.253.607-1.108.745-1.322 1.525-.205.752.148 1.69 0 2.746.672-.46 1.4-1.195 2.238-2.034.59-.59 1.927-1.576 2.136-2.34.253-.922-.27-1.86.102-2.95h1.424V7.033h-1.525V5.507H13V4.083h-1.524c.065-.477-.133-1.218.102-1.525h1.424V1.033h1.424c.268.35-.03 1.313.102 1.525h1.424V1.033h3.05v2.95c-.333.207-1.03.054-1.524.1V5.51c.492.046 1.188-.108 1.522.1v1.424h-1.525v6H19v1.424h-1.525v1.525H19v2.95h-3.05v-1.424h-1.425v1.424c-.477-.065-1.218.133-1.525-.102v-1.322H7v1.424c-.442-.065-1.15.133-1.424-.102v-1.322H4.05c.77 2.15-1.573 1.234-3.05 1.424v-2.848c.334-.208 1.03-.055 1.525-.102v-1.525H1V13.03h1.525v-6c-.496-.045-1.19.11-1.525-.1V5.61c.334-.21 1.03-.056 1.525-.103V4.083C2.03 4.036 1.335 4.19 1 3.98zm6.102 4.476c.468-.448 1.023-.807 1.322-1.424H5.678c.347.602.822 1.076 1.424 1.424z"/>
    </g>
  </symbol>
</svg>

<!--  #include file="Nav_mobile.ascx" -->

<div class="light-box light-box--dark js-search-input-box is-hidden">
    <div class="light-box__wrapper">
        <div class="light-box__content">
            <section class="search-popup">
                <button type="button" id="js-close-search-box" class="search-form__close-button">
                  <i class="icon-big-cross" style="background-image: none;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 15 15">
                      <path fill="none" stroke="#CCC" stroke-width="2.5" stroke-miterlimit="10" d="M15 0L0 15M0 0l15 15"></path>
                    </svg>
                  </i>
                </button>
                <div class="search-form">
                    <avt:SearchBoost runat="server" id="avtSearch" />
                </div>
                <p class="search-popup--results-text" id="js-results-text">
                  <dnn:TEXT runat="server" id="searchBoxDesc" resourceKey="SearchBoxDescription" CssClass="" />
                </p>
            </section>
        </div>
    </div>
</div>

<header id="header" class="c-page-head" role="banner">
  <div class="c-page-head__main">
    <div class="mobile-menu--box">
        <button class="c-nav-mobile__button" type="button">
            <i class="icon icon-burger"></i>
            <dnn:TEXT runat="server" id="menuText" resourceKey="Menu" CssClass="" />
        </button>
    </div>
    <div class="c-logo__wrap">
        <a href="<%= NavigateURL(PortalSettings.HomeTabId) %>" class="c-logo"></a>
    </div>
    <div class="c-page-head__search hide-until@sm">
        <button type="button" id="js-open-search-box" class="search-form__open-button"><span class="icon icon-search"></span></button>
    </div>
  </div>
  <dnn:MENU ID="navPrimary" MenuStyle="nav/primary-nav" NodeSelector="*,0,1" ExcludeNodes="" runat="server"></dnn:MENU>
</header>
