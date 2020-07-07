<%--
  Created by IntelliJ IDEA.
  User: ryx
 Date: 2020/6/28
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Document</title>
    <style>
        body{
            background: url("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593956857591&di=ff5dcaec544532c3a4811b5bdd2990bb&imgtype=0&src=http%3A%2F%2Fpic.5577.com%2Fup%2F2014-8%2F201487113353.jpg");
            background-size: 80%,80%;
            background-repeat: no-repeat;
        }
        .center
        {
            text-align:center;
        }
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: green;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        li {
            float: left;
        }

        li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        li a:hover:not(.active) {
            background-color: #111;
        }
    </style>
</head>
<body>
<h1 class="center" >Java购物车</h1>
<%
    String name=(String)session.getAttribute("username");
    if (name==null){
        out.println("您还没有登录,请<a href='login.html'>登录</a>");
    }else {%>
<ul>

    <li><p class="center"><a href="mall.jsp">查看商城</a></li>
    <li><p class="center"><a href="car.jsp">我的购物车</a></li>
    <li><p class="center"><a href="logout.jsp">退出</a></li>

</ul>
<p>          </p>
<h2 class="center">欢迎<%=name%></h2>
<%}%>


</body>
</html>
