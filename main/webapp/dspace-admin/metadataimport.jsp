<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Form to upload a csv metadata file
--%>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<%
    String message = (String)request.getAttribute("message");
    if (message == null)
    {
        message = "";
    }
    else
    {
        message = "<p><b>" + message + "</b></p>";
    }
%>

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/bootstrap/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/content.css"/>
        <script type='text/javascript' src="<%= request.getContextPath() %>/static/js/jquery/jquery-1.10.2.min.js"></script>
        <script>
            $(function(){
                $(".up-hide").change(function(){
                    var fname = $(".up-hide").val();
                    $(".in-import").val(fname);
                });
            });
        </script>
    </head>

    <div class="content">

    <h3><fmt:message key="jsp.dspace-admin.metadataimport.title"/></h3>

    <form method="post" enctype="multipart/form-data" action="">

        <%= message %>
            <input class="up-hide" type="file" name="file"/>
            <input type="submit" class="up-submit" value="浏览..."/>
            <input class="in-import" type="text" name="in-import" value="未选择文件"/>
            <br/>
            <br/>
            <input class="find" type="submit" name="submit" value="<fmt:message key="jsp.dspace-admin.general.upload"/>" />

    </form>
    
</div>
</html>
