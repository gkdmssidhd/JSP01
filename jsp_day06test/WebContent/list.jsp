<%@page import="java.util.List"%>
<%@page import="org.comstudy21.HODao"%>
<%@page import="org.comstudy21.HOVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원목록</title>
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
				<h1>냥냥 목록</h1>
				<table>
					<tr>
						<th>NO</th>
						<th>NAME</th>
						<th>EMAIL</th>
						<th>PHONE</th>
					</tr>
				<%
				List<HOVo> list = HODao.selectAll();
								for(int i=0; i<list.size(); i++) {
									HOVo HO = list.get(i);
				%>
					<tr>
						<td><%=HO.getNo() %></td>
						<td><a href="detail.jsp?no=<%=HO.getNo() %>"><%=HO.getName() %></a></td>
						<td><%=HO.getEmail() %></td>
						<td><%=HO.getPhone() %></td>
					</tr>
				<%}// end of for %>
				</table>
			<a href="form.html">회원 정보 입력</a>	
		</body>
</html>