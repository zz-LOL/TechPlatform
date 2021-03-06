<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
   - This page displays an error message when no WorkspaceItem exists or 
   - the administrator does not select a WorkspaceItem
   --%>

<% request.setAttribute("LanguageSwitch", "hide"); %>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"
    prefix="fmt" %>
    
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/bootstrap/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/content.css"/>
    </head>

    <div class="content">

<h1><fmt:message key="jsp.dspace-admin.supervise-no-workspaceitem.heading"/></h1>

<p class="alert alert-danger"><fmt:message key="${errorKey}"/></p>

<div class="text-center">
<a href="<%= request.getContextPath() %>/dspace-admin/supervise"><fmt:message key="jsp.dspace-admin.supervise-no-workspaceitem.return"/></a>
</div>

</div>
</html>
