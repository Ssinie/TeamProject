<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="event.EventBoardDTO" %>
<%@ page import="event.EventBoardDAO" %>

<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="dto" scope="page" class="event.EventBoardDTO" />
<jsp:setProperty name="dto" property="*"/>

<%
 	dto.setRe_date(new Timestamp(System.currentTimeMillis()));

	EventBoardDAO dao = new EventBoardDAO();
	dao.insertArticle(dto);

    //response.sendRedirect("list.jsp");
%>

	<script>
		alert("작성되었습니다.");
		window.location="list.jsp";		
	</script>

	