<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="event.EventBoardDTO" %>
<%@ page import="event.EventBoardDAO" %>
<%@ page import="java.util.ArrayList" %>

<center><h1><b>이벤트 게시판 목록</b></h1></center>

<%
	EventBoardDAO dao = new EventBoardDAO();
	ArrayList<EventBoardDTO> list = dao.getList();
%>
	<table  width="870" border="1" cellspacing="0" cellpadding="0"  align="center">
		<tr>
			<td align="center">번호</td>
			<td align="center">제목</td>
			<td align="center">작성자</td>
			<td align="center">날짜</td>
			<td align="center">조회수</td>
		</tr>
	<% for (EventBoardDTO dto : list){ %>
		<tr>
			<td width="90" align="center" ><%=dto.getNum() %></td>
			<td width="350" align="center" ><a href="content.jsp?num=<%=dto.getNum()%>"><%=dto.getSubject() %></a></td>
			<td width="90" align="center" ><%=dto.getWriter() %></td>
			<td width="250" align="center" ><%=dto.getRe_date() %></td>
			<td width="90" align="center" ><%=dto.getReadcount() %></td>
		</tr>
	<% } %>
	
	<tr>
	<td colspan=5 align="center"> 
	<input type="button" value="글쓰기" onclick="window.location='WriteForm.jsp'" />
	</td></tr></table>