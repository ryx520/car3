<%@ page import="java.util.Map" %>
<%@ page import="java.util.TreeMap" %><%--
  Created by IntelliJ IDEA.
  User: ryx
  Date: 2020/6/28
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>my cart</title>
    <style type="text/css">
        img{
            width:40px;
            height: 30px;
        }
        table{
            width:100%;
        }
        table, td, th
        {
            border:1px solid greenyellow;
        }
        h1
        {
            text-shadow: 5px 5px 5px blanchedalmond;
        }
        th
        {
            background-color:peachpuff;
            color:white;
            height:100px;
        }
        .center
        {
            text-align:center;
        }
        p{
            color: deepskyblue;
        }
        body
        {
            background:url("http://img5.imgtn.bdimg.com/it/u=2664815884,20638765&fm=26&gp=0.jpg");
            background-size:100%;
            height: auto;
            background-repeat:no-repeat;
        }

    </style>
</head>
<body>
<h1 class="center">我的购物车</h1>
<h2 class="center">欢迎<%=session.getAttribute("username")%></h2>
<h2><a href="mall.jsp">商城</a> </h2>
<table border="1">
    <tr>
        <td>商品名称</td>
        <td>单价</td>
        <td>数量</td>
        <td>总价</td>
    </tr>
    <tr>
        <%
         String name1=(String)session.getAttribute("username");
            Map<String,Double> fruits=new TreeMap<>();
            fruits.put("Javaweb开发详解",35.5);
            fruits.put("JavaScript",40.5);
            fruits.put("Structs2",45.5);
            fruits.put("Java核心技术",70.5);
            fruits.put("Spring开发详解",55.5);

double total=0;
            for (String f:fruits.keySet()){

total+=fruits.get(f)*dao.UserDao3.getNum(f,name1);

                %>
        <tr>
             <td><%=f%></td>
             <td><%=fruits.get(f)%></td>
             <td><%=dao.UserDao3.getNum(f,name1)%></td>
             <td><%=fruits.get(f)*dao.UserDao3.getNum(f,name1)%></td>
    <%out.println(String.format("<td><a href='del.jsp?name=%s'>del</a></td>",f));%>
        </tr>

            <%}%>
    </tr>
</table>
总价<%=total%>

</body>
</html>
