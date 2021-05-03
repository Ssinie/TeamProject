<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "CSBoard.csDAO" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="dto" scope="page" class="CSBoard.csDTO" />
<jsp:setProperty name="dto" property="*"/>

<%
    dto.setReg(new Timestamp(System.currentTimeMillis()) );

    csDAO dao = new csDAO();
    dao.insertCSBoard(dto);

    response.sendRedirect("csBoardList.jsp");
%>
	<script>
		alert("작성 되었습니다.")
		window.location="csBoardList.jsp";
	</script>