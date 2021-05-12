<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>logout</h1>


<%
session.invalidate(); //세션 모두 삭제%>
<script>
parent.document.location.reload();
location.href="/TeamProject/lobby/lobby.jsp";
</script>