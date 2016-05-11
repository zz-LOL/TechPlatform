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
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/content.css"/>
    <%-- <h1>Select an Item</h1> --%>  
    <div class="content">
<h3><fmt:message key="jsp.dspace-admin.item-select.heading"/>
<dspace:popup page="<%= LocaleSupport.getLocalizedMessage(pageContext, \"help.site-admin\") + \"#itempolicies\"%>"><fmt:message key="jsp.morehelp"/></dspace:popup>
</h3>
    
<%
    if (request.getAttribute("invalid.id") != null) { %>
    <%-- <p><strong>The ID you entered isn't a valid item ID.</strong>  If you're trying to
    edit a community or collection, you need to use the
    <a href="<%= request.getContextPath() %>/dspace-admin/edit-communities">communities/collections admin page.</a></p> --%>

    <p class="alert alert-warning"><fmt:message key="jsp.dspace-admin.item-select.text">
        <fmt:param><%= request.getContextPath() %>/dspace-admin/edit-communities</fmt:param>
    </fmt:message></p>
<%  } %>

    <%-- <p>Enter the Handle or internal item ID of the item you wish to select. --%>
    <div><fmt:message key="jsp.dspace-admin.item-select.enter"/></div>
      
    <form method="post" action="">
    	<div class="tm">
            <label class="lable-item" for="thandle"><fmt:message key="jsp.dspace-admin.item-select.handle"/></label>            
           	<span><input class="in" type="text" name="handle" id="thandle" value="<%= ConfigurationManager.getProperty("handle.prefix") %>/" size="12"/></span>
			<%-- <input type="submit" name="submit" value="Find" /> --%>
			<input class="find" type="submit" name="submit_item_select" value="<fmt:message key="jsp.dspace-admin.item-select.find"/>" />
		</div>
		<div class="tm">
			<label class="lable-item" for="thandle"><fmt:message key="jsp.dspace-admin.item-select.id"/></label>
            <span><input class="in" type="text" name="item_id" id="titem_id" size="12"/></span>
			<%-- <input type="submit" name="submit" value="Find"> --%>
			<input class="find" type="submit" name="submit_item_select" value="<fmt:message key="jsp.dspace-admin.item-select.find"/>" />
 		</div>               
    </form>
    <br/>
    <form method="post" action="">
    	<div class="tm col-md-offset-11">
    		<input class="btn btn-default" type="submit" name="submit_collection_select_cancel" value="<fmt:message key="jsp.dspace-admin.general.cancel"/>" />
    	</div>
   	</form>
    </div>
</html>