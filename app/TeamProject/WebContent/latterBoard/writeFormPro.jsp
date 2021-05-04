<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "latterboard.LatterBoardDAO"%>
<%@ page import = "java.sql.Timestamp"%>


<jsp:useBean id="dto" class="latterboard.LatterBoardDTO"/>
<jsp:setProperty name="dto" property="*" />

<%
	String id = (String)session.getAttribute("memId");
	dto.setReg_date(new Timestamp(System.currentTimeMillis()));
	dto.setIp(request.getRemoteAddr());
	dto.setWriter(id);
	LatterBoardDAO dao = new LatterBoardDAO();
	dao.insertArticle(dto);
	
	response.sendRedirect("latterBoard.jsp");
%>