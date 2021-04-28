<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="Login.MemberDAO" %>

<h1>회원가입 Pro</h1>

<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto"  class="Login.MemberDTO" />
<jsp:setProperty property="*" name="dto"/>

<%
   MemberDAO dao = new MemberDAO();
   dao.insertMember(dto);
%>

<% 
	/* if(id.length < 6){ 
	alert("6글자 이상으로 입력하세요");
	
	}else
	alert("아이디로 적당합니다.");

	회원정보 저장
	pw1 pw2 일치확인 if문
	pw 에 특수문자 들어가는지 for문
	 */
	

%>
