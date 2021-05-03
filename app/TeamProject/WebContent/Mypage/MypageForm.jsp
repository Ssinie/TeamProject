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
	
	select * from MEMBER where= 'id'
		
	%>
	
	id : <%=id%> <br />
	이름 : <%=name%><br />
	생년월일 :<%=year%><br />
			<%=Month%> <br />
			<%=Day%> <br />
	이메일 : <%=Email%> <br />
	가입날짜 : <%=reg%> <br />
	성별: <%=gender%> <br />
	연락처: <%=phone%>
		
		
    