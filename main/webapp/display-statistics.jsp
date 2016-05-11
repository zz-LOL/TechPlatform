<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Display item/collection/community statistics
  -
  - Attributes:
  -    statsVisits - bean containing name, data, column and row labels
  -    statsMonthlyVisits - bean containing name, data, column and row labels
  -    statsFileDownloads - bean containing name, data, column and row labels
  -    statsCountryVisits - bean containing name, data, column and row labels
  -    statsCityVisits - bean containing name, data, column and row labels
  -    isItem - boolean variable, returns true if the DSO is an Item 
  --%>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page import="org.dspace.app.webui.servlet.MyDSpaceServlet"%>

<% Boolean isItem = (Boolean)request.getAttribute("isItem"); %>
    
<dspace:layout titlekey="jsp.statistics.title">
    <style type="text/css">
        th,td{
            width:120px;
            color:#687780;
            font-family:Microsoft YaHei;
        }
    </style>
<!--<h1 style="font-family:Microsoft YaHei;"><fmt:message key="jsp.statistics.title"/></h1>
<h3 style="font-family:Microsoft YaHei;"><fmt:message key="jsp.statistics.heading.visits"/></h3>
<table class="statsTable" style="border:1px solid #666666; height:100px;">
<tr style="border:1px solid #666666">
<th><!-- spacer cell </th>
<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:message key="jsp.statistics.heading.views"/></th>
</tr>-->
<c:forEach items="${statsVisits.matrix}" var="row" varStatus="counter">
<c:forEach items="${row}" var="cell" varStatus="rowcounter">
<c:choose>
<c:when test="${rowcounter.index % 2 == 0}">
<c:set var="rowClass" value="evenRowOddCol"/>
</c:when>
<c:otherwise>
<c:set var="rowClass" value="oddRowOddCol"/>
</c:otherwise>
</c:choose>
<tr class="${rowClass}" >
<h3 style="font-family:Microsoft YaHei;color:#687780;">
&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${statsVisits.colLabels[counter.index]}"/> 
</h3>
<br/>
<div style="position:relative;float:left;">
<span style="font-family:Microsoft YaHei;color:#687780;">
&nbsp;&nbsp;&nbsp;&nbsp;<fmt:message key="jsp.statistics.heading.visits"/>:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${cell}"/>
</span>
</div>
</td>
</c:forEach>
</tr>
</c:forEach>
</table>


<% if(isItem) { %>
<div style="margin-left:150px;float:left;">
<!--<h3 style="font-family:Microsoft YaHei;"><fmt:message key="jsp.statistics.heading.filedownloads"/></h3>
<table class="statsTable">
<tr>
<th><!-- spacer cell </th>
<th><fmt:message key="jsp.statistics.heading.views"/></th>
</tr>-->
<c:forEach items="${statsFileDownloads.matrix}" var="row" varStatus="counter">
<c:forEach items="${row}" var="cell" varStatus="rowcounter">
<c:choose>
<c:when test="${rowcounter.index % 2 == 0}">
<c:set var="rowClass" value="evenRowOddCol"/>
</c:when>
<c:otherwise>
<c:set var="rowClass" value="oddRowOddCol"/>
</c:otherwise>
</c:choose>
<tr class="${rowClass}">
<span style="font-family:Microsoft YaHei;color:#687780;">
<!--&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${statsFileDownloads.colLabels[rowcounter.index]}"/> --> &nbsp;&nbsp;&nbsp;&nbsp;<fmt:message key="jsp.statistics.heading.filedownloads"/>:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${cell}"/>
</span>
</td>
</c:forEach>
</tr>
</c:forEach>
</table>
</div>
<% } %>
 <br/>

<div style="margin-top:20px;position:absolute;width:100%">
    
        <table class="statsTable" style="position:relative;float:left;margin-left:15px;">
            <tr>
                <th>
                <fmt:message key="jsp.submit.edit-metadata.month"/>
                </th>
            </tr>
            
            <tr>
                <td>
                <fmt:message key="jsp.statistics.heading.visits1"/>
                </td>
            </tr>
            </table>
   
