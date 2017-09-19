<%@ Register TagPrefix="dnn" TagName="COPYRIGHT" Src="~/Admin/Skins/Copyright.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LANGUAGE" Src="~/Admin/Skins/Language.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="META" Src="~/Admin/Skins/Meta.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SEARCH" Src="~/Admin/Skins/Search.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.DDRMenu.TemplateEngine" Assembly="DotNetNuke.Web.DDRMenu" %>
<%@ Register TagPrefix="dnn" TagName="MENU" Src="~/DesktopModules/DDRMenu/Menu.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="fortyfingers" TagName="STYLEHELPER" Src="~/DesktopModules/40Fingers/SkinObjects/StyleHelper/StyleHelper.ascx" %>
<%@ Register TagPrefix="dnn" TagName="COOKIECONSENT" Src="~/DesktopModules/DnnC_CookieConsent/CookieConsent.ascx" %>

<%-- DNN: Standard meta calls, injected into head tag --%>
<dnn:META ID="META1" runat="server" InsertFirst="true" Name="viewport" Content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<dnn:META ID="META2" runat="server" Name="mobile-web-app-capable" Content="yes" />
<dnn:META ID="META3" runat="server" Name="apple-mobile-web-app-title" Content="Hypekit" />
<dnn:META ID="META4" runat="server" Name="application-name" Content="Hypekit" />
<dnn:META ID="META5" runat="server" Name="msapplication-TileColor" Content="#2b5797" />
<dnn:META ID="META6" runat="server" Name="msapplication-TileImage" content="/Portals/0/Images/favicons/mstile-144x144.png?v=dLLkRzL3MB" />
<dnn:META ID="META7" runat="server" Name="msapplication-config" content="/Portals/0/browserconfig.xml?v=dLLkRzL3MB" />
<dnn:META ID="META8" runat="server" Name="theme-color" content="#ffffff" />

<%-- DNN: Inject into head and body onLoad and OnPreRender --%>
<script runat="server">

	protected override void OnPreRender(EventArgs e)
	{
		base.OnPreRender(e);
		AddCSSClassesToBody_OnPreRender();
	}

    // DNN: Insert classes to body OnPreRender
	private void AddCSSClassesToBody_OnPreRender()
	{
		var PortalSettings = DotNetNuke.Entities.Portals.PortalSettings.Current;
		// add language, edit mode, tab-id and root-tab-id to body css class
		string CssClass = "tab-id-" + PortalSettings.ActiveTab.TabID.ToString() + " ";
        // add class role-admin if current user is in role Administrators
		if(DotNetNuke.Security.PortalSecurity.IsInRoles(PortalSettings.AdministratorRoleName))
		CssClass += "role-admin ";
        // add class role-editor if current user is in role Urednik
        if(DotNetNuke.Security.PortalSecurity.IsInRoles("Urednik"))
		CssClass += "role-editor ";
    	CssClass += "tab-level-" + PortalSettings.ActiveTab.Level + " ";
		CssClass += "root-id-" + ((DotNetNuke.Entities.Tabs.TabInfo)PortalSettings.ActiveTab.BreadCrumbs[0]).TabID.ToString() + " ";
		var rootTab = ((DotNetNuke.Entities.Tabs.TabInfo)PortalSettings.ActiveTab.BreadCrumbs[0]);
		rootTab = rootTab.IsDefaultLanguage || rootTab.IsNeutralCulture ? rootTab : rootTab.DefaultLanguageTab;
		//CssClass += "lang-root-id" + rootTab.TabID + " ";
		CssClass += "lang-" + System.Threading.Thread.CurrentThread.CurrentCulture.TwoLetterISOLanguageName.ToLower() + " ";
		CssClass += (PortalSettings.HomeTabId == PortalSettings.ActiveTab.TabID ? "c-page--home" : "c-page--inner") + " ";
		CssClass += "portal-" + PortalSettings.Current.PortalId;
		CssClass += " c-page--default "; // c-page--default
		HtmlGenericControl body = (HtmlGenericControl)this.Page.FindControl("ctl00$body");
		body.Attributes["class"] = CssClass;
	}
</script>

