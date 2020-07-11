<%@ page import="java.util.TreeMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="dao.UserDao3" %><%--
  Created by IntelliJ IDEA.
  User: ryx
  Date: 2020/7/7
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String name1=(String)session.getAttribute("username");
    String name=(String)request.getParameter("name");
    Map<String,Double> fruits=new TreeMap<>();
    fruits.put("Javaweb开发详解",35.5);
    fruits.put("JavaScript",40.5);
    fruits.put("Structs2",45.5);
    fruits.put("Java核心技术",70.5);
    fruits.put("Spring开发详解",55.5);
    dao.UserDao3.del(name,name1);
    dao.UserDao3.delTotal(name,fruits.get(name),name1);
    response.sendRedirect("car.jsp");
%>
