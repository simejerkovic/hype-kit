<%-- Placed in head of the document --%>
<dnn:DnnJsInclude runat="server" FilePath="scripts/modernizr/modernizr-custom.js" PathNameAlias="SkinPath" ForceProvider="DnnFormBottomProvider" Priority="6" />
<%-- Dependency: Modernizr, must be declared right after modernizr  --%>
<dnn:DnnJsInclude runat="server" FilePath="scripts/detectizr/detectizr.js" PathNameAlias="SkinPath" ForceProvider="DnnFormBottomProvider" Priority="7" />

<%-- Placed at the end of the document so the pages load faster --%>
<%-- Plugins --%>
<dnn:DnnJsInclude runat="server" FilePath="scripts/lazysizes/bgset/ls.bgset.min.js" PathNameAlias="SkinPath" ForceProvider="DnnFormBottomProvider" Priority="101" />
<dnn:DnnJsInclude runat="server" FilePath="scripts/lazysizes/lazysizes.js" PathNameAlias="SkinPath" ForceProvider="DnnFormBottomProvider" Priority="102" />
<dnn:DnnJsInclude runat="server" FilePath="scripts/custom/off-canvas.js" PathNameAlias="SkinPath" ForceProvider="DnnFormBottomProvider" Priority="110" />
<dnn:DnnJsInclude runat="server" FilePath="scripts/match-height/jquery.matchHeight-min.js" PathNameAlias="SkinPath" ForceProvider="DnnFormBottomProvider" Priority="111" />
<dnn:DnnJsInclude runat="server" FilePath="scripts/custom/classList-polyfill.js" PathNameAlias="SkinPath" ForceProvider="DnnFormBottomProvider" Priority="112" />
<dnn:DnnJsInclude runat="server" FilePath="scripts/iscroll-master/iscroll.js" PathNameAlias="SkinPath" ForceProvider="DnnFormBottomProvider" Priority="113" />
<%-- Plugin Calls and Scripts --%>
<dnn:DnnJsInclude runat="server" FilePath="scripts/main.js" PathNameAlias="SkinPath" ForceProvider="DnnFormBottomProvider" Priority="120" />
