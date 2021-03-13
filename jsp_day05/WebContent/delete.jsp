<%@page import="org.comstudy21.MemberDao"%>
<%@page import="org.comstudy21.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// 지우기
	// no를 가져와서 지워저린다.
	String no = request.getParameter("no");
	// 멤버 vo에 있는 no를 지운다.
	MemberDao.delete(new MemberVo(no));
	
	response.sendRedirect("list.jsp"); // 완료되면 list.jsp로 이동
%>