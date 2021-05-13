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
<script>
function NotScrollTop0__init() {
    let scrollTop = $(window).scrollTop();
    
    if ( scrollTop > 0 ) {
        $('html').addClass('not-scroll-top-0');
    }
    else {
        $('html').removeClass('not-scroll-top-0');
    }
}

$(window).scroll(NotScrollTop0__init);
NotScrollTop0__init();
</script>
<script>
<%-- 팝업페이지 --%>

function popupLoad() {
	if(!document.cookie.includes("todayPop")) { //todayPop 쿠키를 갖고 있지 않으면 팝업을 실행
		window.open('/TeamProject/PopUp/popupform.jsp','','width=410px, height=580px');
	}
}
</script>

<head><title>오식당</title>
    <style type="text/css">
	#STATICMENU { position:absolute; width:100%;font-size:20; margin: 0pt; padding: 0pt;  position: absolute; right: 0px; top: 0px; background-color:rgba(255,255,255,0.5);
}
</style>
<link rel="stylesheet" href="./top.css">
</head>
<body onload="popupLoad()"  >


<header><a href="/TeamProject/Top/TopPage.jsp"><img src="/TeamProject/Images/Mainlogo.png" width='170'  height='170' ></a></header>
<table align="right" >
		<tr>
		<%if(id==null){ %>
		<td class="t1" align="right"><a href="/TeamProject/Login/Login.jsp" style="color:orange; font-size:1.0em;" >로그인/회원가입</a></td>
		<%}%>
		<%if(id != null){%>
		<td class="t2" align="right" ><a href="/TeamProject/Mypage/MypageForm.jsp" style="color:orange; font-size:1.0em;" >내정보</a></td>
		<td class="t2_1" align="right"  ><a href="/TeamProject/Login/Logout.jsp"  style="color:orange; font-size:1.0em;">로그아웃</a></td>
		<%}%>
		</tr>
	</table>




<div class="top-bar text-align-center line-height-0-ch-only ">
    <nav class="menu-box-1 inline-block">
        <ul class="row">
            <li class="cell">
				 <a href="/TeamProject/main/main.jsp"target="iframe1" class="block">메인화면</a>
    				<ul>
                    <li><a href="/TeamProject/main/test.jsp" target="iframe1" class="block">메인2</a></li>
                    
                </ul>
     		</li>
     		<li class="cell">
     			<a href="/TeamProject/intro/ceointro.jsp" target="iframe1"class="block">가게 소개</a>
    				<ul>
                    <li><a href="/TeamProject/intro/location.jsp" target="iframe1"class="block">찾아<br>오시는 길</a></li>
                    <li><a href="/TeamProject/intro/ceointro.jsp" target="iframe1">식당 소개</a></li>
                   
                </ul>
     		</li>
     		<li class="cell">
     			<a href="/TeamProject/menu/Korean.jsp?id=<%=id %>" target="iframe1"class="block">메뉴 소개</a>
    				<ul>
                    <li><a href="/TeamProject/menu/Korean.jsp?id=<%=id %>" target="iframe1" class="block">한식</a></li>
                    <li><a href="/TeamProject/menu/japanese.jsp?id=<%=id %>" target="iframe1" class="block">일식</a></li>
                    <li><a href="/TeamProject/menu/western.jsp?id=<%=id %>" target="iframe1" class="block">양식</a></li>
                    
                </ul>
     		</li>
     		<li class="cell">
     			<a href="/TeamProject/event/cardlist.jsp" target="iframe1"class="block">이벤트 게시판</a>
    				<ul>
                    <li><a href="/TeamProject/event/list.jsp" target="iframe1">진행중인<br>이벤트</a></li>
                  
                </ul>
     		</li>
     		<li class="cell">
     			<a href="/TeamProject/latterBoard/imageList.jsp" target="iframe1"class="block">후기 게시판</a>
    				<ul>
                    <li><a href="#" class="block">2차 메뉴 아이템 1</a></li>
                    
                </ul>
     		</li>
     		<li class="cell">
     			<a href="/TeamProject/Reserve/ReserveForm.jsp" target="iframe1"class="block">예약하기</a>
    				<ul>
                    <li><a href="#" class="block">2차 메뉴 아이템 1</a></li>
                   
                </ul>
     		</li>
     		<li class="cell">
     			<a href="/TeamProject/QABoard/qaBoardList.jsp" target="iframe1"class="block">문의사항</a>
    				<ul>
                    <li><a href="/TeamProject/QABoard/qaBoardList.jsp" target="iframe1">자주묻는질문</a></li>
                    <li><a href="/TeamProject/CSBoard/csBoardList.jsp" target="iframe1">문의접수</a></li>
                  
                </ul>
     		</li>             	            
  </ul>
