<%@ Control language="C#" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.DDRMenu.TemplateEngine" Assembly="DotNetNuke.Web.DDRMenu" %>
<%@ Register TagPrefix="dnn" TagName="MENU" src="~/DesktopModules/DDRMenu/Menu.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>

<a class="sr-only sr-only-focusable" href="#content"><%= LocalizeString("SkipLink.MainContent") %></a>

<header>

  <dnn:MENU MenuStyle="nav/primary-nav" NodeSelector="*,0,6" runat="server" />

  <a class="c-logo" href="/" title="">
    <img src="<%=SkinPath%>images/brand/logo.png?w=340&amp;quality=100" alt="" />
  </a>

</header>

<div class="header-pane__inner<%= (HeaderPane.Attributes["class"] ?? "").Contains("DNNEmptyPane") ? "header-pane-empty" : "" %>">
		<div id="HeaderPane" runat="server" containertype="G" containername="clean-container" containersrc="default.ascx"></div>
</div>

<div id="ContentPane" runat="server" containertype="G" containername="clean-container" containersrc="default.ascx"></div>

<dnn:MENU MenuStyle="nav/sub" NodeSelector="CurrentChildren" runat="server" />

<footer>
  <div class="container-fluid">
    <div class="ly-container-inner clearfix">
      <ul class="ly-footer-address clearfix" itemscope itemtype="http://schema.org/LocalBusiness">
    		<li>
    			<strong itemprop="name"></strong>
    		</li>
    		<li>
    			<span itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
    				<span itemprop="streetAddress"></span>,
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
      <div class="ly-footer-imprint">
          <dnn:login id="DnnLogin" cssclass="ly-login hidden-xs" runat="server" />
          <a href="<%= LocalizeString("Imprint.Url") %>" title="Impressum"><%= LocalizeString("Imprint.Text") %></a>
      </div>
    </div>
  </div>
</footer>

<%-- All script calls go here --%>
<dnn:DnnJsInclude runat="server" FilePath="scripts/all.js" ForceProvider="DnnFormBottomProvider" Priority="130" PathNameAlias="SkinPath" />

<%-- DNN: Inject into head, onLoad and OnPreRender --%>
<script runat="server">

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

<%-- DNN: Body css classes --%>
<script runat="server">
	protected override void OnPreRender(EventArgs e)
	{
		base.OnPreRender(e);
		AddCSSClassesForSkinning();
	}
	private void AddCSSClassesForSkinning()
	{
		var PortalSettings = DotNetNuke.Entities.Portals.PortalSettings.Current;
		//add language, edit mode, tab-id and root-tab-id to body css class
		string CssClass = "tab-" + PortalSettings.ActiveTab.TabID.ToString() + " ";
		if(DotNetNuke.Security.PortalSecurity.IsInRoles(PortalSettings.AdministratorRoleName))
			CssClass += "role-admin ";
    CssClass += "tab-level-" + PortalSettings.ActiveTab.Level + " ";
		CssClass += "root-" + ((DotNetNuke.Entities.Tabs.TabInfo)PortalSettings.ActiveTab.BreadCrumbs[0]).TabID.ToString() + " ";
		var rootTab = ((DotNetNuke.Entities.Tabs.TabInfo)PortalSettings.ActiveTab.BreadCrumbs[0]);
		rootTab = rootTab.IsDefaultLanguage || rootTab.IsNeutralCulture ? rootTab : rootTab.DefaultLanguageTab;
		CssClass += "lang-root-" + rootTab.TabID + " ";
		CssClass += "lang-" + System.Threading.Thread.CurrentThread.CurrentCulture.TwoLetterISOLanguageName.ToLower() + " ";
		CssClass += (PortalSettings.HomeTabId == PortalSettings.ActiveTab.TabID ? "tab-home " : "") + " ";
		CssClass += "portal-" + PortalSettings.Current.PortalId;
		CssClass += " va-layout-default "; // va-layout-wide, va-layout-default, va-layout-box
		CssClass += " va-mainnav-right "; // va-mainnav-left, va-mainnav-right, va-mainnav-center
		HtmlGenericControl body = (HtmlGenericControl)this.Page.FindControl("ctl00$body");
		body.Attributes["class"] = CssClass;
	}
</script>
