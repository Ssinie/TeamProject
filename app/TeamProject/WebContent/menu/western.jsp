<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "menuboard.BoardDBBean" %>
<%@ page import = "menuboard.BoardDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file="color.jsp"%>

<style>
ul{}
 li{list-style-type:none; float:left; outline:1px dotted red; maargin-right:100px;padding:20px;text-align:center;}
</style>

<%
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

<body bgcolor="<%=bodyback_c%>">
<center><b>글목록(전체 글:<%=count%>)</b>
<table width="700">
	<tr>
    	<td align="right" bgcolor="<%=value_c%>">
    		<input type="button" value="글쓰기" onclick="window.location='WriteForm.jsp'"/>
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

<div class="contArea mainCont">
					<div class="inner">
						<h2 class="titMain">서양 음식</h2>						
					</div>
</div>						


<%	for (int i = 0 ; i < articleList.size() ; i++) {
    	BoardDataBean article = (BoardDataBean)articleList.get(i);
%>
   <%if (article.getType().equals("서양식") ) {%>	
   <%if(article.getFileName().equals("steak.png")) {%>
 <div> 	
	<ul class="whatsNew" id="menuList" >							

<li><a href="werstern_steak.jsp" onclick="" data-seq="1" data="11F">
								<div class="tmb" ><img src="<%=article.getFileimage()%>" alt="1!"> 
								  </div>				
								<div class="con">
									<strong class="tit">	<%=article.getSubject()%></strong>
								</div>
							</a></li>
	</ul>	    		   		
    </div>  
    	 <%  }%><!-- 스테이크 종료 -->
    <%if(article.getFileName().equals("hotdog.png")) {%>
 <div> 	
	<ul class="whatsNew" id="menuList" >							

<li><a href="werstern_hotdog.jsp" onclick="" data-seq="1" data="11F">
								<div class="tmb" ><img src="<%=article.getFileimage()%>" alt="1!"> 
								  </div>							
								<div class="con">
									<strong class="tit">	<%=article.getSubject()%></strong>
								</div>
							</a></li>
	</ul>	    		   		
    </div>  	
    
     <%  } %> <!-- 핫도그 종료 -->
     <%if(article.getFileName().equals("chilmungo.png")) {%>
 <div> 	
	<ul class="whatsNew" id="menuList" >							

<li><a href="werstern_chilmungo.jsp" onclick="" data-seq="1" data="11F">
								<div class="tmb" ><img src="<%=article.getFileimage()%>" alt="1!"> 
								  </div>						
								<div class="con">
									<strong class="tit">	<%=article.getSubject()%></strong>
								</div>
							</a></li>
	</ul>	    		   		
    </div>  	
    
     <%  } %> <!--칠면조 종료 -->
     
     <a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
      
     <%  } %><!-- 서양식 종료 -->
       	
  <%  } %><!-- for문 종료 -->
  <%  } %><!-- else 종료 -->
    
    
    

 

<%
    if (count > 0) {
        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		 
        int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount;
        
        if (startPage > 10) {    %>
        <a href="list.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
        	<a href="list.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%		}
        if (endPage < pageCount) {  %>
        	<a href="list.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%		}
    }
%>

</center>

</body>
</html>