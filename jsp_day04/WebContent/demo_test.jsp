<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
public String  fname,city;
%>
<%
System.out.println("전송방식 : " + request.getMethod());

//REST 방식 처리 : get, put, delete, post ...
if("POST".equals(request.getMethod()) ) {
	fname=request.getParameter("name");
	city=request.getParameter("city");
	out.println("Post방식으로 전송받은 데이터를 필드에 저장 완료");
} else {
	out.print("Dear " + fname + ". ");
	out.print("Hope you live well in " + city + ".");
}
%>