<%@ page import="org.comstudy21.MemberDao" %>
<%@ page import="org.comstudy21.MemberVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%! 
	// 선언부 - 필드, 메소드 선언
%>
<%
	/**
	 * 서비스 메소드 (= 실제 기능을 수행하는 메소드)						| 강사설명 :: _service() 메소드 내부
	 * 기능 1) HTML 페이지에서 전달한 파라미터 값을 받는다.				| 강사설명 :: 클라이언트 HTML)에서 전달한 파라미터 값을 받는다.
	 * 기능 2) Vo 객체를 생성하여 전달받은 값을 넣는다. 					| 강사설명 :: 파라미터 값을 이용해서 MemberVo객체 생성
	 * 기능 3) 전달받은 값이 저장된 Vo 객체를 Dao로 전달한다. 			| 강사설명 :: MemberVo객체를 MemberDao의 insert()에 전달한다.
     * 기능 4) Dao 기능을 수행완료하면 list 페이지로 redirect(이동)한다. 	| 강사설명 :: list.jsp로 redirect한다.
	 */
	
	/**
	 * 변수 선언 : 전달 받은 값을 저장해놓는 용도
	 * request.getParameter({데이터 name})
	 * 	> 화면에서 submit시 전달되는 데이터가 Request 객체에 저장되는데, Request 에서 데이터를 가져오는 기능  
	 * 	> {데이터 name} : HTML 화면에 있는 input name의 name을 말함
	 */
	String no = request.getParameter("no");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	
	/**
	 * 데이터 전송을 위한 클래스 ex. 저장하는 서비스의 경우, 저장할 데이터들로 구성 (name, email, phone ...)
	 * vo가 없을 경우, 파라미터 값을 넘길 때 일일히 하나하나 다 작성해줘야 함 ex. MemberDao.insert(no, name, email, phone);
	 * new MemberVo(no, name, email, phone) : MemberVo 생성자 (생성함과 동시에 해당 데이터들을 저장하겠다)
	 */
	MemberVo vo = new MemberVo(no, name, email, phone);
	
	/** vo안에 값을 출력할 때는 toString() 메소드 사용 */
	System.out.println(vo.toString());
	
	/**
	 * DAO : DB 연동 및 해당 서비스와 관련된 쿼리문 작성
	 * insert(vo) >> vo에 저장된 데이터를 저장하기 위한 MemberDao.insert() 호출
	 */
	MemberDao.insert(vo);
	
	/**
	 * MemberDao.insert(vo)까지 완료되면 list.jsp로 이동한다.
	 * response.sendRedirect(url) : 화면을 이동시킬때 사용하는 기능 ex. response.sendRedirect("list.jsp");
	 */ 
	response.sendRedirect("list.jsp");
%>