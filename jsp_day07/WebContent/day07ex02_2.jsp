<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day07ex02_2</title>
</head>
<body>
<%
String user2 = (String)request.getAttribute("user2");
%>
<p>day07ex02_2.jsp에서 user2 확인: <%=user2 %></p>
</body>
</html>