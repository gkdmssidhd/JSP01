<%@page import="org.comstudy21.HODao"%>
<%@page import="org.comstudy21.HOVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>냥냥 수정</title>
<style>
label {
	display: inline-block;
	width: 60px;
}
p{
	margin: 5px 0;
}
fieldset {
	width: 300px;
}
</style>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
$(function() {
	$('form').submit(function() {
		event.preventDefault();
		if(this.no.value == "") {
			alert("no는 필수 입력 항목입니다!");
			this.no.focus();
			return;
		}
		if(this.name.value == "") {
			alert("name는 필수 입력 항목입니다!");
			this.name.focus();
			return;
		}
		if(this.email.value == "") {
			alert("email는 필수 입력 항목입니다!");
			this.email.focus();
			return;
		}
		if(this.phone.value == "") {
			alert("phone는 필수 입력 항목입니다!");
			this.phone.focus();
			return;
		}
		this.action = "modify_ho.jsp";
		this.method = "GET";
		this.submit();
	});
});
</script>
</head>
<body>
<h1>::: 고객정보 수정 :::</h1>
<%
String no = request.getParameter("no");
out.println("no => " + no);
HOVo HO = HODao.selectOne(new HOVo(no));
%>
<form>
	<input type="hidden" id="no" name="no" value="<%=HO.getNo() %>"/>
	<fieldset>
		<legend>기본정보</legend>
		<p><label for="no">No</label><input type="text" value="<%=HO.getNo() %>" disabled="disabled"/></p>
		<p><label for="name">Name</label><input type="text" id="name" name="name" value="<%=HO.getName() %>"/></p>
		<p><label for="email">Email</label><input type="text" id="email" name="email" value="<%=HO.getEmail() %>"/></p>
		<p><label for="phone">Phone</label><input type="text" id="phone" name="phone" value="<%=HO.getPhone() %>"/></p>
		<p><input type="submit" value="저장하기" /></p>
	</fieldset>
</form>
</body>
</html>