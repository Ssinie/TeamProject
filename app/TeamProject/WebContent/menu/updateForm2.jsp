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
<body  onload="InitializeStaticMenu();" >
<div id="STATICMENU"> 
<ul> 
<li><a href="Korean.jsp?id=<%=id%>">한식</a></li> 
<li><a href="japanese.jsp?id=<%=id%>">일식</a></li> 
<li><a href="western.jsp?id=<%=id%>">서양식</a></li>
</ul> 
</div>
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
