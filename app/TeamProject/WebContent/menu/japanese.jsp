<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "menuboard.BoardDBBean" %>
<%@ page import = "menuboard.BoardDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file="color.jsp"%>

<style>
li{margin-bottom:2px;  margin-right:2px;padding:2px;text-align:center;}
li.mystyle{margin-bottom:2px; list-style-type:none; margin-right:2px;padding:2px;text-align:center;}
#STATICMENU { positi 7on:absolute;font-size:20; margin: 0pt; padding: 0pt;  position: absolute; right: 0px; top: 0px; background-color:rgba(255,255,255,0.5);
}
</style>



<%
String id = (String)session.getAttribute("memId"); //admin 확인

    int pageSize = 9;

    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0; // 전체 게시물 수


    List articleList = null;
    BoardDBBean dbPro =new BoardDBBean();
    count = dbPro.getArticleCountJ();
    if (count > 0) {
        articleList = dbPro.getArticlesJ(startRow, endRow);
    }

	
%>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>

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
						<h2 class="titMain">일본 음식</h2>						
					</div>

<%if(id==null){%>
	<input type ="button" value="로그인 / 회원가입" onclick="window.location='/TeamProject/Login/Login.jsp'" />
<%} %>	
	<table >
	<tr>
    	<td align="center" >
    		<% if(id!=null &&id.equals("admin")){%><!-- 유효성 검사 -->
    		<input type="button" value="글쓰기" onclick="window.location='WriteForm.jsp?id=<%=id%>'"/>
    		<input type="button" value="글수정" onclick="window.location='updateForm_list.jsp?id=<%=id%>'"/>
    		<input type="button" value="글삭제" onclick="window.location='deleteForm_list.jsp?id=<%=id%>'"/>
    		<%}%>
    		
    		
    	</td>
    	
    </tr>
</table>
						
<table border=1  >
<%	for (int i = 0 ; i < articleList.size() ; i++) {
    	BoardDataBean article = (BoardDataBean)articleList.get(i);
%>
   <%if (article.getType().equals("일식") ) {%>	
 

<% if(i%3==0 && i!=0) { %> <tr></tr>  <%  } %>
<td>	
							
<a href="content.jsp?num=<%=article.getNum() %>&id=<%=id%>">
<li class="mystyle"><img src="<%=article.getFileimage()%>" height="350" width="350"> </li>					 								
<li class="mystyle"><strong ><%=article.getSubject()%></strong></li>		
<li class="mystyle"><strong ><%=article.getPrice()%></strong></li>	
</a>	
    
     <%  } %><!-- 서양식 종료 -->
 </td>       	
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