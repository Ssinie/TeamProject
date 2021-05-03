<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="CSBoard.csDAO" %>
<%@ page import="CSBoard.csDTO" %>

<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");

      csDAO dao = new csDAO();
      csDTO dto =  dao.updateGetCSBoard(num);

%>
<body bgcolor="white">  
<center><b>글수정</b>
<br>
<form method="post" name="writeform" action="csBoardUpdatePro.jsp?pageNum=<%=pageNum%>" onsubmit="return writeSave()">
<table width="400" border="1" cellspacing="0" cellpadding="0"  bgcolor="white" align="center">
  <tr>
    <td  width="70"  bgcolor="white" align="center">이 름</td>
    <td align="left" width="330">
       <input type="text" size="10" maxlength="10" name="writer" value="<%=dto.getWriter()%>">
	   <input type="hidden" name="num" value="<%=dto.getNum()%>"></td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="white" align="center" >제 목</td>
    <td align="left" width="330">
       <input type="text" size="40" maxlength="50" name="subject" value="<%=dto.getSubject()%>"></td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="white" align="center">Email</td>
    <td align="left" width="330">
       <input type="text" size="40" maxlength="30" name="email" value="<%=dto.getEmail()%>"></td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="white" align="center" >내 용</td>
    <td align="left" width="330">
     <textarea name="content" rows="13" cols="40"><%=dto.getContent()%></textarea></td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="white" align="center" >비밀번호</td>
    <td align="left" width="330" >
     <input type="password" size="8" maxlength="12" name="passwd">
     
	 </td>
  </tr>
  <tr>      
   <td colspan=2 bgcolor="white" align="center"> 
     <input type="submit" value="글수정" >  
     <input type="reset" value="다시작성">
     <input type="button" value="목록보기" 
       onclick="document.location.href='csBoardList.jsp?pageNum=<%=pageNum%>'">
   </td>
 </tr>
 </table>
</form>
</body>
</html>