<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "event.EventBoardDTO" %>
<%@ page import = "event.EventBoardDAO" %>
<center><h1><b>이벤트 내용 수정</b></h1></center>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
%>

<form action="updatePro.jsp" method="post" >
			<input type="hidden" name="num" value="<%=num%>" />
	작성자 : <input type="text" name="writer" value="<%=writer%>" /> <br />
	제 목 : <input type="text" name="subject" value="<%=subject%>"/> <br />
	내용 : <textarea rows="10" cols="40" name="content"><%=content%></textarea> <br />
			<input type="submit" value="글수정" />
</form>

