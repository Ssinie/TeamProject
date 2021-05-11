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
	<Body bgcolor="lightblue">
	<h1 align="center">나의 회원정보 </h1>
	<table border="1" align="center">
	<tr>
	<td>아이디</td> <td><%=dto.getId()%></td></tr>
	<td>이름</td> <td><%=dto.getName()%></td></tr>
	<td>생년월일</td> <td><%=dto.getYear()%>년
						<%=dto.getMonth()%>월
						<%=dto.getDay()%>일</td></tr>
	<td>이메일</td> <td><%=dto.getEmail()%> </td></tr>
	<td>가입날짜</td> <td><%=dto.getReg()%> </td></tr>
	<td>성별</td> <td><%=dto.getGender()%> </td></tr>
	<td>연락처</td> <td><%=dto.getPhone()%></td></tr>
	
	</table>
   

