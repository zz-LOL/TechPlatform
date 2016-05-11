<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>
<%@page import="java.util.Set"%>
<dspace:layout style="default" titlekey="browse.page-title">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/content.css"/>
    <script type='text/javascript' src="<%= request.getContextPath() %>/static/js/jquery/jquery-1.10.2.min.js"></script>
    <script>
        $(function(){
            $(".list li:first-child").addClass("bottom").addClass("red-font");
            $(".item").click(function(){
                $(this).addClass("bottom").siblings().removeClass("bottom");
                $(this).addClass("red-font").siblings().removeClass("red-font");
            });
        });
    </script>
    <script type="text/javascript" language="javascript">   
          function getData(browse_c){
              document.getElementById("browse_c").src = browse_c;
          }
          
          function setIframeHeight(id) { 
               var ifrm = document.getElementById(id); 
               var doc = ifrm.contentDocument? ifrm.contentDocument:  
                ifrm.contentWindow.document; 
              ifrm.style.visibility = 'hidden'; 
              ifrm.style.height = "10px"; // reset to minimal height ... 
              ifrm.style.height = getDocHeight( doc ) + 4 + "px"; 
               ifrm.style.visibility = 'visible'; 
} 
 
          function getDocHeight(doc) { 
               doc = doc || document; 
               var body = doc.body, html = doc.documentElement; 
               var height = Math.max( body.scrollHeight, body.offsetHeight,  
               html.clientHeight, html.scrollHeight, html.offsetHeight ); 
               return height; 
} 
    
    </script>
 
    <div id="tab">
        <ul class="list">
            <li class="item" onClick="getData('<%=request.getContextPath()%>/browse?type=author');">
                <fmt:message key="browse.menu.author"/>
            </li>
            <li class="item" onClick="getData('<%=request.getContextPath()%>/browse?type=subject');">
                <fmt:message key="browse.menu.subject"/>
            </li>
            <li class="item" onClick="getData('<%=request.getContextPath()%>/browse?type=title');">
                <fmt:message key="browse.menu.title"/>
            </li>
            <li class="item" onClick="getData('<%=request.getContextPath()%>/browse?type=dateissued');">
                <fmt:message key="browse.menu.dateissued"/>
            </li>
        </ul>
    </div>
    <div class="browse">
        <iframe id="browse_c" scrolling="no" src="<%=request.getContextPath()%>/browse?type=author" width="100%" onLoad="setIframeHeight(this.id)">
            
        </iframe>
    </div>
</dspace:layout>
