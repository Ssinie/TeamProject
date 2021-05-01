<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title> 1:1 문의 글 삭제</title>

<%
	String num = request.getParameter("num");
%>
	<script>
		var re = confirm("글을 삭제하시겠습니까?")
		if(re){
			window.location="csBoardDeletePro.jsp?num=<%=num%>"
		}else{
			history.go(-1);
		}
	</script>