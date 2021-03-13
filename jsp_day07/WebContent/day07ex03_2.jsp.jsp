<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// 문자열로 다운 캐스팅(String)
// value인지 val 인지 잘 구분 키 값을?구분
// request는 주소가 바뀌면 사라진다.
String reqValue = (String)request.getAttribute("reqVal");
String sesValue = (String)session.getAttribute("sesVal");
String appValue = (String)application.getAttribute("appVal");
%>

<p>reqValue : <%=reqValue %></p>
<p>sesValue : <%=sesValue %></p>
<p>appValue : <%=appValue %></p>

</body>
</html>