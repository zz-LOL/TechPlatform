<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
   - This page provides the options for administering supervisor settings
   --%>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"
    prefix="fmt" %>

<%@ page import="javax.servlet.jsp.jstl.fmt.LocaleSupport" %>

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/bootstrap/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/content.css"/>
    </head>

    <div class="content">
<h3><fmt:message key="jsp.dspace-admin.supervise-main.heading"/>
<dspace:popup page="<%= LocaleSupport.getLocalizedMessage(pageContext, \"help.site-admin\") + \"#supervision\"%>"><fmt:message key="jsp.morehelp"/></dspace:popup>
</h3>

<h4><fmt:message key="jsp.dspace-admin.supervise-main.subheading"/></h4>

<br/>

<%-- form to navigate to any of the three options available --%>
<form method="post" action="">
    <div>
    	<input class="btn btn-primary col-md-6 col-md-offset-3 item-jd" type="submit" name="submit_add" value="<fmt:message key='jsp.dspace-admin.supervise-main.add.button'/>"/>
    </div>
    <div>
    	<input class="btn btn-info col-md-6 col-md-offset-3 item-jd" type="submit" name="submit_view" value="<fmt:message key='jsp.dspace-admin.supervise-main.view.button'/>"/>
    </div>
    <div>    
    	<input class="btn btn-warning col-md-6 col-md-offset-3 item-jd" type="submit" name="submit_clean" value="<fmt:message key='jsp.dspace-admin.supervise-main.clean.button'/>"/>
    </div>
</form>

</div>
</html>
