<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
// request 객체는 주소가 바뀌면 사라진다.
request.setAttribute("user2", "김얄롱");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String user2 = (String)request.getAttribute("user2");
%>
<p>day07ex02.jsp페이지에서 user2 확인 : <%=user2 %></p>
<p><a href="day07ex02_2.jsp">day07ex02_2.jsp</a></p>
<hr />
<%-- <jsp:forward page="day07ex02_2.jsp"></jsp:forward> --%>
<jsp:include page="day07ex02_2.jsp"></jsp:include>
</body>
</html>