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


<%@ page import="Login.MemberDAO.PwCheck" %>

<%



%>

