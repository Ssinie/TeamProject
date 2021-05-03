<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "menuboard.BoardDBBean" %>
<%@ page import = "menuboard.BoardDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file="color.jsp"%>

<style>
ul{}
li{margin-bottom:10px;}
 li.mystyle{list-style-type:none; float:left; outline:1px line black; margin-right:10px;padding:20px;text-align:center;}
</style>

<script type="text/javascript">
 
</script>

<%
String id = (String)session.getAttribute("memid"); //admin 확인

    int pageSize = 10;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

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

<body bgcolor="<%=bodyback_c%>" onload="InitializeStaticMenu();">


<center><b></b>
<table width="700">
	<tr>
   	
    	<td align="right" bgcolor="<%=value_c%>">
    	
    		<input type="button" value="글삭제" onclick="" />
    	
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

<div class="contArea mainCont"></div>						

<table>
<%	for (int i = 0 ; i < articleList.size() ; i++) {
    	BoardDataBean article = (BoardDataBean)articleList.get(i);
%>
   
      
   
  
  	
  	<tr><td><img src="<%=article.getFileimage()%>" ></td> </tr>

   
     
     	
  <%  } %><!-- for문 종료 -->
  
    </table> 	
  <%  } %><!-- else 종료 -->
    
 

<%
    if (count > 0) {
        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		 
        int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount;
        
        if (startPage > 10) {    %>
        <a href="japanese.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
        	<a href="japanese.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%		}
        if (endPage < pageCount) {  %>
        	<a href="japanese.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%		}
    }
%>

</center>

</body>
</html>