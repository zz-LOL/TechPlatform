<%--
  Created by IntelliJ IDEA.
  User: vincent_mac
  Date: 16/1/12
  Time: 下午5:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.dspace.lunbo.updateText" %>
<%@ page import="org.dspace.lunbo.lbText" %>
<%
  lbText txt=new lbText();
  updateText ut=new updateText();
  ut.setText(txt);
%>
<p><%=txt.getId()%></p>
<p><%=txt.getContent()%></p>
