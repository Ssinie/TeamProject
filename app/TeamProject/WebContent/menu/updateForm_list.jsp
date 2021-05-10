<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "menuboard.BoardDBBean" %>
<%@ page import = "menuboard.BoardDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file="color.jsp"%>

<style>
ul{}
li{margin-bottom:2px; list-style-type:none; margin-right:2px;padding:2px;text-align:center;}
#STATICMENU { positi 7on:absolute;font-size:20; margin: 0pt; padding: 0pt;  position: absolute; right: 0px; top: 0px; background-color:rgba(255,255,255,0.5);
}

</style>

<script type="text/javascript">
 var stmnLEFT = 10; // 오른쪽 여백 
 var stmnGAP1 = 0; // 위쪽 여백 
 var stmnGAP2 = 150; // 스크롤시 브라우저 위쪽과 떨어지는 거리 
 var stmnBASE = 150; // 스크롤 시작위치 
 var stmnActivateSpeed = 35; //스크롤을 인식하는 딜레이 (숫자가 클수록 느리게 인식)
 var stmnScrollSpeed = 20; //스크롤 속도 (클수록 느림)
 var stmnTimer; 
 
 function RefreshStaticMenu() { 
  var stmnStartPoint, stmnEndPoint; 
  stmnStartPoint = parseInt(document.getElementById('STATICMENU').style.top, 10); 
  stmnEndPoint = Math.max(document.documentElement.scrollTop, document.body.scrollTop) + stmnGAP2; 
  if (stmnEndPoint < stmnGAP1) stmnEndPoint = stmnGAP1; 
  if (stmnStartPoint != stmnEndPoint) { 
   stmnScrollAmount = Math.ceil( Math.abs( stmnEndPoint - stmnStartPoint ) / 15 ); 
   document.getElementById('STATICMENU').style.top = parseInt(document.getElementById('STATICMENU').style.top, 10) + ( ( stmnEndPoint<stmnStartPoint ) ? -stmnScrollAmount : stmnScrollAmount ) + 'px'; 
   stmnRefreshTimer = stmnScrollSpeed; 
   }
  stmnTimer = setTimeout("RefreshStaticMenu();", stmnActivateSpeed); 
  } 
 function InitializeStaticMenu() {
  document.getElementById('STATICMENU').style.right = stmnLEFT + 'px';  //처음에 오른쪽에 위치. left로 바꿔도.
  document.getElementById('STATICMENU').style.top = document.body.scrollTop + stmnBASE + 'px'; 
  RefreshStaticMenu();
  }
</script>

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

<body bgcolor="<%=bodyback_c%>" onload="InitializeStaticMenu();" >
<div id="STATICMENU"> 
<ul> 
<li><a href="Korean.jsp?id=<%=id%>">한식</a></li> 
<li><a href="japanese.jsp?id=<%=id%>">일식</a></li> 
<li><a href="western.jsp?id=<%=id%>">서양식</a></li>
</ul> 
</div>

<center><b></b>
<table width="650">
	<tr>
   	
    	<td align="right" bgcolor="<%=value_c%>">
    	
    		<h2 align="center"> 수정 할 게시글을 선택 하세요.</h1>   	
    	</td>
    	<td align="right" >   	
    		<h2 align="center"> <input type="button" value="돌아가기"onclick="window.location='Korean.jsp?id=<%=id %>'"/></h1> 	
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




<table border=1 >
<%	for (int i = 0 ; i < articleList.size(); i++) {
    	BoardDataBean article = (BoardDataBean)articleList.get(i);
%>
<% if(i%3==0 && i!=0) { %> <tr></tr>  <%  } %>
<td>
<a href="updateForm2.jsp?id=<%=id %>&num=<%=article.getNum() %>" >
								<div align="center" ><img src="<%=article.getFileimage()%>"> 
								  </div>							
								<div >
									<li><strong ><%=article.getSubject()%></strong></li>
								</div>
							</a>
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
        <a href="updateForm_list.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
        	<a href="updateForm_list.jsp?pageNum=<%= i %>&id=<%=id%>">[<%= i %>]</a>
<%		}
        if (endPage < pageCount) {  %>
        	<a href="updateForm_list.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%		}
    }
%>

</center>

</body>
</html>