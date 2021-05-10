<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1> 메뉴 글쓰기</h1>
<style>
li{margin-bottom:2px;  margin-right:2px;padding:2px;text-align:center;}
li.mystyle{margin-bottom:2px; list-style-type:none; margin-right:2px;padding:2px;text-align:center;}
#STATICMENU { positi 7on:absolute;font-size:20; margin: 0pt; padding: 0pt;  position: absolute; right: 0px; top: 0px; background-color:rgba(255,255,255,0.5);
}
</style>

<script>
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
function Check(){
	var subject =document.inform.subject.value; 
	var name =document.inform.name.value; 
	if(subject=="" ){
		alert("제목을 입력하세요.");
		document.inform.subject.focus();
		return false;
	}else if(name==""){
		alert("메뉴 이름을 입력하세요.");
		document.inform.name.focus();
		return false;
	}
}

</script>
<%String id = request.getParameter("id");  //admin 확인 %>
<body  onload="InitializeStaticMenu();" >
<div id="STATICMENU"> 
<ul> 
<li><a href="Korean.jsp?id=<%=id%>">한식</a></li> 
<li><a href="japanese.jsp?id=<%=id%>">일식</a></li> 
<li><a href="western.jsp?id=<%=id%>">서양식</a></li>
</ul> 
</div>


 <form name="inform" action="WritePro.jsp" method="post" onsubmit="return Check();" enctype="multipart/form-data" >
<table border="1"  width="300">
<tr><td>		
  메뉴 이름: <input type="text" name="subject"/><br/>
 </td></tr>
 
   <tr><td>
 음식 종류: <select name="type">
					<option>한식</option>
					<option>일식</option>
					<option>서양식</option>
 </select>
 <br/>
</td></tr>
 <tr><td>
 내용:<textarea rows="20" cols="50" name="content"/> </textarea><br/>
   </td></tr>
 <tr><td>	
 파일:<input type="file" name="file"/><br/>
   </td></tr>
 <tr><td>	
  <input type="hidden" name="id" value="<%=id %>"> 
 <input type="submit" value="확인"/>
   </td></tr>
 </table>
</form>
</body>