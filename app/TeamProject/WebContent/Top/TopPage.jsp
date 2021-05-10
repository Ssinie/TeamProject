<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<%
// https://amaze9001.tistory.com/69
// https://lcw126.tistory.com/153
// https://uxgjs.tistory.com/202
String id = (String)session.getAttribute("memId");
%>
<script>
	document.onkeydown = trapRefresh;
	function trapRefresh()
	{
		if(event.keyCode == 116){
			event.keyCode = 0;
			event.cancelBubble = true;
			event.returnValue = false;
			document.iframe1.location.reload();
		}
	}
	 
</script>
<head><title>오식당</title>
    <style type="text/css">
	#STATICMENU { positi 7on:absolute;font-size:20; margin: 0pt; padding: 0pt;  position: absolute; right: 0px; top: 0px; background-color:rgba(255,255,255,0.5);
}
</style>
<link rel="stylesheet" href="./index.css">
</head>
<body  >


<header ><a href="/TeamProject/Top/TopPage.jsp"><img src="/TeamProject/Images/Mainlogo.png"  width='170' height='170' ></a></header>
<table  align="right">
		<tr>
		<%if(id==null){ %>
		<td class="t1" align="right"><a href="/TeamProject/Login/Login.jsp" style="color:orange; font-size:1.0em;" >로그인/회원가입</a></td>
		<%}%>
		<%if(id != null){%>
		<td class="t1" align="right"><a href="/TeamProject/Mypage/MypageForm.jsp" style="color:orange; font-size:1.0em;" >내정보</a></td>
		<%}%>
		</tr>
	</table>
<nav>

    <ul>
      <li><a href="/TeamProject/lobby/lobby.jsp" target="iframe1">메인화면</a></li>
      <li><a href="/TeamProject/intro/ceointro.jsp" target="iframe1">가게 소개</a></li>
      <li><a href="/TeamProject/menu/Korean.jsp?id=<%=id %>" target="iframe1">메뉴 소개</a></li>
      <li><a href="/TeamProject/event/list.jsp" target="iframe1">이벤트</a></li>
      <li><a href="/TeamProject/latterBoard/imageList.jsp" target="iframe1">후기 게시판</a></li>
      <li><a href="/TeamProject/Reserve/ReserveForm.jsp" target="iframe1">예약하기</a></li>
      <li><a href="/TeamProject/QABoard/qaBoardList.jsp" target="iframe1">문의사항</a></li>
    </ul>
</nav>
<section id="main">
	<article>
		<iframe name="iframe1" src="/TeamProject/intro/ceointro.jsp" frameborder="0" width="1900" height="1000"></iframe>
	</article>
</section>
</body>
</html>
<%-- 팝업페이지 --%>
<body onload="window.open('/TeamProject/PopUp/popupform.jsp','','width=410px, height=580px')">

    
</body>
</html>

