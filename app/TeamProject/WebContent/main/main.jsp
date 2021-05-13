<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "menuboard.BoardDBBean" %>
<%@ page import = "menuboard.BoardDataBean" %>
<%@ page import="event.EventBoardDAO" %>
<%@ page import="event.EventBoardDTO" %>
<%@ page import = "latterboard.LatterBoardDAO" %>
<%@ page import = "latterboard.LatterBoardDTO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file="color.jsp"%>
<!-- https://meesig.com/ -->
<style>
li{ margin-bottom:2px;  margin-right:2px;padding:2px;text-align:center;}
li.mystyle{margin-bottom:2px; list-style-type:none; margin-right:2px;padding:2px;text-align:center;}

}
</style>

<%
String id = request.getParameter("id"); //admin 확인


    int pageSize = 4;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;


    List articleList = null;
    List articleList2 = null;
    List articleList3 = null;
    
    BoardDBBean dbPro =new BoardDBBean();
    EventBoardDAO dao =new EventBoardDAO();
    LatterBoardDAO dao2 = new LatterBoardDAO();
    
    count = dbPro.getArticleCountK();
    if (count > 0) {
        articleList = dbPro.getArticlesK(startRow, endRow);
        articleList2 = dao.getArticles(startRow, endRow);
        articleList3 = dao2.getArticles(startRow, endRow);
    }


%>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body >


<%if (count == 0) {%>
	<table width="700" border="1" cellpadding="0" cellspacing="0">
		<tr>
    		<td align="center">
    			게시판에 저장된 글이 없습니다.
    		</td>
    	</tr>
	</table>

<%  } else {    %>

<center>

<div >
	<h2 class="titMain">메뉴 추천</h2>						
</div>

						
<table border=1 >
<%	for (int i = 0 ; i < articleList.size() ; i++) {
    	BoardDataBean article = (BoardDataBean)articleList.get(i);
%>
   
 <%if (article.getType().equals("한식") ) {%>		

<% if(i%4==0 && i!=0) { %> <tr></tr>  <%  } %>
<td>
<a href="content.jsp?num=<%=article.getNum() %>&id=<%=id %>" >
<li class="mystyle"><img src="<%=article.getFileimage()%>" height="240" width="300"> </li>						 								
<li class="mystyle"><strong ><%=article.getSubject()%></strong></li>		</a>							
						 
     <%  } %><!-- 서양식 종료 -->    
 </td>       	
  <%  } %><!-- for문 종료 -->
</table>

<table border=1 > <!--  이벤트 페이지 -->
<div >
	<h2 class="titMain">이벤트</h2>						
</div>
<%	for (int i = 0 ; i < articleList2.size() ; i++) {
	EventBoardDTO dto = (EventBoardDTO)articleList2.get(i);
%>
   

<% if(i%4==0 && i!=0) { %> <tr></tr>  <%  } %>
<td>
<a href="/TeamProject/event/content.jsp?num=<%=dto.getNum() %>&pageNum=<%=currentPage%>" >
<li class="mystyle"><img src="<%=dto.getFilePath() %>"  height="240" width="300" /></li>					 								
<li class="mystyle"><strong ><%=dto.getSubject()%></strong></li>		</a>							
						 
    
 </td>       	
  <%  } %><!-- for문 종료 -->
</table>
<table border=1 > <!--  후기 게시판 -->
<div >
	<h2 class="titMain">후기 게시판</h2>						
</div>
<%	for (int i = 0 ; i < articleList3.size() ; i++) {
	LatterBoardDTO dto = (LatterBoardDTO)articleList3.get(i);
%>
   

<% if(i%4==0 && i!=0) { %> <tr></tr>  <%  } %>
<td>
<a href="/TeamProject/latterBoard/content.jsp?num=<%=dto.getNum() %>&pageNum=<%=currentPage%>" >
<li class="mystyle"><img src="<%=dto.getFilepath()  %>"  height="240" width="300" /></li>					 								
<li class="mystyle"><strong ><%=dto.getSubject()%></strong></li>		</a>							
						 
    
 </td>       	
  <%  } %><!-- for문 종료 -->
</table>


  <%  } %><!-- else 종료 -->
  
 

</center>

</body>
</html>