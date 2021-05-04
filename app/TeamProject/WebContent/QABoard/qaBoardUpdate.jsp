<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="QABoard.qaDAO" %>
<%@ page import="QABoard.qaDTO" %>

<title> Q&A 자주 묻는 질문 수정 </title>

<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<%
	String id = (String)session.getAttribute("memId");
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");

	qaDAO dao = new qaDAO();
	qaDTO dto =  dao.updateGetQABoard(num);
%>
<body bgcolor="white">  
<center><b>자주 묻는 질문 글 수정하기</b>
<br>
<form method="post" name="writeform" action="qaBoardUpdatePro.jsp?pageNum=<%=pageNum%>" onsubmit="return writeSave()">
	<input type="hidden" name="num" value="<%=num%>">
<table width="600" border="1" cellspacing="0" cellpadding="0"  bgcolor="white" align="center">
  <tr>
    <td  width="100"  bgcolor="white" align="center">작성자</td>
    <td align="left" width="500"><%=id%>
       <input type="hidden" name="writer" value="<%=id%>"></td>
  </tr>
  
  <tr>
    <td  width="100"  bgcolor="white" align="center" >제 목</td>
    <td align="left" width="500">
       <input type="text" size="80" maxlength="50" name="subject" value="<%=dto.getSubject()%>"></td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="white" align="center">Email</td>
    <td align="left" width="500">
       <input type="text" size="80" maxlength="30" name="email" value="<%=dto.getEmail()%>"></td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="white" align="center" >내 용</td>
    <td align="left" width="500">
     <textarea name="content" rows="15" cols="60"><%=dto.getContent()%></textarea></td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="white" align="center" >비밀번호</td>
    <td align="left" width="500" >
     <input type="password" size="80" maxlength="15" name="passwd">
     
	 </td>
  </tr>
  <tr>
   <td colspan=2 bgcolor="white" align="center"> 
     <input type="submit" value="글수정" >  
     <input type="reset" value="작성취소" >
     <input type="button" value="목록보기" onclick="document.location.href='qaBoardList.jsp?pageNum=<%=pageNum%>'">
   </td>
 </tr>
 </table>
</form>
</body>
</html>