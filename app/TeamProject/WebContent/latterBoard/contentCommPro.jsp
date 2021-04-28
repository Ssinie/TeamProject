<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="latterboard.LatterBoardDTO" %>
<%@ page import="latterboard.LatterBoardDAO" %>
<%@ page import="latterboard.LBCommDAO" %>
<%request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id = "dto" class="latterboard.LBCommDTO" />
<jsp:setProperty property="*" name="dto" />
<%
	LBCommDAO dao = new LBCommDAO();	

	int count = dao.countComm(dto.getNum());
	
	dao.inputComm(dto, count);
%>
<script>
	history.go(-1);
</script>