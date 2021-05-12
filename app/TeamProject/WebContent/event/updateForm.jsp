<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "event.EventBoardDTO" %>
<%@ page import = "event.EventBoardDAO" %>
<center><h1><b>이벤트 내용 수정</b></h1></center>



<%	
	String id = (String)session.getAttribute("memId");
	int num = Integer.parseInt(request.getParameter("num"));
	EventBoardDAO dao = new EventBoardDAO();
	EventBoardDTO dto = dao.updateGetEventBoard(num);
	
%>
<form action="updatePro.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="num" value="<%=num%>" />

<table width="870" border="1" cellspacing="0" cellpadding="0"  align="center">
	<tr>
	<td width="200" align="center">작성자</td>
	<td width="330"><%=id%></td>
		
	</tr>
	<tr>
	<td width="200" align="center">제  목</td>
	<td  width="330">
		<input type="text" name="subject" value="<%=dto.getSubject()%>"></td>
	</tr>
	<tr>
	<td width="200" align="center">내  용</td>
	<td  width="330">
	<textarea rows="10" cols="40" name="content"><%=dto.getContent()%>"</textarea></td>
	</tr>
	<tr>
    <td  width="200" align="center" >첨부파일</td>
    <td  width="330" >
     <input type="file" name="filePath" value="<%=dto.getFilePath() %>" >
  </tr>
	<tr>
	<td width="200" align="center">이벤트 시작일</td>
	<td  width="330">
		<input type="date" name="st_date" value="<%=dto.getSt_date() %>" >
	</tr>
	<tr>
	<td width="200" align="center">이벤트 종료일</td>
	<td  width="330">
		<input type="date" name="end_date" value="<%=dto.getEnd_date() %>" >
	</tr>
	 <tr>      
	 <td colspan=2 align="center"> 
			<input type="submit" value="글수정" >	
			<input type="button" value="글목록" OnClick="window.location='cardlist.jsp'">	
	 </td></tr></table>	 
</form>