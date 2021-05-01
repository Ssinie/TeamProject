<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="CSBoard.csDAO" %>
<%@ page import="CSBoard.csDTO" %>

<% request.setCharacterEncoding("UTF-8");%>

	<title> 1:1 문의글 수정 </title>
	
<%
	int num = Integer.parseInt(request.getParameter("num"));
	csDAO dao = new csDAO();
	csDTO dto = dao.getContent(num);
%>
<form action="updatePro.jsp" method="post" enctype="multipart/form-data">
	<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
	작성자 : <input type="text" name="writer"<%=dto.getWriter() %>/><br />
	제목 : <input type="text" name="subject"<%=dto.getSubject() %>/><br />
	첨부파일 : <input type="file" name="save"/><br />
	내용 : <textarea rows="10" cols="40" name="content"<%=dto.getContent() %>></textarea><br />
	<input type="submit" value="수정"/>
</form>