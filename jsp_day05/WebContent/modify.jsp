<%@page import="org.comstudy21.MemberDao"%>
<%@page import="org.comstudy21.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하는 곳</title>
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
		this.action = "modify_ok.jsp";
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
MemberVo member = MemberDao.selectOne(new MemberVo(no));
%>
<form>
	<input type="hidden" id="no" name="no" value="<%=member.getNo() %>"/>
	<fieldset>
		<legend>기본정보</legend>
		<!-- value="member.getNo() 값에 내가 DB에서 조회해온 전에 저장했던 애들의 값을 넣겠다.-->
		<p><label for="no">No</label><input type="text" value="<%=member.getNo() %>" disabled="disabled"/></p>
		<p><label for="name">Name</label><input type="text" id="name" name="name" value="<%=member.getName() %>"/></p>
		<p><label for="email">Email</label><input type="text" id="email" name="email" value="<%=member.getEmail() %>"/></p>
		<p><label for="phone">Phone</label><input type="text" id="phone" name="phone" value="<%=member.getPhone() %>"/></p>
		<p><input type="submit" value="저장하기" /></p>
	</fieldset>
</form>
</body>
</html>