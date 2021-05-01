<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="CSBoard.csDTO" %>
<%@ page import="CSBoard.csDAO" %>
<title> 작성 글 내용 </title>

<%
	int num = Integer.parseInt(request.getParameter("num"));

	csDAO dao = new csDAO();
	dao.readCount(num);
	csDTO dto = dao.getContent(num);
%>
	글 번호 : <%=dto.getNum()%><br />
	작성자 : <%=dto.getWriter()%><br />
	제목 : <%=dto.getSubject()%><br />
	조회수 : <%=dto.getReadcount()%><br />
	작성날짜 : <%=dto.getReg()%><br />
	<%if(dto.getSave() != null){ %>
	첨부파일 : <%=dto.getSave()%><br />
	<%}%>
	내용 : <%=dto.getContent()%><br />
	
	<input type="button" value="수정" onclick="window.location='csBoardUpdate.jsp'" />
	<input type="button" value="삭제" onclick="window.location='csBoardDelete.jsp'" />
	<input type="button" value="글목록" onclick="window.location='csBoardList.jsp'" />