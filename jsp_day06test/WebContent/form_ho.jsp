<%@ page import="org.comstudy21.HODao" %>
<%@ page import="org.comstudy21.HOVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// 서비스 메소드 = 실제 기능을 수행하는 메소드
	// HTML 페이지에서 전달한 파라미터 값을 받는다.
	// Vo객체를 생성하여 전달받은 값을 넣는다
	// 전달받은값이 저장된 Vo 객체를 Dao로 전달한다.
	// Dao 기능을 수행완료하면 list 페이지로 redirect(이동)한다.
	
	// 전달 받은 값을 저장하는 용도로 변수 선언
	// request.getParameter( {데이터 name} )
	// > 화면에서 submit시 전달되는 데이터가 Request 객체에 저장되는데, Request 에서 데이터를 가져오는 기능
	// > {데이터 name} : HTML 화면에 있는 input name의 name을 말함

	String no = request.getParameter("no");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	
	// 데이터 전송을 위한 클래스 
	// vo가 없을 경우, 파라미터 값을 넘길때 일일히 하나하나 다 작성해줘야 함.
	// new HOVo(no, name, email, phone); 생성함과 동시에 해당 데이터들을 저장하겠다.
	HOVo vo = new HOVo(no, name, email, phone);
	
	// vo안에 값을 출력할 때는 toString() 메소드 사용
	System.out.println(vo.toString());
	
	// Dao : DB 연동 및 해당 서비스와 관련된 쿼리문 작성
	// insert(vo) -> vo에 저장된 데이터를 저장하기 위한 HIDao.insert() 호출
	HODao.insert(vo);
	
	// HIDao.insert(vo) 완료되면 list.jsp 로 이동
	// response.sendRedirect(url) : 화면을 이동시킬때 사용하는 기능 ex. response.sendRedirect("list.jsp");
	response.sendRedirect("list.jsp");

%>