<table class="statsTable" rules="rows" style=" border:1px solid #666666;position:relative;float:left;margin-left:-30px;width:70%; ">
   
<tr style="border:1px solid #666666">
<!--<th><!-- spacer cell </th>-->
<c:forEach items="${statsMonthlyVisits.colLabels}" var="headerlabel" varStatus="counter">
<th>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${headerlabel}"/>
</th>
</c:forEach>
</tr>
<c:forEach items="${statsMonthlyVisits.matrix}" var="row" varStatus="counter">
<c:choose>
<c:when test="${counter.index % 2 == 0}">
<c:set var="rowClass" value="evenRowOddCol"/>
</c:when>
<c:otherwise>
<c:set var="rowClass" value="oddRowOddCol"/>
</c:otherwise>
</c:choose>
<tr class="${rowClass}" >
<!--<span style="font-family:Microsoft YaHei;color:#687780;">
<c:out value="${statsMonthlyVisits.rowLabels[counter.index]}"/>
 &nbsp;&nbsp;&nbsp;&nbsp;<fmt:message key="jsp.statistics.heading.monthlyvisits"/></span>-->
<c:forEach items="${row}" var="cell">
<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${cell}"/>
</td>
</c:forEach>
</tr>
</c:forEach>
</table>
</div>

<div style="margin-top:120px;position:relative;width:50%">
    
        <table class="statsTable" style="position:relative;float:left;margin-left:15px;">
            <tr>
                <th>
                <fmt:message key="jsp.statistics.heading.countryvisits"/>
                </th>
            </tr>
            
            <tr>
                <td>
                <fmt:message key="jsp.statistics.heading.visits1"/>
                </td>
            </tr>
            </table>



<table class="statsTable" rules="rows" style="border:1px solid #666666;position:relative;float:left;margin-left:-30px; ">
<tr style="border:1px solid #666666">
<!--<th><!-- spacer cell </th>
<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:message key="jsp.statistics.heading.views"/></th>-->

<c:forEach items="${statsCountryVisits.matrix}" var="row" varStatus="counter">
<c:forEach items="${row}" var="cell" varStatus="rowcounter">
<c:choose>
<c:when test="${rowcounter.index % 2 == 0}">
<c:set var="rowClass" value="evenRowOddCol"/>
</c:when>
<c:otherwise>
<c:set var="rowClass" value="oddRowOddCol"/>
</c:otherwise>
</c:choose>
<th>
&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${statsCountryVisits.colLabels[rowcounter.index]}"/>
</th>
</tr>
<tr class="${rowClass}" style="border:1px solid #666666">
<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${cell}"/>

</td>
</tr>
</c:forEach>
</c:forEach>
</table>
</div>


<div style="position:relative;float:left;width:50%;margin-left:15%;">
    
        <table class="statsTable" style="position:relative;float:left;margin-left:15px;">
            <tr>
                <th>
                <fmt:message key="jsp.statistics.heading.cityvisits"/>
                </th>
            </tr>
            
            <tr>
                <td>
                <fmt:message key="jsp.statistics.heading.visits1"/>
                </td>
            </tr>
            </table>


<table class="statsTable" rules="rows" style=" border:1px solid #666666;position:relative;float:left;margin-left:-30px; ">
<tr style="border:1px solid #666666">
<!--<th><!-- spacer cell </th>
<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:message key="jsp.statistics.heading.views"/></th>-->

<c:forEach items="${statsCityVisits.matrix}" var="row" varStatus="counter">
<c:forEach items="${row}" var="cell" varStatus="rowcounter">
<c:choose>
<c:when test="${rowcounter.index % 2 == 0}">
<c:set var="rowClass" value="evenRowOddCol"/>
</c:when>
<c:otherwise>
<c:set var="rowClass" value="oddRowOddCol"/>
</c:otherwise>
</c:choose>
<th>
&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${statsCityVisits.colLabels[rowcounter.index]}"/>
</th>
</tr>
    
<tr class="${rowClass}">
<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${cell}"/>
</td>
</tr>
</c:forEach>
</c:forEach>
</table>
</div>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
</dspace:layout>



