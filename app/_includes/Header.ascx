<!--  #include file="search-box.ascx" -->

<header id="header" class="c-page-head js-auto-hide-header" role="banner">
    <div class="c-page-head__main">
        <div class="o-grid-container u-cf">
            <div class="c-logo__wrap u-pull--left">
                <a href="<%=DotNetNuke.Common.Globals.NavigateURL(PortalSettings.HomeTabId)%>" class="c-logo__link">
                    <svg class="c-logo">
                        <use xlink:href="#unidu-logo" />
                    </svg>
                </a>
            </div>
            <div class="u-pull--right">
                <dnn:LOGIN ID="dnnLogin" CssClass="c-btn c-dnn-login__link" runat="server" LegacyMode="false" Text="Prijava na UNIDU" />
                <dnn:LANGUAGE runat="server" visible="true" ID="headerLanguage" ShowLinks="True" ShowMenu="False" HeaderTemplate='<div class="c-nav-language u-cf">' ItemTemplate='<a href="[URL]" class="c-btn c-nav-language__item u-pull-left"><svg class="c-nav-language__icon u-icon-18x18 u-pull-left"><use xlink:href="#icon-globe" /></svg> <span class="c-nav-language__label">[CULTURE:THREELETTERISOCODE]</span></a>'
              AlternateTemplate='<a href="[URL]" class="c-btn c-nav-language__item --alt u-pull-left"><svg class="c-nav-language__icon u-icon-18x18 u-pull-left"><use xlink:href="#icon-globe" /></svg> <span class="c-nav-language__label">[CULTURE:THREELETTERISOCODE]</span></a>' SelectedItemTemplate='<span class="c-nav-language__item is-selected">[CULTURE:THREELETTERISOCODE]</span>'
              FooterTemplate='</div>' />
            </div>
        </div>
    </div>
    <div class="c-page-head__navigation">
        <div class="o-grid-container">
            <a href="<%=DotNetNuke.Common.Globals.NavigateURL(PortalSettings.HomeTabId)%>" class="c-nav-primary__home-link u-pull--left">
                <svg class="c-nav-primary__icon-home u-icon-18x18">
                    <use xlink:href="#icon-home" />
                </svg>
                <span class="sr-only">
                    <%= LocalizeString("HomeTabName.Text") %>
                </span>
            </a>
            <dnn:MENU ID="navPrimary" MenuStyle="nav/primary-nav" NodeSelector="*,0,1" ExcludeNodes="59" runat="server"></dnn:MENU>
            <button type="button" id="js-open-search-box" class="search-form__open-button">
                <svg class="c-nav-primary__icon-search u-icon-18x18">
                    <use xlink:href="#icon-search" />
                </svg>
                <span class="sr-only">
                    <%= LocalizeString("Search.Text") %>
                </span>
            </button>
        </div>
    </div>
</header>
