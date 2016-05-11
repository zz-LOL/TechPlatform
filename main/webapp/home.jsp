<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Home page JSP
  -
  - Attributes:
  -    communities - Community[] all communities in DSpace
  -    recent.submissions - RecetSubmissions
  --%>

<%@page import="org.dspace.core.Utils"%>
<%@page import="org.dspace.content.Bitstream"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Locale"%>
<%@ page import="javax.servlet.jsp.jstl.core.*" %>
<%@ page import="javax.servlet.jsp.jstl.fmt.LocaleSupport" %>
<%@ page import="org.dspace.core.I18nUtil" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>
<%@ page import="org.dspace.app.webui.components.RecentSubmissions" %>
<%@ page import="org.dspace.content.*" %>
<%@ page import="org.dspace.core.ConfigurationManager" %>
<%@ page import="org.dspace.core.NewsManager" %>
<%@ page import="org.dspace.browse.ItemCounter" %>
<%@ page import="org.dspace.content.Metadatum" %>
<%@ page import="org.dspace.app.webui.util.JSPManager" %>
<%@ page import="org.dspace.content.Item" %>

<%
    Community[] communities = (Community[]) request.getAttribute("communities");
    
   /*
    String tempURL=request.getContextPath()+"/handle/"+ communities[0].getHandle();
    JSPManager.showJSP(request, response,tempURL);*/

    Community community = (Community) request.getAttribute( "community" );
    Collection[] collections =
        (Collection[]) request.getAttribute("collections");
    
        

    Locale sessionLocale = UIUtil.getSessionLocale(request);
    Config.set(request.getSession(), Config.FMT_LOCALE, sessionLocale);
    String topNews = NewsManager.readNewsFile(LocaleSupport.getLocalizedMessage(pageContext, "news-top.html"));
    String sideNews = NewsManager.readNewsFile(LocaleSupport.getLocalizedMessage(pageContext, "news-side.html"));

    boolean feedEnabled = ConfigurationManager.getBooleanProperty("webui.feed.enable");
    String feedData = "NONE";
    if (feedEnabled)
    {
        feedData = "ALL:" + ConfigurationManager.getProperty("webui.feed.formats");
    }
    
    ItemCounter ic = new ItemCounter(UIUtil.obtainContext(request));

    RecentSubmissions submissions = (RecentSubmissions) request.getAttribute("recent.submissions");
%>

<!--!!!!!!!!通知切换效果js--->

<script language="javascript" type="text/javascript">
     var show2 = function(){
		 document.getElementById("divtwo").style.display = "block";
		 document.getElementById("divone").style.display = "block";
		 document.getElementById("image1").src = "image/tongzhi01.png";
		 document.getElementById("image2").src = "image/tongzhi04.png";
		 
		 };
		 
     var show1 = function(){
		 document.getElementById("divtwo").style.display = "block";
		 document.getElementById("divone").style.display = "block";
		 document.getElementById("image1").src = "image/tongzhi03.png";
		 document.getElementById("image2").src = "image/tongzhi02.png";
		 };
</script>
<dspace:layout locbar="nolink" titlekey="jsp.home.title" feedData="<%= feedData %>">
   <script language="javascript" type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
    <script>
        $(function(){
            //var f=0;
            //var t=setInterval(dong,5000);
            $(".list-group div:first-child").find("div.circle").css("background","#a90b00");
            $(".list-group-item").mouseover(function(){
                $(".circle").css("background","#9bc2e5");
                $(this).find("div.circle").css("background","#a90b00");
            });
            /*function dong(){
                if(f==0){
                $("#divtwo").css("left","231px");
                $("#divone").animate({left:"-231px"},2000);
                $("#divtwo").animate({left:"0"},2000);
                f=1;
                }
                else if(f==1){
                    $("#divone").css("left","231px");
                    $("#divtwo").animate({left:"-231px"},2000);
                    $("#divone").animate({left:"0"},2000);
                    f=0;
                }
            }*/
         });
        </script>
        
        <!--通知消息跑马灯-->
        <div style="z-index:10;width:100%;height:;float: left;line-height:28px;margin-top:5px;font-family:SimHei;font-size:14px;color: #687780; /*background-color: #F0F0F0;*/ ">
            <div style="float: left;"><span style="margin-top:5px;"><fmt:message key="jsp.home.new"/><span></div><div style="float: right;width:92%;"><marquee direction=left scrollamount=6 onmouseover="this.stop()" onmouseout="this.start()">
                    <%= topNews %></marquee></div></div>

                  
                       
<!------------------------------------------------------------------------------------------------------------------------------>
<div class="container row" >


 
     <div class="" style="width:100%;height:350px;float:left;">
           <div class="" style="width:78%;height:100%;float:left;">
               <jsp:include page="lunbo.jsp"></jsp:include>
 	  
           </div>
      
      <!--！！！！！！！！！！！！！！！通告切换-->
           <div class="pull-right" style="width:20.5%;height:100%;float:left;border:1px solid #9bc2e5;">
            	<div class="panel-success pull-left" style="float:left;width:100%;height:100%; overflow: hidden;">
                  <div class="panel-heading" style="margin-top:-2px;text-align:center;background:url('<%=request.getContextPath()%>/image/q.png') no-repeat center center  ;background-size:cover;width:100%;"><fmt:message key="jsp.home.com3"/></div>
                  
                  
                  
                  <div id="divtwo" class="jumbotron pull-left" style="height:100%;width:100%; position: relative;font-size:12px; ">
                     &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<%= sideNews %>
                  
                  </div>
                 
                  
                  
                  
                   <!--<div  class="pull-right" style="border:1px soild #000;margin-right:10px;width:17px; height:16px;"><img id="image2" src="image/tongzhi02.png" onmouseover="show2()"></div>
                    
                    
                    <div   class="pull-right" style="border:1px soild #000;margin-right:5px;width:17px; height:16px;"><img id="image1" src="image/tongzhi03.png" onmouseover="show1()"></div>
                  
                  -->
                
                  
                  
                  </div>
                </div>
                  
                  
                  
                
 	            
                
                
                
           </div>
      </div>
      
      
      
       <div class="pull-right" style="margin-top:10px;width:100%;height:800px;float:left;">
            
             <div class="" style=";width:20%;float:left;border:1px solid #9bc2e5;height:100%;">
             
             <!-- ！！！！！！！！！！！！！机构 列表 -->
