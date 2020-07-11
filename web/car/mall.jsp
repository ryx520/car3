<%--
  Created by IntelliJ IDEA.
  User: ryx
  Date: 2020/6/28
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.TreeMap" %>
<html>
<head>
    <title>Document</title>
</head>
<style type="text/css">
    img{
        width:40px;
        height: 30px;
    }
    body{
        background: url("http://img5.imgtn.bdimg.com/it/u=2664815884,20638765&fm=26&gp=0.jpg");
        background-size:100%;
        height: auto;
        background-repeat: no-repeat;
    }
    h1
    {
        text-shadow: 5px 5px 5px #FF0000;
    }
    table{
    width:100%;
    }
    table, td, th
    {
        border:1px solid black;
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
        color: red;
    }

</style>
<body>
<%
    Map<String,Double> fruits=new TreeMap<String, Double>();
    Map<String,Integer> car=new TreeMap<String, Integer>();
%>
<%
    fruits.put("Javaweb开发详解",35.5);
    fruits.put("JavaScript",40.5);
    fruits.put("Structs2",45.5);
    fruits.put("Java核心技术",70.5);
    fruits.put("Spring开发详解",55.5);
%>

<h1 class="center">hasaki</h1>
<%
    String name=(String)session.getAttribute("username");
    if (name==null){
        out.println("您还没有登录,请<a href='login.html'>登录</a>");

    }else {
        car=(Map<String, Integer>)session.getAttribute("car");

%>
<h2 class="center">欢迎<%=name%></h2>
<table border="1">
    <tr>
        <td>图片</td>
        <td>商品名称</td>
        <td>单价</td>
        <td>购买</td>
    </tr>
    <tr>
        <%
            for (String f:fruits.keySet()){
                out.println(String.format("<tr><td><img src='%s'></td><td>%s</td><td>%.2f</td><td><a href='buy.jsp?name=%s'>BUY</a></td></tr>",f+".jpg",f,fruits.get(f),f));

            }
        %>

    </tr>
</table>
<%}%>
<h2>查看我的: <a href="car.jsp">购物车</a> </h2>
</body>
</html>
