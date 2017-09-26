<%@ Control language="C#" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.DDRMenu.TemplateEngine" Assembly="DotNetNuke.Web.DDRMenu" %>
<%@ Register TagPrefix="dnn" TagName="MENU" src="~/DesktopModules/DDRMenu/Menu.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>

<%-- For classic localize string use this --%>
<a class="sr-only sr-only-focusable" href="#content"><%# LocalizeString("SkipLink.MainContent") %></a>

<%-- Header component with logo image located in skin and dimensions with c# image resizer --%>
<header>
    <dnn:MENU MenuStyle="nav/primary-nav" NodeSelector="*,0,6" runat="server" />
    <a class="c-logo" href="/" title="">
        <img src="<%#SkinPath%>images/brand/logo.png?w=340&amp;quality=100" alt="" />
    </a>
</header>

<%-- Checks the header pane is empty and adds class based on the result --%>
<div class="header-pane__inner<%# (HeaderPane.Attributes["class"] ?? "").Contains("DNNEmptyPane") ? "header-pane-empty" : "" %>">
    <div id="HeaderPane" runat="server" containertype="G" containername="clean-container" containersrc="default.ascx"></div>
</div>

<%-- Checks if the page url is "shop.sistemi.hr" and displays login and register elements
     Can be useful for webshop and catalog websites --%>
<div class="links" runat="server" visible='<%# Context.Request.Url.Host = "shop.sistemi.hr" %>'>
    <div class="myaccount">
        <dnn:USER ID="dnnUser" runat="server" LegacyMode="false" />
    </div>
    <div class="login">
        <dnn:LOGIN ID="dnnLogin" CssClass="LoginLink" runat="server" LegacyMode="false" />
    </div>
</div>

<%-- Forces panes to always have specific container --%>
<div id="ContentPane" runat="server" containertype="G" containername="clean-container" containersrc="default.ascx"></div>

<%-- Standard sub navigation call that displays current children of the page --%>
<dnn:MENU MenuStyle="nav/sub" NodeSelector="CurrentChildren" runat="server" />

<%-- Checks the current language and includes footer for that lanugage --%>
<% if(System.Threading.Thread.CurrentThread.CurrentCulture.TwoLetterISOLanguageName.ToLower() == "hr") { %>
     <!--  #include file="_includes/Footer.ascx" -->
<% }
else { %>
    <!--  #include file="_includes/Footer_en.ascx" -->
<% } %>

<%-- Standard footer call with aria and itemscope types --%>
<footer>
  <div class="container-fluid">
    <div class="c-container-inner clearfix">
      <ul class="c-footer-address clearfix" itemscope itemtype="http://schema.org/LocalBusiness">
    		<li>
    			<strong itemprop="name"></strong>
    		</li>
    		<li>
    			<span itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
    				<span itemprop="streetAddress">Velebitska 27</span>,
    				<span itemprop="postalCode">21000</span>
    				<span itemprop="addressLocality">Split</span>,
    				<span itemprop="addressCountry">Croatia</span>
    			</span>
    		</li>
        <li>
          tel: <a href="tel:+0000">0000</a>
        </li>
    		<li>
    		  email:
    		</li>
      </ul>
      <div class="c-footer-imprint">
          <dnn:login id="DnnLogin" cssclass="c-login hidden-xs" runat="server" />
          <a href="<%# LocalizeString("Imprint.Url") %>" title="Impressum"><%# LocalizeString("Imprint.Text") %></a>
      </div>
    </div>
  </div>
</footer>

<%-- All script calls go here --%>
<dnn:DnnJsInclude runat="server" FilePath="scripts/all.js" ForceProvider="DnnFormBottomProvider" Priority="130" PathNameAlias="SkinPath" />

<%-- DNN: Inject into head, onLoad and OnPreRender --%>
<script runat="server">
	protected override void OnPreRender(EventArgs e)
	{
		base.OnPreRender(e);
	}

	protected override void OnLoad(EventArgs e)
	{
		base.OnLoad(e);

		AttachCustomHeader("<meta name='viewport' content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no' />");
		AttachCustomHeader("<!--[if lt IE 9]>" +
			"<script type='text/javascript' src='https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js'></scr" + "ipt>" +
			"<script type='text/javascript' src='https://oss.maxcdn.com/respond/1.4.2/respond.min.js'></scr" + "ipt>" +
			"<![endif]-->");
	}

	protected void AttachExternalCSS(string CSSPath) { AttachCustomHeader("<link type='text/css' rel='stylesheet' href='" + CSSPath + "' />"); }
	protected void AttachExternalJS(string JSPath) { AttachCustomHeader("<script type='text/javascript' src='" + JSPath + "'></scr" + "ipt>"); }
	protected void AttachCustomHeader(string CustomHeader) { HtmlHead HtmlHead = (HtmlHead)Page.FindControl("Head"); if ((HtmlHead != null)) { HtmlHead.Controls.Add(new LiteralControl(CustomHeader));	}	}

	protected string LocalizeString(string key)
	{
			return Localization.GetString(key, Localization.GetResourceFile(this, System.IO.Path.GetFileName(this.AppRelativeVirtualPath)));
	}
</script>
