<%@ page import="java.util.Map" %>
<%@ page import="java.util.TreeMap" %>
<%@ page import="dao.UserDao3" %><%--
  Created by IntelliJ IDEA.
  User: ryx
  Date: 2020/6/28
  Time: 16:30
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
   /* Map<String ,Integer> car=new TreeMap<>();
    if (session.getAttribute("car")!=null){
        car=(Map<String, Integer>)(session.getAttribute("car"));

    }
    if (car.get(name)!=null){
        int old=car.get(name);
        car.put(name,old+1);
    }else {
        car.put(name,1);
    }
    */

   dao.UserDao3.addTotal(name1,fruits.get(name));
    dao.UserDao3.add(name,name1);
    response.sendRedirect("mall.jsp");
%>
