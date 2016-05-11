<%--
  Created by IntelliJ IDEA.
  User: vincent_mac
  Date: 16/1/12
  Time: 下午4:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="org.dspace.lunbo.updateText" %>
<%@ page import="org.dspace.lunbo.lbText" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.File" %>
<%@ page import="org.dom4j.io.SAXReader" %>
<%@ page import="org.dom4j.Document" %>
<%@ page import="org.dom4j.Element" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/lunbo.css"/>
    <script type="text/javascript" src="js/jquery-2.0.0.js"></script>
    <script>
      $(function(){
        $(".txt").eq(0).show();
        $("form>p").eq(0).show();
        $(".typeItem").eq(0).addClass("typeItem-focus");
        $(".typeItem").click(function(){
          $(this).addClass("typeItem-focus").siblings().removeClass("typeItem-focus");
          $(".txt").hide();
          $(".txt").eq($(this).index()).show()
          $("form>p").hide();
          $("form>p").eq($(this).index()).show();
        });
        $(".btn-update").click(function(){
          $(this).hide();
          $(".btn-submit").show();
          $(".txt>textarea").removeAttr("readonly");
        });
        $(".btn-submit").click(function(){
          $(this).hide();
          $(".btn-update").show();
          $(".txt>textarea").attr("readonly","readonly");
          $("#form").submit();
        });
        $(".btn-cancel").click(function(){
          $(".txt>textarea").attr("readonly","readonly");
          $(".btn-submit").hide();
          $(".btn-update").show();
          $("#form")[0].reset();
        });
      });
      function uploadImg(){
        var imgURL=$(".upload>input").val();
        alert(imgURL);
      }
    </script>
</head>
<%
  request.setCharacterEncoding("UTF-8");
  if(request.getParameter("id0")!=null){
    int id;
    String content;
    lbText txt=new lbText();
    List<lbText> list=new ArrayList();
    for(int m=0;m<5;m++){
      id=Integer.parseInt(request.getParameter("id" + m));
      content=request.getParameter("content" + m);
      txt.setId(id);
      txt.setContent(content);
      list.add(new lbText(txt));
    }
    updateText ut=new updateText();
    ut.setText(list);
  }

  String[] title_ch = {"地质图件","大型数据","科技报告","科技论文","英文年报"};
  String[] digest = {"发源于青藏高原的怒江、澜沧江、金沙江这三条大江，在云南省境内自北向南并行奔流170公里，穿过横断山脉的崇山峻岭，形成世上罕见的奇特景观。这片神奇的大地被称为三江并流地区。这里连同三江流过的青海南部、西藏东部、四川西部，因为良好的金属矿物生成条件，在地质学界还有另外一个响亮的名字——三江成矿带。","发源于青藏高原的怒江、澜沧江、金沙江这三条大江，在云南省境内自北向南并行奔流170公里，穿过横断山脉的崇山峻岭，形成世上罕见的奇特景观。这片神奇的大地被称为三江并流地区。这里连同三江流过的青海南部、西藏东部、四川西部，因为良好的金属矿物生成条件，在地质学界还有另外一个响亮的名字——三江成矿带。","发源于青藏高原的怒江、澜沧江、金沙江这三条大江，在云南省境内自北向南并行奔流170公里，穿过横断山脉的崇山峻岭，形成世上罕见的奇特景观。这片神奇的大地被称为三江并流地区。这里连同三江流过的青海南部、西藏东部、四川西部，因为良好的金属矿物生成条件，在地质学界还有另外一个响亮的名字——三江成矿带。","发源于青藏高原的怒江、澜沧江、金沙江这三条大江，在云南省境内自北向南并行奔流170公里，穿过横断山脉的崇山峻岭，形成世上罕见的奇特景观。这片神奇的大地被称为三江并流地区。这里连同三江流过的青海南部、西藏东部、四川西部，因为良好的金属矿物生成条件，在地质学界还有另外一个响亮的名字——三江成矿带。","中国地质科学院地质研究所一年来蓬勃发展的各项数据英文报告"};

  File file=new File("lbText.xml");
  if(file.exists()) {
    SAXReader saxReader = new SAXReader();
    Document doc = saxReader.read(file);
    Element root = doc.getRootElement();
    List<Element> list = root.elements("content");
    for (int j = 0; j < list.size(); j++) {
      digest[j] = list.get(j).getText();
    }
  }
%>
<body>
  <div class="content">
    <div class="switch">
      <p class="tip">如需修改，请点击修改按钮</p>
      <ul>
        <%for(int n=0;n<5;n++){%>
        <li class="typeItem"><%=title_ch[n]%></li>
        <%}%>
      </ul>
    </div>
    <div>
      <form method="post" action="#" id="form">
        <%for(int i=0;i<5;i++){%>
        <input type="hidden" name="id<%=i%>" value="<%=i%>"/>
        <div class="txt">
          <label>文字内容:</label>
          <textarea name="content<%=i%>" readonly><%=digest[i]%></textarea>
        </div>
        <%}%>
      </form>
    </div>
    <div class="buttons">
      <button class="btn-cancel">取消</button>
      <button class="btn-update">修改</button>
      <button class="btn-submit">提交</button>
    </div>
  </div>
</body>
</html>