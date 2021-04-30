<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "menuboard.BoardDBBean" %>
<%@ page import = "menuboard.BoardDataBean" %>

<%@ include file="color.jsp"%>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	
 
	BoardDBBean dbPro = new BoardDBBean();
	BoardDataBean article =  dbPro.getArticle(num);
  

%>
<body bgcolor="<%=bodyback_c%>">  
<center><b>글내용 보기</b>
<br>
<table width="500" border="1" cellspacing="0" cellpadding="0"  bgcolor="<%=bodyback_c%>" align="center">  
	<tr height="30">
		
	    <td align="center" width="125" bgcolor="<%=value_c%>"><img src="<%=article.getFileimage() %>"</td>
	    
  </tr>
  <tr height="30">
	    <td align="center" width="125" bgcolor="<%=value_c%>"><%=article.getContent() %></td>
	  	    
 

</table>
</body>
</html>      
