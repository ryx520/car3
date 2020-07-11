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
            background: url("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1594383661753&di=c350845c65b1350af32679b8e122019f&imgtype=0&src=http%3A%2F%2Fpx.thea.cn%2FPublic%2FUpload%2FUploadfiles%2Fimage%2F20181220%2F20181220164252_66602.jpg");
           background-size:100%;
            height: auto;
            background-repeat: no-repeat;
        }
        .center
        {
            text-align:center;
        }
        h1{
            text-shadow: 5px 5px 5px blueviolet;
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
       out.println("您还没有登录,请<a  href='login.html'>登录</a>");
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
