<%@page import="org.comstudy21.HODao"%>
<%@page import="org.comstudy21.HOVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>
<h1>::: 상세보기 :::</h1>
<%
String no = request.getParameter("no");
HOVo HO = HODao.selectOne(new HOVo(no));
if(HO != null) {
%>
<table>
	<tr>
		<th>No</th>
		<td><%=HO.getNo() %></td>
	</tr>
	<tr>
		<th>Name</th>
		<td><%=HO.getName() %></td>
	</tr>
	<tr>
		<th>Email</th>
		<td><%=HO.getEmail() %></td>
	</tr>
	<tr>
		<th>Phone</th>
		<td><%=HO.getPhone() %></td>
	</tr>
	<tr>
		<th colspan="2">
			<a href="list.jsp">목록</a>
			<a href="modify.jsp?no=<%=HO.getNo() %>">수정</a>
			<a href="delete.jsp?no=<%=HO.getNo() %>">삭제</a>
		</th>
	</tr>
</table>
<%} // end of if %>
</body>
</html>