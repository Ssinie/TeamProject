<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = (String)session.getAttribute("memId");
%>
<%--
	if(id == null){
%>		<script>
			alert("로그인후 글쓰기 가능합니다.!!");
			window.location='/TeamProject/Login/Login.jsp';
		</script>
<%  }--%>

<% 
  int num=0,ref=1,re_step=0,re_level=0;
 
    if(request.getParameter("num")!=null){
		num=Integer.parseInt(request.getParameter("num"));
		ref=Integer.parseInt(request.getParameter("ref"));
		re_step=Integer.parseInt(request.getParameter("re_step"));
		re_level=Integer.parseInt(request.getParameter("re_level"));
	}
%>

<title> Q&A 1:1 문의 게시판 </title>

    <b align="center"><font size="6" color="lightblack"> Q&A</font></b>

	<form action="csBoardWritePro.jsp" method="post" enctype="multipart/form-data">
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="ref" value="<%=ref%>">
	<input type="hidden" name="re_step" value="<%=re_step%>">
	<input type="hidden" name="re_level" value="<%=re_level%>">
	
	<table width="700" border="1" cellpadding="0" cellspacing="0" bordercolor="dddddd" align="center">
		<tr>
		    <td align="right" colspan="2" bgcolor="white">
			<a href="csBoardList.jsp"> 글목록</a> 
		</td>
		</tr>
		<tr>
			<td id="title">작성자</td>
			<td> <input type="hidden" name="writer" value="<%=id%>"> </td>
		</tr>
		<tr>
			<td id="title">제목</td>
			<td> <input name="subject" type="text" size="90" maxlength="100" value=""></td>
		</tr>
		<tr>
			<td id="title">내용</td>
			<td><textarea rows="20" cols="72" name="content"></textarea></td>
		</tr>
		<tr>
			<td id="title">파일첨부</td>
			<td> <input type="file" name="save"></td>
		</tr>
		<tr align="center" valign="middle">
			<td colspan="5">
				<input type="reset" value="작성취소" onclick="window.location='csBoardList.jsp'">
				<input type="submit" value="등록" onclick="window.location='csBoardList.jsp'">
				<input type="button" value="목록" onclick="window.location='csBoardList.jsp'">
			</td>
		</tr>
	</table>
	</form>