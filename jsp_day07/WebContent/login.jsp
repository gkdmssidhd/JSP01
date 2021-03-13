<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// 로그인 처리
// session에 로그인 정보 저장
String userId = request.getParameter("user_id");
String password = request.getParameter("password");

session.setAttribute("user_id", userId);
session.setAttribute("user_name", "김범준");
session.setAttribute("login_status", "ok");

// session에 로그인 처리 후 페이지 이동
response.sendRedirect("login_form.jsp");
%>