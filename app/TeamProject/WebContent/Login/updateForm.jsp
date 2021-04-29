<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Login.MemberDTO" %>
<%@ page import="Login.MemberDAO" %>    
<h1>updateForm</h1>

<%
	// 세션에 ID를 DB에서 검색 한다. 
	// 검색 결과를 DTO에 대입하여 리턴
	String id = (String)session.getAttribute("memId");
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.getMember(id); 
	
%>

<form action="updatePro.jsp" method="post">
	id : <%=id%> <br />
	비밀번호 : <input type="password" name="pw" value="<%=dto.getPw1()%>" /> <br />
	비밀번호확인 : <input type="password" name="pw2" value="<%=dto.getPw2()%>" /> <br />
	이름 : <input type="text" name="name" value="<%=dto.getName()%>" /> <br />
	생년월일 : <input type="text" name="year" value="<%=dto.getYear()%>" /> <br />
			<input type="text" name="month" value="<%=dto.getMonth()%>" /> <br />
			<input type="text" name="day" value="<%=dto.getDay()%>" /> <br />
	이메일 : <input type="text" name="email" value="<%=dto.getEmail()%>" /> <br />
	가입날짜 : <%=dto.getReg() %> <br />
		  <input type="submit" value="수 정" />
</form>