</nav>
	<div class="menu-box-1-bg"></div>
    <div class="sub-menu-bar-bg"></div>
    
</div>


<div class="body2">
		<iframe name="iframe1" src="/TeamProject/main/main.jsp" frameborder="0" width="100%" height="1100"></iframe><%-- SNS 연동 부분 --%>
<li class="footer_social_listitem footer_instagram">
<a itemprop="sameAs" class="footer_social_listitem_anchor footer_social_listitem_anchor_instagram" target="_blank" href="https://www.instagram.com/5g__restaurant/">
<span class="share_instagram" data-svg="https://studio-jt.co.kr/wp-content/themes/studio_jt/images/layout/share-instagram.svg"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="레이어_1" x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32" style="enable-background:new 0 0 32 32;" xml:space="preserve">
<style type="text/css">
	.st0{fill:#8F8F8F;}
</style>
<path class="st0" d="M25.8,32H6.2C2.8,32,0,29.2,0,25.8V6.2C0,2.8,2.8,0,6.2,0h19.7C29.2,0,32,2.8,32,6.2v19.7  C32,29.2,29.2,32,25.8,32L25.8,32z M6.2,2C3.9,2,2,3.9,2,6.2v19.7C2,28.1,3.9,30,6.2,30h19.7c2.3,0,4.1-1.9,4.1-4.1V6.2  C30,3.9,28.1,2,25.8,2L6.2,2L6.2,2z M16,23.7c-4.2,0-7.7-3.4-7.7-7.7s3.4-7.7,7.7-7.7s7.7,3.4,7.7,7.7S20.2,23.7,16,23.7z M16,10.4  c-3.1,0-5.6,2.5-5.6,5.6s2.5,5.6,5.6,5.6c3.1,0,5.6-2.5,5.6-5.6S19.1,10.4,16,10.4L16,10.4z M26.4,6.4c0-0.7-0.5-1.2-1.2-1.2  s-1.2,0.5-1.2,1.2s0.5,1.2,1.2,1.2S26.4,7.1,26.4,6.4L26.4,6.4z"></path>
</svg></span></a></li>

<li class="footer_social_listitem footer_facebook">
<a itemprop="sameAs" class="footer_social_listitem_anchor footer_social_listitem_anchor_facebook" target="_blank" href="https://www.facebook.com/5GRestaurants/">
<span class="share_facebook" data-svg="https://studio-jt.co.kr/wp-content/themes/studio_jt/images/layout/share-facebook.svg"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="레이어_1" x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32" style="enable-background:new 0 0 32 32;" xml:space="preserve">
<style type="text/css">
	.st0{fill:#8F8F8F;}
</style>
<path class="st0" d="M25.8,32H6.2C2.8,32,0,29.2,0,25.8V6.2C0,2.8,2.8,0,6.2,0h19.7C29.2,0,32,2.8,32,6.2v19.7  C32,29.2,29.2,32,25.8,32L25.8,32z M6.2,2C3.9,2,2,3.9,2,6.2v19.7C2,28.1,3.9,30,6.2,30h19.7c2.3,0,4.1-1.9,4.1-4.1V6.2  C30,3.9,28.1,2,25.8,2L6.2,2L6.2,2z M19.1,11.4c-0.4-0.1-0.9-0.1-1.3-0.1c-0.9,0-1,0.4-1,1v1.1h2.3L19,15.7h-2.1v7.1H14v-7.1h-1.5  v-2.3H14V12c0-2,0.9-3.1,3.2-3.1c0.8,0,1.4,0.1,2.2,0.3L19.1,11.4L19.1,11.4z"></path>
</svg></span></a></li>
</div>




</body>


</html>













