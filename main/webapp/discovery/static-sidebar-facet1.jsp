<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - fragment JSP to be included in site, community or collection home to show discovery facets
  -
  - Attributes required:
  -    discovery.fresults    - the facets result to show
  -    discovery.facetsConf  - the facets configuration
  -    discovery.searchScope - the search scope 
  --%>

<%@page import="org.dspace.discovery.configuration.DiscoverySearchFilterFacet"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.Map"%>
<%@ page import="org.dspace.discovery.DiscoverResult.FacetResult"%>
<%@ page import="java.util.List"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>


<script type="text/javascript">
    window.onload=function(){
        $("#facet_dateIssued").css("border-bottom","none");
        
    };
    
</script>

<%
	boolean brefine = false;
	
	Map<String, List<FacetResult>> mapFacetes = (Map<String, List<FacetResult>>) request.getAttribute("discovery.fresults");
	List<DiscoverySearchFilterFacet> facetsConf = (List<DiscoverySearchFilterFacet>) request.getAttribute("facetsConfig");
	//facetsConf=facetsConf.subList(0, 2);
        
        String searchScope = (String) request.getAttribute("discovery.searchScope");
	if (searchScope == null)
	{
	    searchScope = "";
	}
	
	if (mapFacetes != null)
	{
	    for (DiscoverySearchFilterFacet facetConf : facetsConf)
		{
		    String f = facetConf.getIndexFieldName();
		    List<FacetResult> facet = mapFacetes.get(f);
		    if (facet != null && facet.size() > 0)
		    {
		        brefine = true;
		        break;
		    }
		    else
		    {
		        facet = mapFacetes.get(f+".year");
			    if (facet != null && facet.size() > 0)
			    {
			        brefine = true;
			        break;
			    }
		    }
		}
	}
	if (brefine) {
%>
<!--<div class="col-md-<%= discovery_panel_cols %> ">-->
<!--<h3 class="facets"><fmt:message key="jsp.search.facet.refine" /></h3>-->
         <!--<div id="facets" class="facetsBox  pill-right row panel clear">-->
         <div class="facets pull-right" style="width:100%;border:1px solid #9bc2e5;margin-top:60px;">
<%
	for (DiscoverySearchFilterFacet facetConf : facetsConf)
	{
    	String f = facetConf.getIndexFieldName();
    	List<FacetResult> facet = mapFacetes.get(f);
		if(facet!=null){ facet=facet.subList(0, 10);}
 	    if (facet == null)
 	    {
 	        facet = mapFacetes.get(f+".year");
 	    }
 	    if (facet == null)
 	    {
 	        continue;
 	    }
	    String fkey = "jsp.search.facet.refine."+f;
	    int limit = facetConf.getFacetLimit()+1;
	    %>
        <!--!!!!!!!!!!!!!!!!ï¼ï¼ï¼!!!å³ä¾§ä½èãå³é®å­ãå¬å¼æ¥æ-->
        <div id="facet_<%= f %>" class=" pull-right" style="width:100%;border-bottom: dashed 1px #3CC;">
            <div class="panel-heading" style="background-color:#ffffff;"><img src="<%=request.getContextPath()%>/image/232.png" style="margin-left:-10px;">&nbsp&nbsp<fmt:message key="<%= fkey %>" /></div>
	    <ul class="list-group"><%
	    int idx = 1;
	    int currFp = UIUtil.getIntParameter(request, f+"_page");
	    if (currFp < 0)
	    {
	        currFp = 0;
	    }
	    if (facet != null)
	    {
		    for (FacetResult fvalue : facet)
		    { 
		        if (idx != limit)
		        {
		        %><li class="list-group-item2"><span class="badge pull-right"><%= fvalue.getCount() %></span> <a href="<%= request.getContextPath()
		            + searchScope
	                + "/simple-search?filterquery="+URLEncoder.encode(fvalue.getAsFilterQuery(),"UTF-8")
	                + "&amp;filtername="+URLEncoder.encode(f,"UTF-8")
	                + "&amp;filtertype="+URLEncoder.encode(fvalue.getFilterType(),"UTF-8") %>"
	                title="<fmt:message key="jsp.search.facet.narrow"><fmt:param><%=fvalue.getDisplayedValue() %></fmt:param></fmt:message>">
	                <%= StringUtils.abbreviate(fvalue.getDisplayedValue(),36) %></a></li><%
		        }
		        idx++;
		    }
		    if (currFp > 0 || idx > limit)
		    {
		        %><li class="list-group-item" style="display:none;"><span >.</span>
		        <% if (currFp > 0) { %>
		        
	            <% } %>
	            <% if (idx > limit) { %>
	            
	            <%
	            }
	            %></li><%
		    }
	    }
	    %></ul></div><%
	}
%></div></div><%
	}
%>