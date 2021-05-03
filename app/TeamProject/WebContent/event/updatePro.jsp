<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="event.EventBoardDAO" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean class="event.EventBoardDTO" id="dto" />
<jsp:setProperty name="dto" property="*" />

<%
	EventBoardDAO dao = new EventBoardDAO();
	dao.updateBoard(dto);
%>

<script>
	alert("수정되었습니다..")
	window.location="list.jsp";
</script>
	
	
	
	