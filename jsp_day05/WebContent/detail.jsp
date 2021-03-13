<%@page import="org.comstudy21.MemberDao"%>
<%@page import="org.comstudy21.MemberVo"%>
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
// no의 값만가져와서
String no = request.getParameter("no");
// 
MemberVo member = MemberDao.selectOne(new MemberVo(no));
// 만약 멤버가 빈값이 아닐때 실행.
if(member != null) {
%>
<table>
	<tr>
		<th>No</th>
		<td><%=member.getNo() %></td>
	</tr>
	<tr>
		<th>Name</th>
		<td><%=member.getName() %></td>
	</tr>
	<tr>
		<th>Email</th>
		<td><%=member.getEmail() %></td>
	</tr>
	<tr>
		<th>Phone</th>
		<td><%=member.getPhone() %></td>
	</tr>
	<tr>
		<th colspan="2">
			<a href="list.jsp">목록</a>
			<a href="modify.jsp?no=<%=member.getNo() %>">수정</a>
			<a href="delete.jsp?no=<%=member.getNo() %>">삭제</a>
		</th>
	</tr>
</table>
<%} // end of if %>
</body>
</html>