<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="CSBoard.csDAO" %>
<%@ page import="CSBoard.csDTO" %>
<%@ page import="java.util.ArrayList" %>
	<title> 고객 1:1 문의 글</title>
	
<%
	csDAO dao = new csDAO();
	ArrayList<csDTO> list = dao.getList();
%>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>날짜</td>
			<td>조회수</td>
		</tr>
			<%for(csDTO dto : list){%>
				<tr>
					<td><%=dto.getNum()%></td>
					<td><%=dto.getSubject()%></td>
					<td><%=dto.getWriter()%></td>
					<td><%=dto.getReg()%></td>
					<td><%=dto.getReadcount()%></td>
				</tr>
			<%}%>
	</table>
	<input type="button" value="글쓰기" onclick="window.location='csBoardWrite.jsp'"/>
	