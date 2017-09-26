<%-- Remove default DNN css files --%>
<dnn:DnnCssExclude runat="server" Name="DnnDefault" />

<%-- If User is in role Admin,SuperUser or Urednik / Editor add a default DNN 8.0 css --%>
<% if((DotNetNuke.Security.PortalSecurity.IsInRoles(PortalSettings.AdministratorRoleName)) && (DotNetNuke.Security.PortalSecurity.IsInRoles("Urednik"))) { %>
    <dnn:DnnCssInclude runat="server" FilePath="~/resources/shared/stylesheets/dnndefault/8.0.0/default.css" Name="dnndefault" Version="8.0.0" />
<% } %>

<% if (DotNetNuke.Security.PortalSecurity.IsInRoles(PortalSettings.AdministratorRoleName) || PortalSettings.Current.UserInfo.IsSuperUser){ %>
       <dnn:DnnCssInclude runat="server" FilePath="~/resources/shared/stylesheets/dnndefault/8.0.0/default.css" Name="dnndefault" Version="8.0.0" />
<% } %>

<%-- Placed in head of the document --%>
<dnn:DnnJsInclude runat="server" FilePath="scripts/modernizr/modernizr-custom.js" PathNameAlias="SkinPath" ForceProvider="DnnFormBottomProvider" Priority="6" />
<%-- Dependency: Modernizr, must be declared right after modernizr  --%>
<dnn:DnnJsInclude runat="server" FilePath="scripts/detectizr/detectizr.js" PathNameAlias="SkinPath" ForceProvider="DnnFormBottomProvider" Priority="7" />

<%-- Placed at the end of the document so the pages load faster --%>
<%-- Plugins --%>
<dnn:DnnJsInclude runat="server" FilePath="scripts/lazysizes/plugins/bgset/ls.bgset.min.js" PathNameAlias="SkinPath" ForceProvider="DnnFormBottomProvider" Priority="101" />
<dnn:DnnJsInclude runat="server" FilePath="scripts/lazysizes/lazysizes.min.js" PathNameAlias="SkinPath" ForceProvider="DnnFormBottomProvider" Priority="102" />
<%-- <dnn:DnnJsInclude runat="server" FilePath="scripts/custom/off-canvas.js" PathNameAlias="SkinPath" ForceProvider="DnnFormBottomProvider" Priority="110" />  --%>
<dnn:DnnJsInclude runat="server" FilePath="scripts/custom/header.js" PathNameAlias="SkinPath" ForceProvider="DnnFormBottomProvider" Priority="110" />
<%-- Plugin Calls and Scripts --%>
<dnn:DnnJsInclude runat="server" FilePath="scripts/main.js" PathNameAlias="SkinPath" ForceProvider="DnnFormBottomProvider" Priority="120" />
