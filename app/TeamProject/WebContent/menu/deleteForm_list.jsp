<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "menuboard.BoardDBBean" %>
<%@ page import = "menuboard.BoardDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file="color.jsp"%>

<style>
ul{}
li{margin-bottom:10px; list-style-type:none; margin-right:5px;padding:10px;text-align:center;}
#STATICMENU { position:absolute; margin: 100pt; padding: 0pt;  position: absolute; right: 0px; top: 0px;}
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
String id = (String)session.getAttribute("memid"); //admin 확인

    int pageSize = 10;
  

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


<center><b></b>
<table width="650">
	<tr>
   	
    	<td align="right" bgcolor="<%=value_c%>">
    	
    		<h2 align="center"> 수정 할 게시글을 선택 하세요.</h1>   	
    	</td>
    	<td align="right" >   	
    		<h2 align="center"> <input type="button" value="돌아가기" onclick="history.go(-1)"/></h1>   	
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




<form action="deletePro.jsp" metohd="post" >

<div id="STATICMENU"> 
<ul> 
<li><input type="submit" value="삭제" ></li> 
</ul> 
</div>



<%	for (int i = 0 ; i < articleList.size() ; i++) {
    	BoardDataBean article = (BoardDataBean)articleList.get(i);
%>




<input type="checkbox" name="ch" value="<%=article.getNum()%>"/>
<li class="mystyle">
	<div class="tmb" ><img src="<%=article.getFileimage()%>" alt="1!"> </div>							
</li> 
 			
  <%  } %><!-- for문 종료 -->

  </form> 
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