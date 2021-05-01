<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="CSBoard.csDAO" %>
<%@ page import="CSBoard.csDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import = "java.text.SimpleDateFormat" %>

	<title> 고객 1:1 문의 리스트</title>
<%
	int pageSize = 10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	String pageNum = request.getParameter("pageNum");
	if (pageNum == null){
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number=0;

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
				<td>
					<%if(dto.getStatus() == 3){ %>
					해당 글은 삭제 되었습니다.
					<%}else{ %>
					<a href="csBoardContent.jsp?num=<%=dto.getNum()%>"><%=dto.getSubject()%></a>
					<%}%></td>
				<td><%=dto.getWriter()%></td>
				<td><%=dto.getReg()%></td>
				<td><%=dto.getReadcount()%></td>
			</tr>
			<%}%>
	</table>
	<input type="button" value="글쓰기" onclick="window.location='csBoardWrite.jsp'"/>