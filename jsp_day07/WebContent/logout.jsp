<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 모든 세션 정보를 한꺼번에 제거한다.
session.invalidate();

// 로그아웃 처리 후에 페이지 전환하기
response.sendRedirect("login_form.jsp");
%>