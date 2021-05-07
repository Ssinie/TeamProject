<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
String id = request.getParameter("id"); //admin 확인
    int pageSize = 9;

    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;


    List articleList = null;
    BoardDBBean dbPro =new BoardDBBean();
    count = dbPro.getArticleCountJ();
    if (count > 0) {
        articleList = dbPro.getArticlesS(startRow, endRow);
    }

	
%>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="<%=bodyback_c%>" onload="InitializeStaticMenu();">

<div id="STATICMENU"> 
<ul> 
<li><a href="Korean.jsp?id=<%=id%>">한식</a></li> 
<li><a href="japanese.jsp?id=<%=id%>">일식</a></li> 
<li><a href="western.jsp?id=<%=id%>">서양식</a></li>
</ul> 
</div>





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
						<h2 class="titMain">서양 음식</h2>						
					</div>
									<%if(id != null){%>
	<input type ="button" value="Mypage" onclick="window.location='/TeamProject/Mypage/MypageForm.jsp'" />
	<input type ="button" value="로그아웃" onclick="window.location='/TeamProject/Login/Logout.jsp'" />

<%}else{%>
	<input type ="button" value="로그인 / 회원가입" onclick="window.location='/TeamProject/Login/Login.jsp'" />
<%} %>	
					<table >
	<tr>
    	<td align="center" bgcolor="<%=value_c%>">
    		<% if(id!=null &&id.equals("admin")){%><!-- 유효성 검사 -->
    		<input type="button" value="글쓰기" onclick="window.location='WriteForm.jsp?id=<%=id%>'"/>
    		<input type="button" value="글수정" onclick="window.location='updateForm_list.jsp?id=<%=id%>'"/>
    		<input type="button" value="글삭제" onclick="window.location='deleteForm_list.jsp?id=<%=id%>'"/>
    		<%} %>
    	</td>
    	
    </tr>
</table>
						
<table border=1  >
<%	for (int i = 0 ; i < articleList.size() ; i++) {
    	BoardDataBean article = (BoardDataBean)articleList.get(i);
%>
   <%if (article.getType().equals("서양식") ) {%>	
<% if(i%3==0 && i!=0) { %> <tr></tr>  <%  } %>   


<td>
						
<a href="content.jsp?num=<%=article.getNum() %>&id=<%=id%>" >
<li class="mystyle"><img src="<%=article.getFileimage()%>"> </li>						 								
<li class="mystyle"><strong ><%=article.getSubject()%></strong></li>		</a>	
		  
   
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
        <a href="western.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
        	<a href="western.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%		}
        if (endPage < pageCount) {  %>
        	<a href="western.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%		}
    }
%>

</center>

</body>
</html>