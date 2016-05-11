<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Footer for home page
  --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.net.URLEncoder" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>

<%
    String sidebar = (String) request.getAttribute("dspace.layout.sidebar");
%>

            <%-- Right-hand side bar if appropriate --%>
<%
    if (sidebar != null)
    {
%>
	</div>
	<div class="col-md-3">
                    <%= sidebar %>
    </div>
    </div>       
<%
    }
%>
</div>
</main>
<footer class="navbar navbar-inverse navbar-bottom" style="position: relative; width: 100%; margin-bottom: 0; border-radius: 0; top: 0;">
             <div id="designedby" class="container text-muted">
<div class="ftt" style="width: 100%; height: 200px; background: #5c647f; position: relative; bottom: 0;">
    <div style="width:800px; height: 100%; margin: 0 auto;">
        <p style="color: #fff; text-align: center; font-size: 38px;  margin-top:20px;">
        <img src="<%=request.getContextPath()%>/image/logo.png" style="width: 90px;height:90px;"/>
        科技成果及资料发布平台</p>
        <p style="color: #fff; text-align: center; font-size: 14px;">
            ICP备案序号 : 京ICP备05029128     技术支持 : 中国地质科学院地质研究所<br/><br/>版权所有 : 中国地质科学院地质研究所
        </p>
    </div>
        </div>
        </div>
    </footer>
    </body>
    
</html>