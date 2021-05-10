<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "menuboard.BoardDBBean" %>
<%@ page import = "menuboard.BoardDataBean" %>

<%@ include file="color.jsp"%>

<style>
ul{}
li{margin-bottom:10px;}
 li.mystyle{list-style-type:none; float:left; outline:1px line black; margin-right:10px;padding:20px;text-align:center;}
#STATICMENU { positi 7on:absolute;font-size:20; margin: 0pt; padding: 0pt;  position: absolute; right: 0px; top: 0px; background-color:rgba(255,255,255,0.5);
}

</style>

<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<%
	String id = request.getParameter("id"); //admin 확인/
	
	int num = Integer.parseInt(request.getParameter("num"));
	

	BoardDBBean dbPro = new BoardDBBean();
	BoardDataBean article =  dbPro.getArticle(num);
  

%>
<body >

<center><b><%=article.getType() %></b>
<br>
<form action="updatePro.jsp" method="post" enctype="multipart/form-data">
<table width="500" border="1" cellspacing="0" cellpadding="0"   align="center">  
	<tr height="30">
		
	    <td align="center" width="125" ><img src="<%=article.getFileimage() %>" height="350" width="350"></td>
	    
  </tr>
  
	<tr height="30">
		<input type="hidden" name="num" value="<%=num %>"> 
	    <input type="hidden" name="id" value="<%=id %>"> 
	    <td align="center" width="125" ><input type="text" align="center" name="subject" value="<%=article.getSubject() %>"  ></td>
	</tr>  	 
  <tr height="30">
	    <td align="center" width="125" ><textarea cols="80" rows="10" name="content" ><%=article.getContent() %></textarea></td>
	</tr>  	    
 
</table>

<table border="1">
<tr height="30" >

 <td align="right" width="125" ><input type="file" name="file" value="파일"/></td>
 
 </tr>
<tr height="30" >
 
 <td align="center" width="125" ><input type="submit" value="수정"/></td>
 <td align="center" width="125" ><input type="button" value="취소" onclick="window.location='updateForm_list.jsp?id=<%=id%>'"/></td>
 </tr>
</table>
</form>
</body>
</html>      
