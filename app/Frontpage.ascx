<%@ Control Language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LANGUAGE" Src="~/Admin/Skins/Language.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/Logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SEARCH" Src="~/Admin/Skins/Search.ascx" %>
<%@ Register TagPrefix="dnn" TagName="BREADCRUMB" Src="~/Admin/Skins/BreadCrumb.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TEXT" Src="~/Admin/Skins/Text.ascx" %>
<%@ Register TagPrefix="dnn" TagName="COPYRIGHT" Src="~/Admin/Skins/Copyright.ascx" %>
<%@ Register TagPrefix="dnn" TagName="META" Src="~/Admin/Skins/Meta.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.DDRMenu.TemplateEngine" Assembly="DotNetNuke.Web.DDRMenu" %>
<%@ Register TagPrefix="dnn" TagName="MENU" Src="~/DesktopModules/DDRMenu/Menu.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="avt" TagName="SearchBoost" Src="~/DesktopModules/DnnSharp/SearchBoost/SearchInput.ascx"%>
<%@ Register TagPrefix="fortyfingers" TagName="STYLEHELPER" Src="~/DesktopModules/40Fingers/SkinObjects/StyleHelper/StyleHelper.ascx" %>
<%@ Register TagPrefix="dnn" TagName="COOKIECONSENT" Src="~/DesktopModules/DnnC_CookieConsent/CookieConsent.ascx" %>

<!--  #include file="_includes/_Meta.ascx" -->

<%-- Main Sylehelper call --%>
<fortyfingers:STYLEHELPER ID="SHmain" runat="server"
  Doctype="HTML 5"
  BodyClass="c-page c-page--front c-page--[PageName] c-page--lvl-[PageLevel] c-page--lang-[Language] [BcId] [UserPageRoles]"
   />
<%-- Sylehelper Call To remove DNN css --%>
<fortyfingers:STYLEHELPER ID="SHremove" runat="server"
  RemoveCssFile="default.css,portal.css,container.css,module.css,searchskinobjectpreview.css,admin.css"
  IfUserMode="None" />
<%-- Sylehelper call for IE8 --%>
<fortyfingers:STYLEHELPER ID="SHie" runat="server"
  IfBrowser="IE<9"
  AddJsFile="[S]scripts/respond/respond.min.js" />
<%-- Sylehelper call for IE9 --%>
<fortyfingers:STYLEHELPER ID="STYLEHELPER1" runat="server"
  IfBrowser="IE=9"
  AddJsFile="[S]scripts/jquery-placeholder/jquery.placeholder.min.js" />

<!--  #include file="_includes/Header.ascx" -->

<main class="c-page-content" role="main" onload="loaded()">
  <section class="c-page-section c-page-section--front c-page-section--highlight">
    <div class="o-grid-container">
      <div class="o-grid-row">
        <%-- Naslovnica - Hero Slider --%>
        <div id="Izdvojeno" runat="server" class="pane pane--hero"></div>
        <%-- Naslovnica - Raspored --%>
        <div id="Raspored" runat="server" class="pane pane--schedule"></div>
      </div>
    </div>
  </section>
  <section class="c-page-section c-page-section--front c-page-section--content">
    <div class="o-grid-container">
      <div class="o-grid-row">
        <%-- Naslovnica - Novosti --%>
        <div id="ContentPane" runat="server" class="pane pane--news"></div>
        <%-- Naslovnica - Ansambl Newsletter Facebook --%>
        <div id="InfoDesno" runat="server" class="pane pane--extra-info"></div>
      </div>
	  <%-- Mala naslovnica - Predstave --%>
      <div id="ShowsPane" runat="server" class="pane pane--shows"></div>
    </div>
  </section>
  <section class="c-page-section c-page-section--front c-page-section--promo">
    <%-- Naslovnica - VideoGallery --%>
    <div id="VideoGallery" runat="server" class="pane pane--videogallery"></div>

    <div class="o-grid-container">
        <%-- Naslovnica - Promocijonalni / Sales prostor --%>
        <div id="Promo" runat="server" class="pane pane--promotion"></div>
    </div>
  </section>
</main>

<dnn:CookieConsent runat="server" CookieTheme="" />

<!--  #include file="_includes/Footer.ascx" -->

<%-- All script calls go here --%>
<!--  #include file="_includes/_Scripts.ascx" -->

<%-- Frontpage only scripts go here --%>