<script runat="server">

	protected override void OnLoad(EventArgs e)
	{
		base.OnLoad(e);

		// Insert favicons into head
		AttachCustomHeader("<link rel='apple-touch-icon' sizes='57x57' href='/Portals/0/Images/favicons/apple-touch-icon-57x57.png?v=dLLkRzL3MB'>" +
			"<link rel='apple-touch-icon' sizes='60x60' href='/Portals/0/Images/favicons/apple-touch-icon-60x60.png?v=dLLkRzL3MB'>" +
			"<link rel='apple-touch-icon' sizes='72x72' href='/Portals/0/Images/favicons/apple-touch-icon-72x72.png?v=dLLkRzL3MB'>" +
			"<link rel='apple-touch-icon' sizes='76x76' href='/Portals/0/Images/favicons/apple-touch-icon-76x76.png?v=dLLkRzL3MB'>" +
			"<link rel='apple-touch-icon' sizes='114x114' href='/Portals/0/Images/favicons/apple-touch-icon-114x114.png?v=dLLkRzL3MB'>" +
			"<link rel='apple-touch-icon' sizes='120x120' href='/Portals/0/Images/favicons/apple-touch-icon-120x120.png?v=dLLkRzL3MB'>" +
			"<link rel='apple-touch-icon' sizes='144x144' href='/Portals/0/Images/favicons/apple-touch-icon-144x144.png?v=dLLkRzL3MB'>" +
			"<link rel='apple-touch-icon' sizes='152x152' href='/Portals/0/Images/favicons/apple-touch-icon-152x152.png?v=dLLkRzL3MB'>" +
			"<link rel='apple-touch-icon' sizes='180x180' href='/Portals/0/Images/favicons/apple-touch-icon-180x180.png?v=dLLkRzL3MB'>" +
			"<link rel='icon' type='image/png' href='/Portals/0/Images/favicons/favicon-32x32.png?v=dLLkRzL3MB' sizes='32x32'>" +
			"<link rel='icon' type='image/png' href='/Portals/0/Images/favicons/android-chrome-192x192.png?v=dLLkRzL3MB' sizes='192x192'>" +
			"<link rel='icon' type='image/png' href='/Portals/0/Images/favicons/favicon-96x96.png?v=dLLkRzL3MB' sizes='96x96'>" +
			"<link rel='icon' type='image/png' href='/Portals/0/Images/favicons/favicon-16x16.png?v=dLLkRzL3MB' sizes='16x16'>" +
			"<link rel='manifest' href='/Portals/0/manifest.json?v=dLLkRzL3MB'>" +
			"<link rel='mask-icon' href='/Portals/0/Images/favicons/safari-pinned-tab.svg?v=dLLkRzL3MB' color='#5bbad5'>" +
			"<link rel='shortcut icon' href='/Portals/0/Images/favicons/favicon.ico?v=dLLkRzL3MB'>");

        // If the browser version is not above IE9 insert polyfill scripts
        AttachCustomHeader("<!--[if lt IE 9]>" +
            "<script type='text/javascript' src='https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js'></scr" + "ipt>" +
            "<script type='text/javascript' src='https://oss.maxcdn.com/respond/1.4.2/respond.min.js'></scr" + "ipt>" +
            "<![endif]-->");
	}

	protected void AttachExternalCSS(string CSSPath) { AttachCustomHeader("<link type='text/css' rel='stylesheet' href='" + CSSPath + "' />"); }
	protected void AttachExternalJS(string JSPath) { AttachCustomHeader("<script type='text/javascript' src='" + JSPath + "'></scr" + "ipt>"); }
	protected void AttachCustomHeader(string CustomHeader) { HtmlHead HtmlHead = (HtmlHead)Page.FindControl("Head"); if ((HtmlHead != null)) { HtmlHead.Controls.Add(new LiteralControl(CustomHeader));	}	}

    // Localization string to replace the standard DNN:TEXT control
    protected string LocalizeString(string key)
    {
        return Localization.GetString(key, Localization.GetResourceFile(this, System.IO.Path.GetFileName(this.AppRelativeVirtualPath)));
    }
</script>
