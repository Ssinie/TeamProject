<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import = "CSBoard.csDAO" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("UTF-8");%>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	
	csDAO dao = new csDAO();
	dao.deleteBoard(num);
%>
	<script>
		alert("삭제 완료");
		window.location="csBoardList.jsp";
	</script>