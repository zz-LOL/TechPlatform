<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Form requesting a Handle or internal item ID for item editing
  -
  - Attributes:
  -     invalid.id  - if this attribute is present, display error msg
  --%>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"
    prefix="fmt" %>


<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<%@ page import="javax.servlet.jsp.jstl.fmt.LocaleSupport" %>

<%@ page import="org.dspace.core.ConfigurationManager" %>

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/bootstrap/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="../css/content.css"/>
    </head>
    <div class="content">
	<%-- <h1>Edit or Delete Item</h1> --%>
	<h3><fmt:message key="jsp.tools.get-item-id.heading"/>
	<dspace:popup page="<%= LocaleSupport.getLocalizedMessage(pageContext, \"help.site-admin\") + \"#items\"%>"><fmt:message key="jsp.morehelp"/></dspace:popup>
	</h3>
    
<%
    if (request.getAttribute("invalid.id") != null) { %>
    <%-- <p><strong>The ID you entered isn't a valid item ID.</strong>  If you're trying to
    edit a community or collection, you need to use the --%>
    <%-- <a href="<%= request.getContextPath() %>/dspace-admin/edit-communities">communities/collections admin page.</a></p> --%>
	<p class="alert alert-warning"><fmt:message key="jsp.tools.get-item-id.info1">
        <fmt:param><%= request.getContextPath() %>/dspace-admin/edit-communities</fmt:param>
    </fmt:message></p>
<%  } %>

    <%-- <p>Enter the Handle or internal item ID of the item you want to edit or
    delete.  <dspace:popup page="/help/site-admin.html#items">More help...</dspace:popup></p> --%>

    <span class="p1"><fmt:message key="jsp.tools.get-item-id.info2"/></span>       
    
    <form method="get" action="">
    	<div class="tm">
            <label for="thandle" style="width: 10%;"><fmt:message key="jsp.tools.get-item-id.handle"/></label>            
           	<span><input class="in" type="text" name="handle" id="thandle" value="<%= ConfigurationManager.getProperty("handle.prefix") %>/" size="12"/></span>
			<%-- <input type="submit" name="submit" value="Find" /> --%>
			<input class="find" type="submit" name="submit" value="<fmt:message key="jsp.tools.get-item-id.find.button"/>" />
		</div>
		<div class="tm">
			<label for="thandle" style="width: 10%;"><fmt:message key="jsp.tools.get-item-id.internal"/></label>
            <span><input class="in" type="text" name="item_id" id="titem_id" size="12"/></span>
			<%-- <input type="submit" name="submit" value="Find"> --%>
			<input class="find" type="submit" name="submit" value="<fmt:message key="jsp.tools.get-item-id.find.button"/>" />
 		</div>               
    </form>
</div>
</html>