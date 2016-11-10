<%@ Control Language="C#" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LANGUAGE" Src="~/Admin/Skins/Language.ascx" %>
<%@ Register TagPrefix="dnn" TagName="BREADCRUMB" Src="~/Admin/Skins/BreadCrumb.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TEXT" Src="~/Admin/Skins/Text.ascx" %>
<%@ Register TagPrefix="dnn" TagName="COPYRIGHT" Src="~/Admin/Skins/Copyright.ascx" %>
<%@ Register TagPrefix="dnn" TagName="META" Src="~/Admin/Skins/Meta.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.DDRMenu.TemplateEngine" Assembly="DotNetNuke.Web.DDRMenu" %>
<%@ Register TagPrefix="dnn" TagName="MENU" Src="~/DesktopModules/DDRMenu/Menu.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="fortyfingers" TagName="STYLEHELPER" Src="~/DesktopModules/40Fingers/SkinObjects/StyleHelper/StyleHelper.ascx" %>
<%@ Register TagPrefix="dnn" TagName="COOKIECONSENT" Src="~/DesktopModules/DnnC_CookieConsent/CookieConsent.ascx" %>

<%-- Main Sylehelper call --%>
<fortyfingers:STYLEHELPER ID="SHmain" runat="server"
  Doctype="HTML 5"
  BodyClass="c-page c-page--front c-page--[PageName] c-page--lang-[Language] [BcId]" />

<%-- Sylehelper Call To remove DNN css --%>
<fortyfingers:STYLEHELPER ID="SHremove" runat="server"
  RemoveCssFile="default.css,admin.css,portal.css,module.css,container.css,searchskinobjectpreview.css"
  IfUserMode="None" />

<!--  #include file="_includes/_meta.ascx" -->
<!--  #include file="_includes/header.ascx" -->

<main class="c-page-content" role="main">
  <section class="c-page-section c-page-section--front">
    <div class="o-grid-container">
      <div class="o-grid-row">
        <div id="ContentPane" runat="server" class="pane"></div>
      </div>
    </div>
  </section>
</main>

<dnn:CookieConsent runat="server" CookieTheme="" />

<!--  #include file="_includes/footer.ascx" -->

<%-- All script calls go here --%>
<!--  #include file="_includes/_scripts.ascx" -->
