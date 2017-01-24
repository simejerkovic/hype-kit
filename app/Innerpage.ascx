<%@ Control Language="C#" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="BREADCRUMB" Src="~/Admin/Skins/BreadCrumb.ascx" %>
<!--  #include file="_includes/_common-resources.ascx" -->

<!--  #include file="_includes/header.ascx" -->

<main class="c-page-content c-page-content--inner" role="main">
    <div class="c-hero">
        <div id="HeroPane" runat="server" class="pane"></div>
        <%-- If HeroPane has content don't show breadcrumb and page title --%>
        <% if((HeroPane.Attributes["class"] ?? "").Contains("DNNEmptyPane")) { %>
            <div class="o-grid-container">
                <div class="c-breadcrumb">
                    <dnn:BREADCRUMB ID="dnnBreadcrumb" runat="server" CssClass="c-breadcrumb__link" RootLevel="0" Separator="<span class='c-breadcrumb__separator'>/</span>" HideWithNoBreadCrumb="true" />
                </div>
                <div class="c-headline">
                    <h1 class="c-page__title"><%= PortalSettings.ActiveTab.Title %></h1>
                </div>
            </div>
        <% } %>
        <%-- End If --%>
    </div>
    <div class="inner-page__wrapper o-grid-container">
        <div class="c-page-section">
            <div id="ContentPane" runat="server" class="pane"></div>
        </div>
        <div class="c-page-section o-grid-row">
            <div class="c-page-content__navigation">
                <dnn:MENU MenuStyle="nav/aside-nav" runat="server" NodeSelector="+0,0,1"></dnn:MENU>
                <div id="P1_Content_Nav" runat="server" class="pane"></div>
            </div>
            <div class="c-page-content__main <%= (P1_Content_Sidebar.Attributes["class"] ?? "").Contains("DNNEmptyPane") ? "" : "has-sidebar" %>">
                <div id="P1_Content_Main" runat="server" class="pane"></div>
            </div>
            <div id="P1_Content_Sidebar" runat="server" class="c-page-content__sidebar pane"></div>
        </div>
    </div>
</main>

<%-- <dnn:CookieConsent runat="server" CookieTheme="" /> --%>

<!--  #include file="_includes/footer.ascx" -->

<%-- All script calls go here --%>
<!--  #include file="_includes/_scripts.ascx" -->
