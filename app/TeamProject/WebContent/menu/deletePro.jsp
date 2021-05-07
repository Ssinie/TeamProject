<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="menuboard.BoardDBBean" %>

<jsp:useBean class="menuboard.BoardDataBean" id="BoardDataBean" /> 
<jsp:setProperty property="*" name="BoardDataBean" />

    <h1>deletrPro</h1>
  
    <%
    String id = request.getParameter("id"); //admin 확인/
    
    BoardDBBean db = new BoardDBBean();
    db.delete(BoardDataBean);
    %>
   <script>
	alert("삭제 완료");
	window.location="deleteForm_list.jsp?id=<%=id%>";
</script>