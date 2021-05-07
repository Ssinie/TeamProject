<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<%
// https://amaze9001.tistory.com/69
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
    ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    background-color: #333;
	}
	ul:after{
    content:'';
    display: block;
    clear:both;
	}
	li {
    float: left;
	}
	li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
	}
	li a:hover:not(.active) {
    background-color: #111;
	}
	.active {
    background-color: #4CAF50;
	}
</style>

</head>
<body>
<header align='center'><a href="/TeamProject/Top/TopPage.jsp"><img src="/TeamProject/Images/Mainlogo.png"  width='170' height='170' ></a></header>
<nav>
<table align="right">
		<tr>
		<td><a href="/TeamProject/Login/Login.jsp" >로그인/회원가입</a></td>
		<%if(id != null){%>
		<td><a href="/TeamProject/Mypage/MypageForm.jsp" align="right ">내정보</a></td>
		<%}%>
		</tr>
	</table>
    <ul>
      <li><a class="active" href="/TeamProject/lobby/lobby.jsp" target="iframe1">메인화면</a></li>
      <li><a href="/TeamProject/intro/ceointro.jsp" target="iframe1">가게 소개</a></li>
      <li><a href="" target="iframe1">메뉴 소개</a></li>
      <li><a href="" target="iframe1">이벤트</a></li>
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

