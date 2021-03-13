<%@page import="java.util.List"%>
<%@page import="org.comstudy21.MemberDao"%>
<%@page import="org.comstudy21.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
	<style>
		table {
			width: 100%;
		}
		table, tr, td, th {
			border: 1px solid #444;
			color : #444;
			border-collapse: collapse;
		}
		th:nth-child(1) {width: 10%;}
		th:nth-child(2) {width: 30%;}
		th:nth-child(3) {width: 30%;}
		th:nth-child(4) {width: 30%;}
	</style>
	</head>
		<body>
		<h1>::: 회원 목록 :::</h1>
		<table>
			<tr>
				<th>NO</th>
				<th>NAME</th>
				<th>EMAIL</th>
				<th>PHONE</th>
			</tr>
		<%
		// Dao의 selecetAll을 vo list객체에 담는다.
		// List<데이터타입>
		// list는 인터페이스 클래스이며 배열의 한계 때문에 만들어진 자료형
		// 메모리가 허용되는 한 계속 해서 추가 할 수 있는 자료형 클래스
		// add() 함수는 값 추가 , 값조회는 get(index)함수 사용
		// contains 값이 있는지 확인하는것 
		List<MemberVo> list = MemberDao.selectAll();
		
		for(int i=0; i<list.size(); i++) { // i는 배열의 위치값
			MemberVo member = list.get(i); //배열(meberVo)의 위치
		%>
			<tr>
				<td><%=member.getNo() %></td>
				<!-- 네임 누르면 디테일로 넘어간다. -->
				<td><a href="detail.jsp?no=<%=member.getNo() %>"><%=member.getName() %></a></td>
				<td><%=member.getEmail() %></td>
				<td><%=member.getPhone() %></td>
			</tr>
		<%}// end of for %>
		</table>
		<!-- 회원정보 입력 누르면 form.html로 이동 --> 
		<a href="form.html">회원 정보 입력</a>
		</body>
</html>