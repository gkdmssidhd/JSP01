<%@page import="org.comstudy21.MemberVo"%>
<%@page import="org.comstudy21.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// request에서 데이터를 가져와
String no = request.getParameter("no");
String name = request.getParameter("name");
String email = request.getParameter("email");
String phone = request.getParameter("phone");

// vo들을 Dao수정에 담는다.
MemberDao.modify(new MemberVo(no, name, email, phone));

// 수정한후 상세보기로 넘어간다. 수정한값만 보인다. 
// 수정페이지에 목록, 보기, 삭제가 있다.
response.sendRedirect("detail.jsp?no="+no);
%>