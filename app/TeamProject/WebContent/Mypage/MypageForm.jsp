<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ page import="Login.MemberDTO" %>
<%@ page import="Login.MemberDAO" %>  
<%@ page import="connection.ConnectionDAO" %> 

    <%
	// 세션에 ID를 DB에서 검색 한다. 
	// 검색 결과를 DTO에 대입하여 리턴
	String id = (String)session.getAttribute("memId");
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = new MemberDTO();
	dto = dao.getUserinfo(id);
	
	%>	
	아이디 : <%=dto.getId()%> <br />
	이름 : <%=dto.getName()%><br />
	생년월일 :<%=dto.getYear()%>년<br />
			<%=dto.getMonth()%>월 <br />
			<%=dto.getDay()%>일 <br />
	이메일 : <%=dto.getEmail()%> <br />
	가입날짜 : <%=dto.getReg()%> <br />
	성별: <%=dto.getGender()%> <br />
	연락처: <%=dto.getPhone()%>
    