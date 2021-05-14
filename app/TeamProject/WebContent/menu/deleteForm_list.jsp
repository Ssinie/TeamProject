<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "menuboard.BoardDBBean" %>
<%@ page import = "menuboard.BoardDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file="color.jsp"%>

<style>
li{margin-bottom:2px;list-style-type:none; margin-right:2px;padding:2px;text-align:center;}
li.mystyle{margin-bottom:2px; list-style-type:none; margin-right:2px;padding:2px;text-align:center;}
#STATICMENU { positi 7on:absolute;font-size:20; margin: 0pt; padding: 0pt;  position: absolute; right: 0px; top: 0px; background-color:rgba(255,255,255,0.5);
}


</style>
 
<%
String id = request.getParameter("id"); //admin 확인/

    int pageSize = 9;
  

    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number=0;

    List articleList = null;
    BoardDBBean dbPro =new BoardDBBean();
    count = dbPro.getArticleCount();
    if (count > 0) {
        articleList = dbPro.getArticles(startRow, endRow);
    }

	number=count-(currentPage-1)*pageSize;
%>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body  >

<div style="height:1100px;" >


<center><b></b>
<table width="650">
	<tr>
   	
    	<td align="right" >
    	
    		<h2 align="center"> 수정 할 게시글을 선택 하세요.</h1>   	
    	</td>
    	<td align="right" >   	
    		<h2 align="center"> <input type="button" value="돌아가기" onclick="window.location='Korean.jsp?id=<%=id %>'"/></h1>   	
    	</td>

    </tr>
</table>

<%if (count == 0) {%>
	<table width="700" border="1" cellpadding="0" cellspacing="0">
		<tr>
    		<td align="center">
    			게시판에 저장된 글이 없습니다.
    		</td>
    	</tr>
	</table>

<%  } else {    %>




<form action="deletePro.jsp?id=<%=id %>" metohd="post" >


  <input type="hidden" name="id" value="<%=id %>"> 

<table border=1 >
<%	for (int i = 0 ; i < articleList.size() ; i++) {
    	BoardDataBean article = (BoardDataBean)articleList.get(i);
%>
<% if(i%3==0 && i!=0) { %> <tr></tr>  <%  } %>
<td>
<input type="checkbox" name="ch" value="<%=article.getNum()%>" />
<li >
	<div><img src="<%=article.getFileimage()%>" height="250" width="350"> </div>							
</li> 
<div >
<li><strong ><%=article.getSubject()%></strong></li>
</div>
 </td>
			
  <%  } %><!-- for문 종료 -->
  <input type="submit" value="삭제" >
</table>
  </form> 
  <%  } %><!-- else 종료 -->

 </div>
 <center>
<center>
<%
    if (count > 0) {
        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		 
        int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount;
        
        if (startPage > 10) {    %>
        <a href="deleteForm_list.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
        	<a href="deleteForm_list.jsp?pageNum=<%= i %>&id=<%=id%>">[<%= i %>]</a>
<%		}
        if (endPage < pageCount) {  %>
        	<a href="deleteForm_list.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%		}
    }
%>

</center>

</body>
</html>