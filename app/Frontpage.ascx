<%@ Control Language="C#" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<!--  #include file="_includes/_common-resources.ascx" -->

<!--  #include file="_includes/svg-icons.html" -->

<!--  #include file="_includes/header.ascx" -->

<main class="c-page-content" role="main">
    <div class="c-hero" style="height: 630px">
        <div id="HeroPane" runat="server" class="pane"></div>
    </div>
    <div class="c-page-section c-page-section--front u-bg-color--brand">
        <div class="o-grid-container">
            <div id="ContentPane" runat="server" class="pane"></div>
        </div>
    </div>
</main>

<%-- <dnn:CookieConsent runat="server" CookieTheme="" /> --%>

<!--  #include file="_includes/footer.ascx" -->

<%-- All script calls go here --%>
<!--  #include file="_includes/_scripts.ascx" -->
