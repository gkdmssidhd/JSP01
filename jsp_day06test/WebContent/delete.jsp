<%@page import="org.comstudy21.HODao"%>
<%@page import="org.comstudy21.HOVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	
String no = request.getParameter("no");
HODao.delete(new HOVo(no));

response.sendRedirect("list.jsp");

%>