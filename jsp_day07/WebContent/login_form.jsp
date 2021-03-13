<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그인 페이지</h2>
<%
if("ok".equals(session.getAttribute("login_status")) ) {
	String userName = (String)session.getAttribute("user_name");
	String userId = (String)session.getAttribute("user_id");
%>
	<p><%=userName %>님 어서오세요.<br>
	<%=userName %>님의 ID는 <%=userId %>입니다.</p>
	<a href="logout.jsp">로그아웃</a>
<%
} else {
%>
<form action="login.jsp" method="POST">
<table>
	<tr>
		<td>ID</td>
		<td><input type="text" name="user_id" value="user01"/></td>
		<td rowspan="2">
			<input type="submit" value="Login" style="height:50px;"/>
		</td>
	</tr>
	<tr>
		<td>PASS</td>
		<td><input type="password" name="password" value="12345"/></td>
	</tr>
</table>
</form>
<% } %>
</body>
</html>