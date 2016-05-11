<%--
  Created by IntelliJ IDEA.
  User: vincent_mac
  Date: 16/1/8
  Time: 下午11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="java.io.File" %>
<%@ page import="org.dom4j.io.SAXReader" %>
<%@ page import="org.dom4j.Document" %>
<%@ page import="org.dom4j.Element" %>
<%@ page import="java.util.List" %>
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="css/lunbo.css"/>
    <script language="javascript" type="text/javascript" src="js/jquery-2.0.0.js"></script>
    <script language="javascript" type="text/javascript" src="js/lunbo.js"></script>
  </head>
  <%
    String[] title_ch = {"地质图件","大型数据","科技报告","科技论文","英文年报"};
    String[] title_en = {"geological map","large-scale data","scientific report","scientific paper","English annual report"};
    String[] digest = {"发源于青藏高原的怒江、澜沧江、金沙江这三条大江，在云南省境内自北向南并行奔流170公里，穿过横断山脉的崇山峻岭，形成世上罕见的奇特景观。这片神奇的大地被称为三江并流地区。这里连同三江流过的青海南部、西藏东部、四川西部，因为良好的金属矿物生成条件，在地质学界还有另外一个响亮的名字——三江成矿带。","发源于青藏高原的怒江、澜沧江、金沙江这三条大江，在云南省境内自北向南并行奔流170公里，穿过横断山脉的崇山峻岭，形成世上罕见的奇特景观。这片神奇的大地被称为三江并流地区。这里连同三江流过的青海南部、西藏东部、四川西部，因为良好的金属矿物生成条件，在地质学界还有另外一个响亮的名字——三江成矿带。","发源于青藏高原的怒江、澜沧江、金沙江这三条大江，在云南省境内自北向南并行奔流170公里，穿过横断山脉的崇山峻岭，形成世上罕见的奇特景观。这片神奇的大地被称为三江并流地区。这里连同三江流过的青海南部、西藏东部、四川西部，因为良好的金属矿物生成条件，在地质学界还有另外一个响亮的名字——三江成矿带。","发源于青藏高原的怒江、澜沧江、金沙江这三条大江，在云南省境内自北向南并行奔流170公里，穿过横断山脉的崇山峻岭，形成世上罕见的奇特景观。这片神奇的大地被称为三江并流地区。这里连同三江流过的青海南部、西藏东部、四川西部，因为良好的金属矿物生成条件，在地质学界还有另外一个响亮的名字——三江成矿带。","中国地质科学院地质研究所一年来蓬勃发展的各项数据英文报告"};
    String[] query = {"geological+map","large-scale+data","scientific+report","scientific+paper","English+annual+report"};

    File file=new File("lbText.xml");
    if(file.exists()){
      SAXReader saxReader=new SAXReader();
      Document doc=saxReader.read(file);
      Element root=doc.getRootElement();
      List<Element> list=root.elements("content");
      for(int i=0;i<list.size();i++){
        digest[i]=list.get(i).getText();
      }
    }
  %>
    <body>
      <div id="content">
        <%for(int i=0;i<=4;i++){%>
        <div class="bgi">
          <img src="image/pic<%=i+1%>.png"/>
        </div>
        <%}%>
        <%for(int j=0;j<=4;j++){%>
        <div class="info-area">
          <span class="digest"><%=digest[j]%></span>
          <button class="ck" onclick="javascript:location.href='<%=request.getContextPath()%>/simple-search?query=<%=query[j]%>';">点击查看</button>
        </div>
        <%}%>
        <%for(int m=0;m<=4;m++){%>
        <div class="title">
          <p class="title_zh"><%=title_ch[m]%></p>
          <p class="title_en"><%=title_en[m]%></p>
        </div>
        <%}%>
        <div class="pic-area">
          <ul>
            <%for(int k=0;k<=4;k++){%>
            <li class="pic-mini" onclick="javascript:location.href='<%=request.getContextPath()%>/simple-search?query=<%=query[k]%>';">
              <img src="image/pic<%=k+1%>.png"/>
            </li>
            <%}%>
          </ul>
        </div>
      </div>
    </body>
</html>
