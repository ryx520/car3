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
</head>
<body>
username=<%=request.getParameter("username")%>
password=<%=request.getParameter("password")%>
<%
String username=request.getParameter("username");
String password=request.getParameter("password");

    if(dao.UserDao3.login(username,password)){
    out.println("welcome "+username);
    session.setAttribute("username",request.getParameter("username"));//创建session对象
     session.setAttribute("car",new TreeMap<String,Integer>());
    response.sendRedirect("index.jsp");
}else {
    out.println("登陆失败");
    response.sendRedirect("login.html");
}
%>


</body>
</html>
