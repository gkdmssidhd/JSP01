<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// session 사용하기
// session은 브라우저 하나당 한개씩 만들어진다.(사용자 정보 저장)
// request는 주소단위로 바뀐다.
// 내장객체 : pageContext, request(주소), session(브라우저), application(서버)
// session을 이용해서 로그인, 장바구니 같은 기능을 구현 가능하다.
// JSP 페이지에는 session이 자동 생성 되어 있다.
// JSP ==> Servlet
// 내장객체 공통 메소드 : setAttribute(key, value), getAttribute(key)

// session에 값을 저장 해 본다.
session.setAttribute("user", "홍길동");
// value가 Object 타입으로 저장 된다. 
// 다운캐스팅이 필요하다.
String user = (String)session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>세션에 저장된 사용자 확인</h2>
<p>사용자 : <%=user %></p>
<a href="day07ex01_2.jsp">day07ex01_2.jsp</a>

</body>
</html>