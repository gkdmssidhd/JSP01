<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>day07ex01_2.jsp 페이지입니다.</h2>
<%
// session에 저장된 user 정보 확인
// session에 저장된 정보는 페이지가 바뀌어도 사용 가능하다.
// 브라우저만 같은 브라우저라면 주소가 바껴도 사용 가능.
String user = (String)session.getAttribute("user");
%>
<p>세션에 저장된 정보 확인 : <%=user %></p>
</body>
</html>