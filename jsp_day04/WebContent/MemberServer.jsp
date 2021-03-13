<%@page import="org.comstudy21.MemberVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <%!// 멤버 필드 선언 하는 부분
private ArrayList<MemberVo> list = new ArrayList<MemberVo>();
{
	list.add(new MemberVo("1001","KIM","kim@naver.com","010-1111-1111"));
	list.add(new MemberVo("1002","HONG","hong@naver.com","010-1111-2222"));
	list.add(new MemberVo("1003","PARK","park@naver.com","010-1111-3333"));
}%>
<%
// service() 메소드 구현 부분
if("POST".equals(request.getMethod())) {
	// POST 요청 처리 부분
	String no = request.getParameter("no");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	list.add(new MemberVo(no,name,email,phone));
	System.out.println("저장 완료");
} else {
	// GET 요청 처리 부분
	// JSONObject 라이브러리를 활용해서 ArrayList 데이터를 JSON 문자열로 변경한다.
	// 변경된 JSON문자열을 화면에 출력 한다.
	JSONArray jsArr = new JSONArray();
	   for(int i=0; i<list.size(); i++) {
	      JSONObject jsObj = new JSONObject();
	      jsObj.put("no", list.get(i).getNo());
	      jsObj.put("name", list.get(i).getName());
	      jsObj.put("email", list.get(i).getEmail());
	      jsObj.put("phone", list.get(i).getPhone());
	      jsArr.put(jsObj);
	   }
	   JSONObject rootObj = new JSONObject();
	   rootObj.put("mem_list", jsArr);
	   
	   out.println(rootObj.toString());
	}
%>