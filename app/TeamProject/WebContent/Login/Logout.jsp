<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>logout</h1>


<%
session.invalidate(); //세션 모두 삭제
response.sendRedirect("/TeamProject/lobby/lobby.jsp");

%>