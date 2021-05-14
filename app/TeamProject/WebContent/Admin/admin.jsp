<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "Reserve.ReserveDAO" %>
<%@ page import = "Reserve.ReserveDTO" %>
<%@ page import = "event.EventBoardDAO" %>
<%@ page import = "event.EventBoardDTO" %>
<%@ page import = "latterboard.LatterBoardDAO" %>
<%@ page import = "latterboard.LatterBoardDTO" %>
<%@ page import = "CSBoard.csDAO" %>
<%@ page import = "CSBoard.csDTO" %>
<%@ page import = "Login.MemberDAO" %>
<%@ page import = "Login.MemberDTO" %>
<%@ page import = "java.util.List" %>

<%
	String id = (String)session.getAttribute("memId");
	//예약
	int rescount = 0;
	ReserveDAO resdao = new ReserveDAO();
	//이벤트
	int evecount = 0;
	EventBoardDAO evedao = new EventBoardDAO();
	//후기
	int latcount = 0;
	LatterBoardDAO latdao = new LatterBoardDAO();
	//CS
	int cscount = 0;
	int csstcount = 0;
	int csstacount = 0;
	csDAO csdao = new csDAO();
	cscount = csdao.getCSBoardCount();
	csstcount = csdao.getCSBoardStatusCount(status);
	csstacount = csdao.getCSBoardStatusCounts(status);
	//회원
	int memcount = 0;
	MemberDAO memdao = new MemberDAO();
%>

<title> Admin </title>

<body bgcolor="white">
<center><h3>관리자 전용 페이지</h3>
<table width="800">
</table>

<table border="1" width="1200" cellpadding="0" cellspacing="0" align="center">
	<tr height="30" bgcolor="dddddd">
		<td align="center"  width="75"  >No.</td>
		<td align="center"  width="450" >LIST</td>
	    <td align="center"  width="175" >COUNT-DAY</td>
	    <td align="center"  width="175" >COUNT-WEEK</td>
	    <td align="center"  width="175" >COUNT-MONTH</td>
	    <td align="center"  width="175" >TOTAL</td>
    </tr>
    	<tr height="30">
    	<td align="center"  width="75" >1</td>
    	<td align="center"  width="450">예약 총 건 수</td>
    	<td align="center"  width="175">-</td>
    	<td align="center"  width="175">-</td>
    	<td align="center"  width="175">-</td>
    	<td align="center"  width="175"><%=rescount%></td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >2</td>
    	<td align="center"  width="450">예약 건 수</td>
    	<td align="center"  width="175">일별 예약 코드</td>
    	<td align="center"  width="175">주간 예약 코드</td>
    	<td align="center"  width="175">월간 예약 코드</td>
    	<td align="center"  width="175">TOTAL</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >3</td>
    	<td align="center"  width="450">후기게시판 총 건 수</td>
    	<td align="center"  width="175">-</td>
    	<td align="center"  width="175">-</td>
    	<td align="center"  width="175">-</td>
    	<td align="center"  width="175"><%=latcount%></td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >4</td>
    	<td align="center"  width="450">후기게시판 한식 건 수</td>
    	<td align="center"  width="175">일일 카운트 코드</td>
    	<td align="center"  width="175">주간 카운트 코드</td>
    	<td align="center"  width="175">월간 카운트 코드</td>
    	<td align="center"  width="175">TOTAL</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >5</td>
    	<td align="center"  width="450">후기게시판 일식 건 수</td>
    	<td align="center"  width="175">일일 카운트 코드</td>
    	<td align="center"  width="175">주간 카운트 코드</td>
    	<td align="center"  width="175">월간 카운트 코드</td>
    	<td align="center"  width="175">TOTAL</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >6</td>
    	<td align="center"  width="450">후기게시판 양식 건 수</td>
    	<td align="center"  width="175">일일 카운트 코드</td>
    	<td align="center"  width="175">주간 카운트 코드</td>
    	<td align="center"  width="175">월간 카운트 코드</td>
    	<td align="center"  width="175">TOTAL</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >7</td>
    	<td align="center"  width="450">문의게시판 총 건 수</td>
    	<td align="center"  width="175">-</td>
    	<td align="center"  width="175">-</td>
    	<td align="center"  width="175">-</td>
    	<td align="center"  width="175"><%=cscount%></td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >8</td>
    	<td align="center"  width="450">문의 게시판 미 답변 건 수</td>
    	<td align="center"  width="175">일일 카운트 코드</td>
    	<td align="center"  width="175">주간 카운트 코드</td>
    	<td align="center"  width="175">월간 카운트 코드</td>
    	<td align="center"  width="175"><%=csstcount%></td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >9</td>
    	<td align="center"  width="450">문의 게시판 답변 완료 건 수</td>
    	<td align="center"  width="175">일일 카운트 코드</td>
    	<td align="center"  width="175">주간 카운트 코드</td>
    	<td align="center"  width="175">월간 카운트 코드</td>
    	<td align="center"  width="175"><%=csstacount%></td>
	</tr>
		<tr height="30">
    	<td align="center"  width="75" >10</td>
    	<td align="center"  width="450">이벤트 게시판 총 건 수</td>
    	<td align="center"  width="175">일일 카운트 코드</td>
    	<td align="center"  width="175">주간 카운트 코드</td>
    	<td align="center"  width="175">월간 카운트 코드</td>
    	<td align="center"  width="175"><%=evecount%></td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >11</td>
    	<td align="center"  width="450">이벤트 게시판 진행중 건 수</td>
    	<td align="center"  width="175">일일 카운트 코드</td>
    	<td align="center"  width="175">주간 카운트 코드</td>
    	<td align="center"  width="175">월간 카운트 코드</td>
    	<td align="center"  width="175">TOTAL</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >12</td>
    	<td align="center"  width="450">이벤트 게시판 종료된 건 수</td>
    	<td align="center"  width="175">일일 카운트 코드</td>
    	<td align="center"  width="175">주간 카운트 코드</td>
    	<td align="center"  width="175">월간 카운트 코드</td>
    	<td align="center"  width="175">TOTAL</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >13</td>
    	<td align="center"  width="450">총 회원 수</td>
    	<td align="center"  width="175">일일 카운트 코드</td>
    	<td align="center"  width="175">주간 카운트 코드</td>
    	<td align="center"  width="175">월간 카운트 코드</td>
    	<td align="center"  width="175"><%=memcount%></td>
	</tr>
		<tr height="30">
    	<td align="center"  width="75" >14</td>
    	<td align="center"  width="450">신규 회원 수</td>
    	<td align="center"  width="175">일일 카운트 코드</td>
    	<td align="center"  width="175">주간 카운트 코드</td>
    	<td align="center"  width="175">월간 카운트 코드</td>
    	<td align="center"  width="175">TOTAL</td>
	</tr>
