<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String id = (String)session.getAttribute("memId"); %>    
<input type ="button" value="가게 소개" onclick="window.location='/TeamProject/intro/ceointro.jsp'" />
<input type ="button" value="메뉴 소개" onclick="window.location='/TeamProject/intro/ceointro.jsp'" />
<input type ="button" value="후기 소개" onclick="window.location='/TeamProject/latterBoard/imageList.jsp'" />
<input type ="button" value="문의 사항" onclick="window.location='/TeamProject/intro/ceointro.jsp'" />
<input type ="button" value="예약하기" onclick="window.location='/TeamProject/Reserve/ReserveForm.jsp'" />
<input type ="button" value="이벤트" onclick="window.location='/TeamProject/event/list.jsp'" />
<input type ="button" value="Q&A" onclick="window.location='/TeamProject/CSBoard/csBoardList.jsp'" />
<input type ="button" value="자주묻는질문" onclick="window.location='/TeamProject/QABoard/qaAdmin.jsp'" />

<%
	if(id != null){%>
	<input type ="button" value="Mypage" onclick="window.location='/TeamProject/Mypage/MypageForm.jsp'" />
	<input type ="button" value="로그아웃" onclick="window.location='/TeamProject/Login/Logout.jsp'" />

<%}else{%>
	<input type ="button" value="로그인 / 회원가입" onclick="window.location='/TeamProject/Login/Login.jsp'" />
<%} %>

