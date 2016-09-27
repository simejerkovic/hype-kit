<div class="c-page-footer__top c-page-section--alt hide-until@md">
  <div class="o-list-inline">
    <div class="pane pane--virtual-tour">
        <div class="virtual-tour--box lazyload" data-mh="match-height" data-bgset="/Portals/0/Images/virtualna-setnja.jpg" data-sizes="auto">
            <div class="content-box content-box--left">
               <dnn:TEXT runat="server" id="virtualna" resourceKey="VirtualnaSetnjaTitle" CssClass="" />
               <dnn:TEXT runat="server" id="virtualnaSetnjaBtn" resourceKey="VirtualnaSetnjaBtn" CssClass="" />
            </div>
        </div>
    </div>
    <div class="pane pane--about-theater">
        <div class="about-theater--box lazyload" data-mh="match-height" data-bgset="/Portals/0/Images/o-kazalistu.jpg" data-sizes="auto">
            <div class="content-box content-box--right">
              <dnn:TEXT runat="server" id="oKazalistuTitle" resourceKey="oKazalistuTitle" CssClass="" />
              <dnn:TEXT runat="server" id="oKazalistuText" resourceKey="oKazalistuText" CssClass="" />
              <dnn:TEXT runat="server" id="oKazalistuBtn" resourceKey="oKazalistuBtn" CssClass="" />
            </div>
        </div>
    </div>
  </div>
</div>
<div class="c-page-footer__top c-page-section--alt c-page-section--sponsors">
  <div class="o-grid-container">
    <div class="o-grid-row">
        <div class="pane pane--sponsorship">
            <dnn:TEXT runat="server" id="pokroviteljstvoTitle" resourceKey="PokroviteljstvoTitle" CssClass="" />
            <ul class="sponsors__list o-list-inline u-pull--left">
                <li class="sponsors__item">
                    <a href="http://www.splitskabanka.hr" title="Splitska Banka" target="_blank" rel="nofollow"><img src="/Portals/0/Images/Sponsors/splitska-banka.png"/></a>
                </li>
            </ul>
        </div>
        <div class="pane pane--sponsors">
            <dnn:TEXT runat="server" id="sponzoriTitle" resourceKey="SponzoriTitle" CssClass="" />
            <ul class="sponsors__list o-list-inline u-pull--left">
                <li class="sponsors__item">
                    <a href="http://www.slobodnadalmacija.hr" title="Slobodna Dalmacija" target="_blank" rel="nofollow"><img src="/Portals/0/Images/Sponsors/sd-logo.png"/></a>
                </li>
            </ul>
        </div>
    </div>
   </div>
</div>
<footer class="c-page-footer"  role="contentinfo">
  <div class="c-page-footer__top">
    <div class="o-grid-container">
      <div class="pane pane--contact-info o-grid-row">
          <div class="contact-info--left">
               <a href="<%= NavigateURL(PortalSettings.HomeTabId) %>" class="c-logo"></a>
              <dnn:TEXT runat="server" id="kontaktInfoLijevoContent" resourceKey="KontaktInfoLijevoContent" CssClass="" />
              <ul class="social-network-list">
                  <li><a href="https://www.facebook.com/HNKSplit/" target="_blank" ><span class="icon icon-facebook"></span></a></li>
                  <li><a href="https://twitter.com/Hrvatskonarodno" target="_blank" ><span class="icon icon-twitter"></span></a></li>
                  <li><a href="https://www.youtube.com/user/KazalisteSplit" target="_blank" ><span class="icon icon-youtube"></span></a></li>
              </ul>
          </div>
          <div class="contact-info--middle">
              <dnn:TEXT runat="server" id="kontaktInfoSredinaContent" resourceKey="KontaktInfoSredinaContent" CssClass="" />
          </div>
          <div class="contact-info--right">
              <dnn:TEXT runat="server" id="kontaktInfoDesnoContent" resourceKey="KontaktInfoDesnoContent" CssClass="" />
              <div class="o-media">
                  <div class="o-media__img">
                      <img src="/Portals/0-System/Skins/HNK/images/content/handicap.jpg"/>
                  </div>
                  <div class="o-media__body">
                    <dnn:TEXT runat="server" id="kontaktInfoDesnoInvaliditetContent" resourceKey="KontaktInfoDesnoInvaliditetContent" CssClass="" />
                  </div>
              </div>
          </div>
      </div>
    </div>
  </div>
  <div class="c-page-footer__bottom">
    <div class="o-grid-container">
        <div class="o-grid-row">
          <dnn:MENU ID="navFooter" MenuStyle="footer-nav" NodeSelector="*,0,0" ExcludeNodes="55, 236,248,250,256" runat="server"></dnn:MENU>
          <div class="c-page-footer--copyright">
            <dnn:Copyright runat="server" id="dnnCopyright" />
            <dnn:TEXT runat="server" id="TEXT1" resourceKey="Izrada" CssClass="" />
          </div>
        </div>
    </div>
  </div>
</footer>