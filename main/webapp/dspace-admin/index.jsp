<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="org.dspace.app.webui.util.JSPManager" %>
<%@ page import="org.dspace.core.ConfigurationManager" %>
<%@ page import="javax.servlet.jsp.jstl.core.*" %>
<%@ page import="javax.servlet.jsp.jstl.fmt.*" %>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.dspace.eperson.EPerson" %>

<%
	String siteName = ConfigurationManager.getProperty("dspace.name");
	EPerson user = (EPerson) request.getAttribute("dspace.current.user");
	// E-mail may have to be truncated
    String navbarEmail = null;

    if (user != null)
    {
        navbarEmail = user.getEmail();
    }
%>
<!DOCTYPE html>
<html>
	<head>
    	<title><%= siteName %></title>
        <link href="<%= request.getContextPath() %>/favicon.ico" rel="shortcut icon" type="image/icon"/>
        <link rel="stylesheet" type="text/css" href="../static/css/bootstrap/bootstrap.min.css"/>        
    	<link rel="stylesheet" type="text/css" href="../css/admin.css"/>
        <script type='text/javascript' src="<%= request.getContextPath() %>/static/js/jquery/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="../static/js/bootstrap/bootstrap.min.js"></script>
        <script>
			$(function(){
				var flag=0;
				$(".zk").hide();
				$(".dd").click(function(){
					if(flag==0){
						$(this).parent().find(".zk").show();
						$(this).find(".la").attr("src","../image/up.png");
						flag=1;
					}
					else{
						$(this).parent().find(".zk").hide();
						$(this).find(".la").attr("src","../image/down.png");
						flag=0;
					}
				});
				$(".task-items>li:first-child").click(function(){
					$(".zk img").attr("src","../image/items-mr.png");
					$(".zk>ul>li").css("background","#f8f8f8");
					$(this).css("background","#fff");
				});
				$(".zk>ul>li").click(function(){
                                        var txt=$(this).text();
					$(".task-items>li").css("background","#f8f8f8");
                                        $(".zk>ul>li").css("background","#f8f8f8");
					$(this).css("background","url(../image/item-rs.png)");
					$(this).css("background-size","100% 100%");
					$(".zk img").attr("src","../image/items-mr.png");
					$(this).find("img").attr("src","../image/items-xz.png");
                                        $(".title span").text(txt);
				});
                                $("#tjbb").click(function(){
                                    var txt=$(this).text();
                                    $(".title span").text(txt);
                                });
			});
		</script>
    </head>
    <body>
    	<div id="navbar">
        	<h4>科技成果及资料发布平台管理系统</h4>
          	<ul class="menu">
            	<li><a class="home" href="<%=request.getContextPath()%>/">网站主页</a></li>
                <li class="dropdown">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown"><fmt:message key="jsp.layout.navbar-default.loggedin"> <fmt:param><%= StringUtils.abbreviate(navbarEmail, 20) %></fmt:param></fmt:message><b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="<%= request.getContextPath() %>/mydspace"><fmt:message key="jsp.layout.navbar-default.users"/></a></li>
                        <li><a href="<%= request.getContextPath() %>/subscribe"><fmt:message key="jsp.layout.navbar-default.receive"/></a></li>
                        <li><a href="<%= request.getContextPath() %>/profile"><fmt:message key="jsp.layout.navbar-default.edit"/></a></li> 
                        <li><a href="<%= request.getContextPath() %>/logout"><span class="glyphicon glyphicon-log-out"></span> <fmt:message key="jsp.layout.navbar-default.logout"/></a>
                </li>  	
            		</ul>
             	</li>
            </ul>
        </div>
        <div id="content">
        	<div class="task-list">
            	<ul class="task-items">
                	<li id="tjbb" onClick="javascript:document.getElementById('iframe').src='<%= request.getContextPath() %>/statistics'">
                    	<img class="tb" src="../image/tjbb-mr.png"/><fmt:message key="jsp.layout.navbar-admin.statistics"/>
                    </li>
                    <ul>
                    <li class="dd" id="nr">
                    	<span><img class="tb" src="../image/nr-mr.png"/><fmt:message key="jsp.layout.navbar-admin.contents"/></span><img class="la" src="../image/down.png"/>
                     </li>
                     <li class="zk">
                        <ul>
                           <li onClick="javascript:document.getElementById('iframe').src='<%= request.getContextPath() %>/dspace-admin/workflow'">
                               <img src="../image/items-mr.png"/><fmt:message key="jsp.layout.navbar-admin.workflow"/></li>
                           <li onClick="javascript:document.getElementById('iframe').src='<%= request.getContextPath() %>/dspace-admin/supervise'">
                               <img src="../image/items-mr.png"/><fmt:message key="jsp.layout.navbar-admin.supervisors"/></li>
                           <li onClick="javascript:document.getElementById('iframe').src='<%= request.getContextPath() %>/dspace-admin/curate'">
                               <img src="../image/items-mr.png"/><fmt:message key="jsp.layout.navbar-admin.curate"/></li>
                           <li onClick="javascript:document.getElementById('iframe').src='<%= request.getContextPath() %>/dspace-admin/privateitems'">
                               <img src="../image/items-mr.png"/><fmt:message key="jsp.layout.navbar-admin.privateitems"/></li>
                           <li onClick="javascript:document.getElementById('iframe').src='<%= request.getContextPath() %>/dspace-admin/metadataimport'">
                               <img src="../image/items-mr.png"/><fmt:message key="jsp.layout.navbar-admin.metadataimport"/></li>
                           <li onClick="javascript:document.getElementById('iframe').src='<%= request.getContextPath() %>/dspace-admin/batchimport'">
                               <img src="../image/items-mr.png"/><fmt:message key="jsp.layout.navbar-admin.batchimport"/></li>
                           <li onclick="javascript:form.submit()">
                               <img src="../image/items-mr.png"/><fmt:message key='jsp.tools.edit-collection.heading1'/>
                               <form name="form" method="post" action="<%=request.getContextPath()%>/tools/collection-wizard" target="iframe">
                                    <input type="hidden" name="community_id" value="1">               
                               </form>
                           </li>
                        </ul>
                    </li>
                    </ul>
                    <ul>
                        <li class="dd">
                    	<span><img class="tb" src="../image/fwkz-mr.png"/><fmt:message key="jsp.layout.navbar-admin.accesscontrol"/></span><img class="la" src="../image/down.png"/>
                    </li>
                    <li class="zk">
                    	<ul>
                           <li onClick="javascript:document.getElementById('iframe').src='<%= request.getContextPath() %>/dspace-admin/edit-epeople'"><img src="../image/items-mr.png"/><fmt:message key="jsp.layout.navbar-admin.epeople"/></li>
                           <li onClick="javascript:document.getElementById('iframe').src='<%= request.getContextPath() %>/tools/group-edit'"><img src="../image/items-mr.png"/><fmt:message key="jsp.layout.navbar-admin.groups"/></li>
                           <li onClick="javascript:document.getElementById('iframe').src='<%= request.getContextPath() %>/tools/authorize'"><img src="../image/items-mr.png"/><fmt:message key="jsp.layout.navbar-admin.authorization"/></li>
                        </ul>
                    </li>
                    </ul>
                    <ul>
                        <li class="dd">
                    	<span><img class="tb" src="../image/ybsz-mr.png"/><fmt:message key="jsp.layout.navbar-admin.settings"/></span><img class="la" src="../image/down.png"/>
                    </li>
                    <li class="zk">
                    	<ul>
                           <li onClick="javascript:document.getElementById('iframe').src='<%= request.getContextPath() %>/dspace-admin/metadata-schema-registry'"><img src="../image/items-mr.png"/><fmt:message key="jsp.layout.navbar-admin.metadataregistry"/></li>
                           <li onClick="javascript:document.getElementById('iframe').src='<%= request.getContextPath() %>/dspace-admin/format-registry'"><img src="../image/items-mr.png"/><fmt:message key="jsp.layout.navbar-admin.formatregistry"/></li>
                           <li onClick="javascript:document.getElementById('iframe').src='<%= request.getContextPath() %>/dspace-admin/news-edit'"><img src="../image/items-mr.png"/><fmt:message key="jsp.layout.navbar-admin.editnews"/></li>
                           <li onClick="javascript:document.getElementById('iframe').src='<%= request.getContextPath() %>/dspace-admin/license-edit'"><img src="../image/items-mr.png"/><fmt:message key="jsp.dspace-admin.license-edit.title"/></li>
                           <li onClick="javascript:document.getElementById('iframe').src='<%= request.getContextPath() %>/edit-lunbo.jsp'"><img src="../image/items-mr.png"/>首页轮播描述</li>
                           
                         </ul>
                    </li>
                    </ul>
                    <li>
                    	<img sclass="tb" src="../image/bz.png"/><dspace:popup page="<%= LocaleSupport.getLocalizedMessage(pageContext, \"help.site-admin\") %>"><fmt:message key="jsp.layout.navbar-admin.help"/></dspace:popup>
                    </li>
                </ul>
            </div>
            <div class="task-area">
                    <div class="title">
                        <span></span>
                    </div>
                    <iframe id="iframe" name="iframe" frameborder="0">
                            
                    </iframe>
                    <div class="ft">
                        <span>科技成果及资料发布平台管理系统</span>
                    </div>
            </div>
        </div>
    </body>
</html>
