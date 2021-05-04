<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "QABoard.qaDAO" %>
<%@ page import = "java.sql.Timestamp" %>

<title> Q&A 자주 묻는 질문 글쓰기 처리 </title>

<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="dto" scope="page" class="QABoard.qaDTO" />
<jsp:setProperty name="dto" property="*"/>

<%
	dto.setReg(new Timestamp(System.currentTimeMillis()) );

	qaDAO dao = new qaDAO();
	dao.insertQABoard(dto);

    response.sendRedirect("qaBoardList.jsp");
%>
	<script>
		alert("작성 되었습니다.")
		window.location="qaBoardList.jsp";
	</script>