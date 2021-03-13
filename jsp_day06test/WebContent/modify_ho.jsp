<%@page import="org.comstudy21.HOVo"%>
<%@page import="org.comstudy21.HODao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String no = request.getParameter("no");
String name = request.getParameter("name");
String email = request.getParameter("email");
String phone = request.getParameter("phone");

HODao.modify(new HOVo(no, name, email, phone));

response.sendRedirect("detail.jsp?no="+no);
%>