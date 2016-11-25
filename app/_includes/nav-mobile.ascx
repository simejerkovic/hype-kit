<div id="nav-mobile" class="c-nav-mobile" role="navigation" aria-label="Mobile navigation">
  <a href="<%=DotNetNuke.Common.Globals.NavigateURL(PortalSettings.HomeTabId)%>" class="c-logo c-logo--black"></a>
  <nav class="c-nav-mobile__inner">
    <button type="button" id="js-open-search-box--mobile" class="c-nav-mobile__search-button"><span class="icon icon-search"></span> <dnn:TEXT runat="server" id="searchBoxBtn" resourceKey="SearchBoxButton" CssClass="" /></button>
    <dnn:LANGUAGE runat="server" visible="true" ID="MOBILELANGUAGE" ShowLinks="True" ShowMenu="False" HeaderTemplate='<ul class="c-nav-language o-list-inline">' ItemTemplate='<li class="c-nav-language__item o-list-inline__item"><a href="[URL]">[CULTURE:THREELETTERISOCODE]</a></li>'
  AlternateTemplate='<li class="c-nav-language__item o-list-inline__item o-list-inline__item--alt"><a href="[URL]">[CULTURE:THREELETTERISOCODE]</a></li>' SelectedItemTemplate='<li class="c-nav-language__item o-list-inline__item is-selected">[CULTURE:THREELETTERISOCODE]</li>'
  FooterTemplate='</ul>' SeparatorTemplate='/' />
    <!-- <dnn:menu id="navMobile" menustyle="nav/mobile-nav" NodeSelector="*,0,1" ExcludeNodes="" runat="server"></dnn:menu> -->
  </nav>
</div>
<div class="mobile-overlay"></div>
