<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%
/*
	1. 조회를 누른 사람이 유저 / 게스트인지 판별(로그인여부...)
	1-1. 로그인 유저 : 유저의 조회정보 확인 -> Res_info > Res_cont...
	1-2. 게스트 유저 : 예약번호를 입력받음 -> Res_noCheck > Res_content
	
	2. 
*/
	String id = (String)session.getAttribute("memId");
	if(id == null){
		// 비회원
		response.sendRedirect("/TeamProject/Reserve/ReserveNoCheck.jsp");
	}else{
		// 회원
		response.sendRedirect("/TeamProject/Reserve/ReserveInfo.jsp");
	}
%>