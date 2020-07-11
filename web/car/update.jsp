<%--
  Created by IntelliJ IDEA.
  User: ryx
  Date: 2020/6/20
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.UserDao3" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.TreeMap" %>
<html>
<head>
    <title>Title</title>
    <style>
        .center
        {
            text-align:center;
        }
    </style>
</head>
<body>
username=<%=request.getParameter("username")%>
password=<%=request.getParameter("password")%>
password1=<%=request.getParameter("password1")%>
<%
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    String password1=request.getParameter("password1");

    if(dao.UserDao3.updatePassword(username,password,password1)){
        out.println("修改成功");
        response.sendRedirect("login.html");
    }else {

        response.sendRedirect("update.html");
        out.println("修改失败");
    }
%>
<a class="center" href="login.html">返回登录</a>

</body>
</html>
