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
	String st_date = request.getParameter("st_date");
	String end_date = request.getParameter("end_date");
%>

<form action="updatePro.jsp" method="post" >
<input type="hidden" name="num" value="<%=num%>" />

<table width="870" border="1" cellspacing="0" cellpadding="0"  align="center">
	<tr>
	<td width="200" align="center">작성자</td>
	<td width="330">
		<input type="text" name="writer" value="<%=writer%>" /></td>
	</tr>
	<tr>
	<td width="200" align="center">제  목</td>
	<td  width="330">
		<input type="text" name="subject" value="<%=subject%>"/></td>
	</tr>
	<tr>
	<td width="200" align="center">내  용</td>
	<td  width="330">
	<textarea rows="10" cols="40" name="content"><%=content%></textarea></td>
	</tr>
	<tr>
	<td width="200" align="center">이벤트 시작일</td>
	<td  width="330">
		<input type="date" name="st_date" value="<%=st_date %>" />
	</tr>
	<tr>
	<td width="200" align="center">이벤트 종료일</td>
	<td  width="330">
		<input type="date" name="end_date" value="<%=end_date %>" />
	</tr>
	 <tr>      
	 <td colspan=2 align="center"> 
			<input type="submit" value="글수정" />	
			<input type="button" value="글목록" OnClick="window.location='list.jsp'">	
	 </td></tr></table>	 
</form>