<%
if (collections != null && collections.length != 0)
{
%>

      
	<div class=" panel-success pull-left" style="float:left;width:100%;">		
               <div class="panel-heading" style="margin-top:-2px;text-align:center;background:url('<%=request.getContextPath()%>/image/q.png') no-repeat center center  ;background-size:cover;width:100%;"><fmt:message key="jsp.home.com1"/></div>
                <!--<p><fmt:message key="jsp.home.com2"/></p>-->
				<div class="list-group">
<%
	boolean showLogos = ConfigurationManager.getBooleanProperty("jspui.home-page.logos", true);
    for (int i = 0; i < collections.length&&collections[i].getMetadata("name").length()>0; i++)
    {   
%><div id="lis1" class="list-group-item" style="border:none;margin-top:10px;">
<%  
		Bitstream logo = collections[i].getLogo();
		if (showLogos && logo != null) { %>
	<div class="col-md-3">
        <img alt="Logo" class="img-responsive" src="<%= request.getContextPath() %>/retrieve/<%= logo.getID() %>" /> 
	</div>
	<div class="col-md-9">
<% } else { %>
        <style>
            .circle{ width: 8px; height:8px; border-radius:4px; background: #9bc2e5; float: left;position: absolute;top:40%;left: -4px;}
        </style>
        <div class="circle">
            
        </div>
	<div class="col-md-12" style="margin:8px;">
<% }  %>		 
		<h5 class="list-group-item-heading"><a href="<%= request.getContextPath() %>/handle/<%= collections[i].getHandle() %>"><%= collections[i].getMetadata("name") %></a>
<%
        if (ConfigurationManager.getBooleanProperty("webui.strengths.show"))
        {
%>
		<span class="badge pull-right"><%= ic.getCount(collections[i]) %></span>
<%
        }

%>
		</h5>
		<p><%= collections[i].getMetadata("short_description") %></p>
    </div>
</div>                            
<%
    }
%>
	</div>
	</div>
<%
}
%>
 	  
             </div>
             
               <div class="" style="margin-left:10px;width:57.2%;height:100%;float:left;">
             <div class="panel3  pull-left" style="float:left;width:100%;">
                  <div class="panel-heading1" style="font-size:16px;margin-top: -8px;"><img src="image/234.png" style="width:15px;height:15px;"/>&nbsp;&nbsp;<fmt:message key="jsp.home.com4"/></div>
                  
           
                  
                  
                  </div>
                    <div class="" style="border:1px solid #9bc2e5;width:100%;margin-top:-21.5px;height:95.68%;float:left;">
             
                         <!-- Wrapper for slides 最新更新内容-->
		  <div class="carousel-inner" style="margin-top:20px;">
		    <%
		    boolean first = true;
		    for (Item item : submissions.getRecentSubmissions())
		    {
		        Metadatum[] dcv = item.getMetadata("dc", "title", null, Item.ANY);
		        String displayTitle = "Untitled";
		        if (dcv != null & dcv.length > 0)
		        {
		            displayTitle = Utils.addEntities(dcv[0].value);
		        }
		        dcv = item.getMetadata("dc", "description", "abstract", Item.ANY);
		        String displayAbstract = "";
		        if (dcv != null & dcv.length > 0)
		        {
		            displayAbstract = Utils.addEntities(dcv[0].value);
		        }
		%>
		    <div style="/*padding-bottom: 1px; min-height: 200px;*/" class="item <%= first?"active":""%>">
		      <div style="padding-left: 20px; padding-right: 20px; display: inline-block;"><a style="font-weight:bold;" href="<%= request.getContextPath() %>/handle/<%=item.getHandle() %>" ><%= StringUtils.abbreviate(displayTitle, 400) %></a> 
                        <div style="margin-bottom:10px;line-height:30px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= StringUtils.abbreviate(displayAbstract, 150) %></div>
		      </div>
		    </div>		      	

		<%
				
		     }
		%>
		  </div>
             
                  
                 <div style="float:right;margin-right:30px;margin-top:50px;position:relative;font-weight: bold;text-decoration:underline;display:none;"><fmt:message key="jsp.home.com5"/></div>
                    </div>     
                </div>
             
               <div class="pull-right" style="border:1px solid #9bc2e5;width:20.5%;height:100%;float:left;">
             <%
    	int discovery_panel_cols = 8;
    	int discovery_facet_cols = 4;
    %>
             <%@ include file="discovery/static-sidebar-facet2.jsp" %>
             
             </div>
             
             
 	  
             </div>
             
           
 	  
      </div>
      
	
	
</div>
    



<div class="row">
	<%@ include file="discovery/static-tagcloud-facet.jsp" %>
</div>
	
</div>
<!-- -->
<div>
</div>

</dspace:layout>