</table>
</br></br></br>
<table border="1" width="875" cellpadding="0" cellspacing="0" align="center">
	<tr height="30" bgcolor="dddddd">
		<td align="center"  width="75"  >No.</td> 
		<td align="center"  width="450" >게시판 이름</td> 
	    <td align="center"  width="175" >글쓰기 바로가기</td>
	    <td align="center"  width="175" >게시판 바로가기</td> 
    </tr>
    <tr height="30">
    	<td align="center"  width="75" >1</td>
    	<td align="center"  width="450">메뉴 게시판</td>
    	<td align="center"  width="175"><input type="button" value="글쓰기" onclick="window.location='/TeamProject/menu/WriteForm.jsp'"/></td>
    	<td align="center"  width="175"><input type="button" value="바로가기" onclick="window.location='/TeamProject/menu/menupage.jsp'"/></td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >2</td>
    	<td align="center"  width="450">이벤트 게시판</td>
    	<td align="center"  width="175"><input type="button" value="글쓰기" onclick="window.location='/TeamProject/event/WriteForm.jsp'"/></td>
    	<td align="center"  width="175"><input type="button" value="바로가기" onclick="window.location='/TeamProject/event/cardlist.jsp'"/></td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >3</td>
    	<td align="center"  width="450">후기 게시판</td>
    	<td align="center"  width="175"></td>
    	<td align="center"  width="175"><input type="button" value="바로가기" onclick="window.location='/TeamProject/latterBoard/imageList.jsp'"/></td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >4</td>
    	<td align="center"  width="450">1 : 1 문의 게시판</td>
    	<td align="center"  width="175"><input type="button" value="글쓰기" onclick="window.location='/TeamProject/CSBoard/csBoardWrite.jsp'"/></td>
    	<td align="center"  width="175"><input type="button" value="바로가기" onclick="window.location='/TeamProject/CSBoard/csBoardList.jsp'"/></td>
	</tr>
    <tr height="30">
    	<td align="center"  width="75" >5</td>
    	<td align="center"  width="450">자주 묻는 질문 게시판</td>
    	<td align="center"  width="175"><input type="button" value="글쓰기" onclick="window.location='/TeamProject/QABoard/qaBoardWrite.jsp'"/></td>
    	<td align="center"  width="175"><input type="button" value="바로가기" onclick="window.location='/TeamProject/QABoard/qaBoardList.jsp'"/></td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >6</td>
    	<td align="center"  width="450">예약 게시판</td>
    	<td align="center"  width="175"></td>
    	<td align="center"  width="175"><input type="button" value="바로가기" onclick="window.location='/TeamProject/Reserve/ReserveForm.jsp'"/></td>
	</tr>
</table>